#!/usr/bin/env bash
cd "$(dirname "$0")"
python3 -m http.server 8898 &
sleep 1
open "http://127.0.0.1:8898" 2>/dev/null || xdg-open "http://127.0.0.1:8898" 2>/dev/null || start "http://127.0.0.1:8898" 2>/dev/null
wait
