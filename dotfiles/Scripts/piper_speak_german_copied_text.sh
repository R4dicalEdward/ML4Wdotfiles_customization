#!/bin/bash

# Get text from clipboard and replace newlines with spaces
TEXT=$(wl-paste | sed -e ':a;N;$!ba;s/-\n//g' -e 's/\n/ /g' | tr -s ' ')


# Check if text is empty
if [ -z "$TEXT" ]; then
    echo "No text found in clipboard for TTS."
    exit 1
fi

# Piper TTS command
echo "$TEXT" | piper-tts --model /usr/share/piper-voices/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw -
