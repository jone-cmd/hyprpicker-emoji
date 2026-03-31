#!/usr/bin/env bash
sed -i '/^### DATA ###$/q' hyprpicker-emoji

curl https://raw.githubusercontent.com/muan/emojilib/v4.0.2/dist/emoji-en-US.json |
  jq --raw-output '. | to_entries | .[] | .key + " " + (.value | join(" ") | sub("_"; " "; "g"))' \
    >>hyprpicker-emoji
