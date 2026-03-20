#!/bin/bash
# Script to check if OBS is running
if pgrep -x "obs" > /dev/null; then
    echo '{"text": "● REC", "class": "recording"}'
else
    echo '{"text": "", "class": ""}'
fi
