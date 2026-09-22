#!/usr/bin/env bash
set -euo pipefail

# Deploy current directory directly (no build step needed)
OUTPUT=$(netlify deploy --prod --dir . --json)

# Parse output URL safely
LIVE_URL=$(echo "$OUTPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('url',''))" 2>/dev/null || true)

if [[ -n "$LIVE_URL" ]]; then
  echo ""
  echo "Deployed to: $LIVE_URL"
fi
