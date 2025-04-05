#!/bin/sh

# Check for shallow clone and fetch full history if needed
if [ -f "$(git rev-parse --git-dir)/shallow" ]; then
  echo "Shallow clone detected. Fetching full history..."
  git fetch --unshallow
fi

# Check if there are multiple commits in the repository
if [ "$(git rev-list --count HEAD)" -lt 2 ]; then
  echo "Not enough commits to compare. Proceeding with build."
fi

# Clone Flutter SDK version 3.29.2 if it doesn't exist
if [ ! -d "flutter" ]; then
  echo "Flutter SDK not found. Cloning version 3.29.2..."
  git clone -b 3.29.2 https://github.com/flutter/flutter.git
else
  echo "Flutter SDK already exists. Ensuring version 3.29.2..."
  cd flutter && git fetch && git checkout 3.29.2 && cd ..
fi



# Set Flutter executable path
FLUTTER_BIN=./flutter/bin/flutter

# Run Flutter commands
$FLUTTER_BIN channel stable
$FLUTTER_BIN doctor
$FLUTTER_BIN clean
$FLUTTER_BIN config --enable-web

# Build the Flutter web app with dart-define for secrets
$FLUTTER_BIN build web --release