#!/bin/bash

# Get text from clipboard and replace newlines with spaces
#TEXT=$(wl-paste | sed -e ':a;N;$!ba;s/-\n//g' -e 's/\n/ /g' | tr -s ' ')
TEXT=$(wl-paste)

# Check if text is empty
# Fallback text if nothing was provided
if [ -z "$TEXT" ]; then
    TEXT="No text found in clipboard for TTS."
fi


PIPER_ENV=~/Projects/dotfiles/personal_dotfiles/python-envs/piper-tts
PIPER_BIN="$PIPER_ENV/bin/piper"
PIPER_MODEL="$PIPER_ENV/piper-voices/en_US-hfc_female-medium.onnx"

# Piper TTS command
echo "$TEXT" | "$PIPER_BIN" --model "$PIPER_MODEL" --output-raw \
  | aplay -r 22050 -f S16_LE -t raw -