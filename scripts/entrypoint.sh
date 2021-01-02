#!/bin/bash
# 
# - $1 — Sticker name
# - $2 — Emoji
# - $3 — Sticker pack owner

export STICKER_SET=$1
export STICKER_FILE=$2
export EMOJI=$3
export OWNER_ID=$4
export TOKEN=$5
export TITLE=$6

${BASH_SOURCE%/*}/convert.sh
${BASH_SOURCE%/*}/upload.sh