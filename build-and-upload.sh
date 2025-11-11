#!/bin/bash

# Build and Upload APK Script
# This script builds the APK and uploads it to Catbox

set -e

echo "🚀 Building Finance App APK..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Please run this script from the project root directory"
    exit 1
fi

# Check if Android SDK is available
if [ -z "$ANDROID_HOME" ] && [ ! -d "$HOME/Android/Sdk" ]; then
    echo "⚠️  ANDROID_HOME not set. Trying to use default location..."
    export ANDROID_HOME="$HOME/Android/Sdk"
fi

# Navigate to android directory
cd android

# Make gradlew executable
chmod +x gradlew

# Clean previous builds
echo "🧹 Cleaning previous builds..."
./gradlew clean || echo "⚠️  Clean failed, continuing..."

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
    
    # Upload to Catbox
    echo "📤 Uploading to Catbox..."
    CATBOX_URL=$(curl -s -F "reqtype=fileupload" -F "fileToUpload=@$APK_PATH" https://catbox.moe/user/api.php)
    
    if [ ! -z "$CATBOX_URL" ]; then
        echo ""
        echo "🎉 APK uploaded successfully!"
        echo "📥 Download Link: $CATBOX_URL"
        echo ""
        echo "$CATBOX_URL" > ../catbox_url.txt
        echo "Link saved to catbox_url.txt"
    else
        echo "⚠️  Upload failed, but APK is available at: FinanceApp-release.apk"
    fi
else
    echo "❌ APK not found at expected location: $APK_PATH"
    exit 1
fi

cd ..

echo "🎉 Build and upload complete!"
