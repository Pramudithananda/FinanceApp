#!/bin/bash
# Script to properly rebuild and sign APK

set -e

echo "🔧 Fixing APK installation issue..."
echo ""

cd "$(dirname "$0")"

# Method 1: Try to use apksigner if available
if command -v apksigner &> /dev/null; then
    echo "Using apksigner to sign..."
    apksigner sign --ks android/app/debug.keystore --ks-pass pass:android --key-pass pass:android --ks-key-alias androiddebugkey final_signed_app.apk
    exit 0
fi

# Method 2: Rebuild from source properly
echo "Attempting to build from source..."
cd android

# Clean build
./gradlew clean

# Build debug APK
./gradlew assembleDebug

if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
    echo "✅ Successfully built APK from source!"
    cp app/build/outputs/apk/debug/app-debug.apk ../properly_built_app.apk
    echo "📱 APK location: $(pwd)/../properly_built_app.apk"
    exit 0
fi

echo "❌ Build failed"
exit 1
