#!/bin/sh

# Check for shallow clone and fetch full history if needed
if [ -f "$(git rev-parse --git-dir)/shallow" ]; then
  echo "Shallow clone detected. Fetching full history..."
  git fetch --unshallow
fi

# Check for changes in ./portfolio_admin or ./portfolio_shared
if git rev-parse HEAD >/dev/null 2>&1; then
  # Repository has at least one commit, check for changes
  if [ "$(git rev-list --count HEAD)" -lt 2 ]; then
    echo "Not enough commits to compare. Proceeding with build."
  else
    if ! git diff --name-only HEAD~1 HEAD | grep -E "^(portfolio_admin|portfolio_shared)/" > /dev/null; then
      echo "No changes detected in ./portfolio_admin or ./portfolio_shared. Skipping build."
      exit 0
    fi
  fi
else
  # No commits yet; assume changes exist to proceed
  echo "No previous commits found. Proceeding with build."
fi

# Clone Flutter SDK version 3.29.0 if it doesn't exist
if [ ! -d "flutter" ]; then
  echo "Flutter SDK not found. Cloning version 3.29.0..."
  git clone -b 3.29.0 https://github.com/flutter/flutter.git
else
  echo "Flutter SDK already exists. Ensuring version 3.29.0..."
  cd flutter && git fetch && git checkout 3.29.0 && cd ..
fi

# List directory contents (optional)
# ls

# Change to the project directory
cd portfolio_admin || exit

# Set Flutter executable path
FLUTTER_BIN=../flutter/bin/flutter

# Run Flutter commands
$FLUTTER_BIN doctor
$FLUTTER_BIN clean
$FLUTTER_BIN config --enable-web

# Build the Flutter web app with dart-define for secrets
$FLUTTER_BIN build web --release \
  --dart-define=CLOUDFLARE_ACCOUNT_ID="$CLOUDFLARE_ACCOUNT_ID" \
  --dart-define=CLOUDFLARE_TOKEN="$CLOUDFLARE_TOKEN" \
  --no-tree-shake-icons
