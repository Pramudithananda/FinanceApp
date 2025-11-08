#!/bin/bash
# Script to build new APK from source code

set -e

echo "🔨 Building new APK from source code..."
echo ""

cd "$(dirname "$0")"

# Check if we can use React Native CLI
if command -v npx &> /dev/null; then
    echo "📦 Using React Native CLI to build..."
    
    # Try to build with React Native
    echo "Building Android APK..."
    cd android
    
    # Use Java 17 if available, or try with current Java
    export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk-amd64}
    
    if [ ! -d "$JAVA_HOME" ]; then
        echo "⚠️  Java 17 not found, trying current Java..."
        export JAVA_HOME=""
    fi
    
    ./gradlew assembleDebug --no-daemon || {
        echo "⚠️  Gradle build failed, trying alternative method..."
        exit 1
    }
    
    if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
        echo ""
        echo "✅ New APK built successfully!"
        echo "📱 Location: $(pwd)/app/build/outputs/apk/debug/app-debug.apk"
        ls -lh app/build/outputs/apk/debug/app-debug.apk
        exit 0
    fi
fi

echo "❌ Build failed. Please check the error messages above."
exit 1
