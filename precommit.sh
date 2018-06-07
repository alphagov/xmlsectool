#!/bin/bash -eu

command -v jq >/dev/null 2>&1 || { echo >&2 "You need jq installed to run this."; exit 1; }

echo "parsing users.json"

jq '. | { parsed: "ok" }' users.json

echo "testing unique fields"

function check_unique_field() {
  local all_vals
  local unique_vals
  if [ $# -ne 2 ]; then
    echo "invalid arguments"
    exit 1
  fi

  filename=$1
  fieldname=$2

  all_vals=$(jq -r ".[].$fieldname" $filename | wc -l)
  unique_vals=$(jq -r ".[].$fieldname" $filename | sort | uniq | wc -l)

  if [ "$all_vals" != "$unique_vals" ]; then
    echo "There are non-unique values of \"$fieldname\" in the $filename file:"
    diff <(jq -r ".[].$fieldname" $filename | sort) <(jq -r ".[].$fieldname" $filename | sort | uniq)
    exit -1
  fi
}

function check_unique_array_field() {
  local all_vals
  local unique_vals
  if [ $# -ne 2 ]; then
    echo "invalid arguments"
    exit 1
  fi

  filename=$1
  fieldname=$2

  all_vals=$(jq -r "[.[].$fieldname] | flatten | .[]" $filename | wc -l)
  unique_vals=$(jq -r "[.[].$fieldname] | flatten | .[]" $filename | sort | uniq | wc -l)

  if [ "$all_vals" != "$unique_vals" ]; then
    echo "There are non-unique values of \"$fieldname\" in the $filename file:"
    diff <(jq -r "[.[].$fieldname] | flatten | .[]" $filename | sort) <(jq -r "[.[].$fieldname] | flatten | .[]" $filename | sort | uniq)
    exit -1
  fi
}

check_unique_field 'users.json' 'gds_name'
check_unique_field 'users.json' 'preferred_name'
check_unique_array_field 'users.json' 'emails'
check_unique_array_field 'users.json' 'names'

echo "parsing repositories.json"

jq '. | { parsed: "ok" }' repositories.json

check_unique_field 'repositories.json' 'name'

echo "all ok."
