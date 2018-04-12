require "graphql/client"
require "graphql/client/http"
require "json"
require 'set'
require 'pp'

MAX_PAGES = 999

module GithubRepositories
  GITHUB_API_TOKEN = ENV['GITHUB_API_TOKEN']
  CACHE_REPO_DATA = ENV['CACHE_REPO_DATA'] == 'Y'

  unless GITHUB_API_TOKEN
    raise "You must set a GITHUB_API_TOKEN variable to query github"
  end

  HTTP = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
    def headers(context)
      {"Authorization" => "token #{GITHUB_API_TOKEN}"}
    end
  end

  unless File.exist? "github_schema.json"
    puts "Querying and saving github graphql schema data to github_schema.json"
    GraphQL::Client.dump_schema(HTTP, "github_schema.json")
  end

  SCHEMA = GraphQL::Client.load_schema("github_schema.json")

  CLIENT = GraphQL::Client.new(schema: SCHEMA, execute: HTTP)

  REPO_QUERY = CLIENT.parse <<-'GRAPHQL'
query($cursor: String) {
  organization(login:"alphagov") {
    repositories(first:100, after: $cursor, isLocked: false) {
      pageInfo {
        endCursor
      }
      edges {
        node {
          ... on Repository {
            name
            description
            hasWikiEnabled
            isArchived
            isFork
            isPrivate
						languages(first: 100) {
						  edges {
						    node {
                  name
						    }
						  }
						}
            primaryLanguage {
              name
            }
            pushedAt
            repositoryTopics(first:100) {
              edges {
                node {
                  topic {
                    name
                  }
                }
              }
            }
            url
            sshUrl
          }
        }
      }
    }
  }
}
  GRAPHQL

  TEAM_REPO_QUERY = CLIENT.parse <<-'GRAPHQL'
query($team: String!, $cursor: String) {
  organization(login: "alphagov") {
    name
    team(slug: $team) {
      repositories(first:100, after: $cursor) {
        pageInfo {
          endCursor
        }
        edges {
          node {
            name
          }
        }
      }
    }
  }
}
  GRAPHQL

  class RepositoryScanner
    VERIFY_TEAM = "team-identity-assurance"

    def initialize
      @all_repositories_cache = nil
      wildcards = %w(verify-* ida-* dropwizard-* dcs-* eidas-* doc-checking gatling puppet-collectd stscreds rmq-lib)
      @wildcard_patterns = wildcards
                               .map {|s| s.gsub("*", ".*")}
                               .map {|s| Regexp.new("^#{s}$")}
    end

    def all_repositories
      if @all_repositories
        return @all_repositories
      end
      if CACHE_REPO_DATA && File.exists?("all_repositories_cache.json")
        $stderr.puts "reading cache from all_repositories_cache.json - remove this file to refresh from github"
        @all_repositories = JSON.parse(File.read("all_repositories_cache.json"))
      else
        $stderr.puts "querying github for all top-level repository info"
        @all_repositories = get_all_repositories_from_github
        if CACHE_REPO_DATA
          File.open("all_repositories_cache.json", "w") do |f|
            $stderr.puts "caching all repositories to all_repositories_cache.json"
            f.write(JSON.pretty_generate(@all_repositories))
          end
        end
      end
      @all_repositories
    end

    def team_repositories()
      get_team_repositories_from_github(VERIFY_TEAM)
    end

    def is_verify_repo_by_name(repository_name)
      @wildcard_patterns.any? {|re| re =~ repository_name}
    end

    def get_wildcard_repositories()
      all_repositories.map {|r| r["name"]}
          .select {|name| is_verify_repo_by_name(name)}
    end

    def self.repo_topics(repo)
      repo["repositoryTopics"]["edges"].map {|e| e["node"]["topic"]["name"]}
    end

    def verify_repositories()
      all = all_repositories
      team = Set.new(team_repositories)
      all.select {|repo|
        is_verify_repo_by_name(repo["name"]) || team.include?(repo["name"]) || RepositoryScanner::repo_topics(repo).include?("verify")
      }.select {|repo| repo["isArchived"] != true}
          .map {|repo|
            topics = RepositoryScanner::repo_topics(repo).sort
            isVerifyByTeam = team.include?(repo["name"])
            isVerifyByName = is_verify_repo_by_name(repo["name"])
            isVerifyByTopic = topics.include?("verify")
            if !isVerifyByTeam
              $stderr.puts "repo #{repo["name"]} is not in the #{VERIFY_TEAM} team!"
            end
            if !isVerifyByTopic
              $stderr.puts "repo #{repo["name"]} does not have the topic 'verify'"
            end

            {
                name: repo["name"],
                githubData: {
                    description: repo["description"],
                    isFork: repo["isFork"],
                    isPrivate: repo["isPrivate"],
                    url: repo["url"],
                    sshUrl: repo["sshUrl"],
                    topics: topics,
                },
                flags: {
                },
            }
          }.sort_by {|repo| repo["name"]}
    end

    def checking_query(query, variables, *properties)
      response = CLIENT.query(query, variables: variables)
      unless response.errors.empty?
        raise response.errors.inspect
      end
      rval = response.data.to_h.dig(*properties.map {|p| p.to_s})
      unless rval
        puts "can't find nested field #{properties.join(',')} in query with params:"
        pp variables
        puts "response was:"
        pp response.data.to_h
        raise "No response entry for nested keys #{properties.join(',')}"
      end
      rval
    end

    def paginated_query(query, variables, *properties)
      pages = 1
      response = checking_query(query, variables, *properties)
      edges = response["edges"]
      # response["edges"] is edges - we can concatinate them.
      unless edges
        raise "response has no edges - was query wrong?"
      end
      # response["pageInfo"] is metadata
      end_cursor = response["pageInfo"]["endCursor"]
      while end_cursor
        pages += 1
        if pages > MAX_PAGES
          $stderr.puts "bailing after #{pages} pages"
          break
        end
        vars_plus_cursor = variables.dup
        vars_plus_cursor[:cursor] = end_cursor
        response = checking_query(query, vars_plus_cursor, *properties)
        next_edges = response["edges"]
        unless next_edges
          raise "response has no edges - was query wrong?"
        end
        edges = edges + next_edges
        end_cursor = response["pageInfo"]["endCursor"]
      end
      edges.map {|e| e["node"]}
    end

    def get_all_repositories_from_github()
      paginated_query(REPO_QUERY, {}, :organization, :repositories)
    end

    def get_team_repositories_from_github(team_slug)
      response = paginated_query(TEAM_REPO_QUERY, {team: team_slug}, :organization, :team, :repositories)
      response.map {|result| result["name"]}
    end

  end

end

if __FILE__ == $0
# code run if this is called as a script
  scanner = GithubRepositories::RepositoryScanner.new()

  puts JSON.pretty_generate(scanner.verify_repositories)

end
