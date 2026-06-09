#!/bin/bash
# snapshot.sh — runs once during /warm to build the snapshot baseline.
# Output of this script is what gets baked into the persisted snapshot.
# Edit this file, then commit and push to keep changes.
# See also: .calude/boot.sh (runs after every snapshot restore).
set -euo pipefail

cat > .calude/mise.toml <<'EOF'
[tools]
java = "17"
EOF

calude-mise-sync

chmod +x ./gradlew

./gradlew --no-daemon dependencies || true