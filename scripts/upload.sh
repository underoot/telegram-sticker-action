#!/bin/bash

. ${BASH_SOURCE%/*}/common.sh

ADD_METHOD=$([[ `make_api_request getStickerSet "name=$STICKER_SET" | grep "\"ok\":false" | wc -l` -eq 1 ]] && echo createNewStickerSet || echo addStickerToSet)

if [[ $ADD_METHOD -eq 'addStickerToSet' ]]; then
  REPLACED_STICKER_FILE=`make_api_request getStickerSet "name=$STICKER_SET" | jq -r "[.result.stickers[] | select(.emoji==\"$EMOJI\")][0].file_id"`

  make_api_request deleteStickerFromSet \
    "sticker=$REPLACED_STICKER_FILE"
fi

make_api_request $ADD_METHOD \
  "user_id=$OWNER_ID" \
  "title=$TITLE" \
  "name=$STICKER_SET" \
  "emojis=$EMOJI" \
  "-F png_sticker=@/tmp/sticker.png"