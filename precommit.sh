#!/bin/bash -eu

command -v jq >/dev/null 2>&1 || { echo >&2 "You need jq installed to run this."; exit 1; }

echo "parsing users.json"

jq '. | { parsed: "ok" }' users.json

echo "testing unique fields"

function check_unique_field() {
  local all_vals
  local unique_vals
  if [ $# -ne 1 ]; then
    echo "invalid arguments"
    exit 1
  fi

  all_vals=$(jq -r ".[].$1" users.json | wc -l)
  unique_vals=$(jq -r ".[].$1" users.json | sort | uniq | wc -l)

  if [ "$all_vals" != "$unique_vals" ]; then
    echo "There are non-unique values of \"$1\" in the users.json file:"
    diff <(jq -r ".[].$1" users.json | sort) <(jq -r ".[].$1" users.json | sort | uniq)
    exit -1
  fi
}

function check_unique_array_field() {
  local all_vals
  local unique_vals
  if [ $# -ne 1 ]; then
    echo "invalid arguments"
    exit 1
  fi

  all_vals=$(jq -r "[.[].$1] | flatten | .[]" users.json | wc -l)
  unique_vals=$(jq -r "[.[].$1] | flatten | .[]" users.json | sort | uniq | wc -l)

  if [ "$all_vals" != "$unique_vals" ]; then
    echo "There are non-unique values of \"$1\" in the users.json file:"
    diff <(jq -r "[.[].$1] | flatten | .[]" users.json | sort) <(jq -r "[.[].$1] | flatten | .[]" users.json | sort | uniq)
    exit -1
  fi
}

check_unique_field 'slack_id'
check_unique_field 'slack_name'
check_unique_array_field 'emails'
check_unique_array_field 'names'

echo "all ok."
