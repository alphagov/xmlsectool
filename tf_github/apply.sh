#!/usr/bin/env bash

set -euo pipefail

echo "${TF_VAR_github_token:?Please set the TF_VAR_github_token environment variable}" >/dev/null

echo "Terraforming teams"
terraform plan -target=module.verify_teams -out verify_teams.tfplan
terraform apply verify_teams.tfplan

echo "Terraforming the rest"
terraform plan -out rest.tfplan
terraform apply rest.tfplan
