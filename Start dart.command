#!/bin/bash
# Starter dart-siderne på http://localhost:8765, så Chrome kan huske mikrofon-tilladelsen
cd "$(dirname "$0")"
PORT=8765
if ! lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
  sleep 1
fi
URL="http://localhost:$PORT/scorer.html"
open -a "Google Chrome" "$URL" 2>/dev/null || open "$URL"
echo "Dart kører på http://localhost:$PORT  (scorer.html og index.html)"
echo "Luk dette vindue når I er færdige."
wait
