#!/bin/bash

echo "🚀 Starting APK Build Process for Account Manager App"
echo "=================================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

# Check if Android SDK is available
if [ -z "$ANDROID_HOME" ]; then
    echo "❌ ANDROID_HOME is not set. Please set up Android SDK."
    echo "   You can download Android Studio and set ANDROID_HOME to the SDK location."
    exit 1
fi

echo "✅ Environment check passed"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Install React Native CLI globally if not installed
if ! command -v react-native &> /dev/null; then
    echo "📦 Installing React Native CLI..."
    npm install -g @react-native-community/cli
fi

# Clean previous builds
echo "🧹 Cleaning previous builds..."
cd android
./gradlew clean
cd ..

# Build APK
echo "🔨 Building APK..."
cd android
./gradlew assembleRelease

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ APK build successful!"
    
    # Copy APK to project root
    cp app/build/outputs/apk/release/app-release.apk ../AccountManager.apk
    
    echo "📱 APK file created: AccountManager.apk"
    echo "📁 Location: $(pwd)/../AccountManager.apk"
    echo ""
    echo "🎉 Build completed successfully!"
    echo "📱 You can now install the APK on your Android device"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Enable 'Install from Unknown Sources' on your Android device"
    echo "   2. Transfer AccountManager.apk to your device"
    echo "   3. Install the APK file"
    echo ""
    echo "🔗 APK Download Link:"
    echo "   file://$(pwd)/../AccountManager.apk"
    
else
    echo "❌ APK build failed!"
    echo "Please check the error messages above and try again."
    exit 1
fi

cd ..