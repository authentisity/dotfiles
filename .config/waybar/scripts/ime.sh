#!/bin/bash

LAST_STATUS=""

while true; do
    CURRENT_STATUS=$(fcitx5-remote)

    if [ "$CURRENT_STATUS" != "$LAST_STATUS" ]; then
        if [ "$CURRENT_STATUS" = "2" ]; then
            echo '{"text": "拼", "class": "pinyin"}'
        else
            echo '{"text": "en", "class": ""}'
        fi
        LAST_STATUS="$CURRENT_STATUS"
    fi

    sleep 0.1
done
