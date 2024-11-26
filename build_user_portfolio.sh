#!/bin/sh

# Clone or update Flutter SDK
#if [ -d "flutter" ]; then
#  cd flutter && git pull && cd ..
#else
  git clone -b 3.24.5 https://github.com/flutter/flutter.git
#fi

# List directory contents (optional)
#ls

# Change to the project directory
cd portfolio_user

# Set Flutter executable path
FLUTTER_BIN=../flutter/bin/flutter

# Run Flutter commands
$FLUTTER_BIN doctor
$FLUTTER_BIN clean
$FLUTTER_BIN config --enable-web
# Build the Flutter web app with dart-define for secrets
$FLUTTER_BIN build web --web-renderer canvaskit --release \
  --dart-define=CLOUDFLARE_ACCOUNT_ID=$CLOUDFLARE_ACCOUNT_ID \
  --dart-define=CLOUDFLARE_TOKEN=$CLOUDFLARE_TOKEN \
  --no-tree-shake-icons