#!/bin/bash

# Build APK Script for Finance App
# This script builds a release APK for the React Native app

set -e

echo "🚀 Building Finance App APK..."

# Check if Android SDK is available
if [ -z "$ANDROID_HOME" ]; then
    echo "❌ ANDROID_HOME is not set. Please set it to your Android SDK path."
    echo "   Example: export ANDROID_HOME=/path/to/android/sdk"
    exit 1
fi

# Navigate to android directory
cd android

# Clean previous builds
echo "🧹 Cleaning previous builds..."
./gradlew clean

# Build release APK
echo "📦 Building release APK..."
./gradlew assembleRelease

# Check if APK was created
APK_PATH="app/build/outputs/apk/release/app-release.apk"
if [ -f "$APK_PATH" ]; then
    echo "✅ APK built successfully!"
    echo "📱 APK location: $(pwd)/$APK_PATH"
    
    # Copy to workspace root with a friendly name
    cp "$APK_PATH" "../FinanceApp-release.apk"
    echo "✅ APK copied to: FinanceApp-release.apk"
else
    echo "❌ APK not found at expected location: $APK_PATH"
    exit 1
fi

cd ..

echo "🎉 Build complete!"
