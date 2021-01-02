# Telegram sticker action

This action uploads/replace your SVG sticker into Telegram sticker set.

## Inputs

### `stickerSet`

Name of sticker set to use. Should be ended with `_By_<BotName>` according to official documentation.

### `stickerFile`

Path to SVG file for uploading as sticker.

### `emoji`

Emoji symbol for sticker in sticker set.

### `ownerId`

Identifier of user in Telegram which owns specified sticker set.

### `token`

Token of Telegram bot which will be used for uploading.

### `title`
Title of sticker set

## Example usage

```yaml
uses: underoot/telegram-sticker-action@v1
  with:
    stickerSet: 'ChannelStatisticsByAwesomeBot'
    stickerFile: 'dist/sticker.svg'
    emoji: '❤️'
    ownerId: ${{ secrets.OWNER_ID }}
    token: ${{ secrets.TOKEN }}
    title: 'Awesome Sticker Set'
```