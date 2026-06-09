#!/bin/bash
# boot.sh — runs after every snapshot restore in /invoke.
# Boots services, reconciles drift via the `changed` helper, then runs
# long-lived (typically `bin/dev &` + `wait`).
# Edit this file, then commit and push to keep changes.
# See also: .calude/snapshot.sh (runs once when the snapshot is built).
set -euo pipefail

chmod +x ./gradlew

changed build.gradle settings.gradle gradle.properties 'HtmlTextView/build.gradle' 'example/build.gradle' && ./gradlew --no-daemon dependencies || true

wait