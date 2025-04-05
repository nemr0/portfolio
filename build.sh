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

curl -fsSL https://fvm.app/install.sh | bash
export PATH="$PATH:$HOME/.pub-cache/bin"

# Install Flutter 3.29.2 from the stable channel (if not already installed)
fvm install 3.29.2 --channel=stable

# Set the project to use Flutter 3.29.2
fvm use 3.29.2

# Run Flutter commands via FVM
fvm flutter doctor
fvm flutter clean
fvm flutter config --enable-web

# Build the Flutter web app (include any dart-define flags if needed)
fvm flutter build web --release