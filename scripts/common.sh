#!/bin/bash

function emoji_to_codepoint {
  echo -n $1 \
  | iconv -f UTF8 -t UTF-32BE \
  | xxd -p \
  | sed -r 's/^0+/0x/' \
  | xargs printf '\\u%04X\n' \
  | tr '[:upper:]' '[:lower:]'
}

function make_api_request {
  local method=$1
  shift

  local arr=( "$@" )
  local base=https://api.telegram.org/bot$TOKEN
  local parameters=""
  local request_parameters=""
  local param_start="-"

  for i in ${!arr[@]}; do
    local start_symbol=${arr[$i]:0:1};

    if [[ $param_start = $start_symbol ]]; then
      request_parameters="$request_parameters${arr[$i]}" 
      shift
      continue;
    fi

    local prefix=`if [[ $i -eq 0 ]]; then echo "?"; else echo "&"; fi`
    parameters="$parameters$prefix${arr[$i]}"
    shift
  done

  curl -s $request_parameters "$base/$method$parameters" 
}