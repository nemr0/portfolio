#!/bin/sh

# Clone or update Flutter SDK
if [ -d "flutter" ]; then
  cd flutter && git pull && cd ..
else
  git clone https://github.com/flutter/flutter.git
fi

# List directory contents (optional)
#ls

# Change to the project directory
cd portfolio_admin

# Set Flutter executable path
FLUTTER_BIN=../flutter/bin/flutter

# Run Flutter commands
$FLUTTER_BIN doctor
$FLUTTER_BIN clean
$FLUTTER_BIN config --enable-web
$FLUTTER_BIN build web --web-renderer canvaskit --release
