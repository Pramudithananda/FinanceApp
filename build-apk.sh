#!/bin/bash

# ????? ???????? APK Build Script
# This script builds the APK file for the app

set -e

echo "?? Starting APK build process..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "? Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "? Java is not installed. Please install JDK 11+ first."
    exit 1
fi

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "?? Installing npm dependencies..."
    npm install
fi

# Create a debug keystore if it doesn't exist
if [ ! -f "android/app/debug.keystore" ]; then
    echo "?? Creating debug keystore..."
    cd android/app
    keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Android Debug,O=Android,C=US"
    cd ../..
fi

# Build the APK
echo "?? Building APK..."
cd android
./gradlew assembleRelease

if [ $? -eq 0 ]; then
    APK_PATH="app/build/outputs/apk/release/app-release.apk"
    if [ -f "$APK_PATH" ]; then
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        OUTPUT_NAME="../?????_????????_${TIMESTAMP}.apk"
        cp "$APK_PATH" "$OUTPUT_NAME"
        echo ""
        echo "? APK build successful!"
        echo "?? APK location: $OUTPUT_NAME"
        echo ""
        echo "To install on your device:"
        echo "  adb install $OUTPUT_NAME"
        echo ""
        cd ..
    else
        echo "? APK file not found at $APK_PATH"
        cd ..
        exit 1
    fi
else
    echo "? APK build failed!"
    cd ..
    exit 1
fi
