#!/bin/sh

# Check for shallow clone and fetch full history if needed
if [ -f "$(git rev-parse --git-dir)/shallow" ]; then
  echo "Shallow clone detected. Fetching full history..."
  git fetch --unshallow
fi

# If there is only one commit, proceed with build.
if [ "$(git rev-list --count HEAD)" -lt 2 ]; then
  echo "Not enough commits to compare. Proceeding with build."
else
  # Compare the last two commits to determine what files have changed.
  CHANGED_FILES=$(git diff --name-only HEAD^ HEAD)
  echo "Changed files: $CHANGED_FILES"

  # Check if any of the changes are in the relevant directories or files.
  if ! echo "$CHANGED_FILES" | grep -Eq '^(lib/|assets/|web/|pubspec\.yaml|build\.sh)$'; then
    echo "No relevant changes detected. Skipping build."
    exit 0
  fi
fi

# Clone Flutter SDK version 3.29.2 if it doesn't exist; otherwise, ensure the version is correct.
if [ ! -d "flutter" ]; then
  echo "Flutter SDK not found. Cloning version 3.29.2..."
  git clone -b 3.29.2 https://github.com/flutter/flutter.git
else
  echo "Flutter SDK already exists. Ensuring version 3.29.2..."
  cd flutter && git fetch && git checkout 3.29.2 && cd ..
fi


# keeping the base version (e.g., 1.0.0) intact.

# Get the current commit count from Git
COMMIT_COUNT=$(git rev-list --count HEAD)
echo "Current commit count: $COMMIT_COUNT"

# Update pubspec.yaml:
# This sed command finds the version line which is expected to be in one of these formats:
#   version: 1.0.0
#   version: 1.0.0+<some_number>
# It then replaces the build number with the commit count.
sed -i.bak -E "s/^(version:[[:space:]]*[0-9]+\.[0-9]+\.[0-9]+)(\+[0-9]+)?/\1+$COMMIT_COUNT/" pubspec.yaml

# Remove the backup file created by sed (optional)
rm pubspec.yaml.bak

# Echo the updated version from pubspec.yaml
NEW_VERSION=$(grep '^version:' pubspec.yaml)
echo "Updated full version: $NEW_VERSION"
# Set Flutter executable path.
FLUTTER_BIN=./flutter/bin/flutter

# Run Flutter commands.
$FLUTTER_BIN channel stable
$FLUTTER_BIN doctor
$FLUTTER_BIN clean
$FLUTTER_BIN config --enable-web

# Build the Flutter web app with dart-define for secrets.
$FLUTTER_BIN build web --release
