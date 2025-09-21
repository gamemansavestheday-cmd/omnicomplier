#!/bin/bash
# SPDX-FileCopyrightText: 2025 Micheal
# SPDX-License-Identifier: GPL-3.0-or-later
# Check that source files contain SPDX header
set -euo pipefail

MISSING=0
for f in $(git ls-files '*.sh' '*.py' '*.js' '*.c' '*.cpp' 2>/dev/null); do
  if ! grep -q "SPDX-License-Identifier" "$f"; then
    echo "Missing SPDX header in: $f"
    MISSING=1
  fi
done

if [ "$MISSING" -eq 1 ]; then
  echo "One or more files are missing SPDX headers."
  exit 1
fi

echo "All checked files have SPDX headers."
