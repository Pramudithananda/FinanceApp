#!/bin/bash
# Script to build APK for Financial App

set -e

echo "🚀 Building Financial App APK..."
echo ""

# Check prerequisites
echo "📋 Checking prerequisites..."

if ! command -v java &> /dev/null; then
    echo "❌ Java not found. Please install Java JDK."
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js."
    exit 1
fi

echo "✅ Java: $(java -version 2>&1 | head -1)"
echo "✅ Node.js: $(node --version)"
echo ""

# Check Android SDK
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  ANDROID_HOME not set. Trying common locations..."
    if [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_HOME="$HOME/Android/Sdk"
        echo "✅ Found Android SDK at $ANDROID_HOME"
    else
        echo "❌ Android SDK not found. Please install Android Studio and set ANDROID_HOME."
        echo "   Or set: export ANDROID_HOME=\$HOME/Android/Sdk"
        exit 1
    fi
else
    echo "✅ ANDROID_HOME: $ANDROID_HOME"
fi

# Navigate to project directory
cd "$(dirname "$0")"

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install --legacy-peer-deps
fi

# Ensure debug keystore exists
if [ ! -f "android/app/debug.keystore" ]; then
    echo "🔐 Creating debug keystore..."
    keytool -genkey -v -keystore android/app/debug.keystore \
        -storepass android -alias androiddebugkey -keypass android \
        -keyalg RSA -keysize 2048 -validity 10000 \
        -dname "CN=Android Debug,O=Android,C=US"
fi

# Build APK
echo ""
echo "🔨 Building APK..."
cd android

# Make gradlew executable
chmod +x gradlew

# Build debug APK
./gradlew assembleDebug

# Check if APK was created
APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
    APK_SIZE=$(ls -lh "$APK_PATH" | awk '{print $5}')
    echo ""
    echo "✅ APK built successfully!"
    echo "📱 Location: $(pwd)/$APK_PATH"
    echo "📦 Size: $APK_SIZE"
    echo ""
    echo "To install on device:"
    echo "  adb install $APK_PATH"
else
    echo "❌ APK build failed. Check the error messages above."
    exit 1
fi
