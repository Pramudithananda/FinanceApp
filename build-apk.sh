#!/bin/bash

# මුදල් කළමනාකරණ App - APK Build Script
# APK build කරලා download link එක ලබාගන්න

set -e

echo "🚀 මුදල් කළමනාකරණ App - APK Build"
echo "=================================="
echo ""

# Check if EAS CLI is installed
if ! command -v eas &> /dev/null; then
    echo "❌ EAS CLI install කරලා නැහැ!"
    echo "📦 Installing EAS CLI..."
    npm install -g eas-cli
fi

# Check if logged in
if ! eas whoami &> /dev/null; then
    echo "🔐 Expo account හරහා login කරන්න..."
    eas login
fi

echo ""
echo "📦 APK build start කරනවා..."
echo "⏳ මේකට මිනිත්තු 15-20 ක් ගත වෙනවා..."
echo ""

# Build APK
BUILD_OUTPUT=$(eas build --platform android --profile preview --non-interactive 2>&1)

# Extract build ID from output
BUILD_ID=$(echo "$BUILD_OUTPUT" | grep -oP 'https://expo.dev/artifacts/\K[^/]+' | head -1)

if [ -z "$BUILD_ID" ]; then
    # Try alternative method
    echo "🔍 Build ID search කරනවා..."
    sleep 5
    BUILD_ID=$(eas build:list --platform android --limit 1 --json 2>/dev/null | grep -oP '"id":"\K[^"]+' | head -1)
fi

if [ -z "$BUILD_ID" ]; then
    echo "⚠️  Build ID automatically detect කරන්න බැරි වුනා"
    echo "📋 Build list check කරන්න:"
    eas build:list --platform android --limit 5
    echo ""
    echo "🔗 Latest build එකේ download link එක:"
    echo "   https://expo.dev/accounts/$(eas whoami 2>/dev/null | grep -oP '@\K[^ ]+' || echo 'your-username')/projects/finance-app-mobile/builds"
    exit 0
fi

echo ""
echo "✅ Build started successfully!"
echo "📦 Build ID: $BUILD_ID"
echo ""
echo "⏳ Build complete වෙනකල් ඉන්නවා..."

# Monitor build status
MAX_ATTEMPTS=40
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    sleep 30
    ATTEMPT=$((ATTEMPT + 1))
    
    STATUS=$(eas build:view "$BUILD_ID" --json 2>/dev/null | grep -oP '"status":"\K[^"]+' | head -1 || echo "building")
    
    echo "📊 Status check $ATTEMPT/$MAX_ATTEMPTS: $STATUS"
    
    if [ "$STATUS" = "finished" ]; then
        echo ""
        echo "🎉 Build Complete!"
        echo "=================================="
        echo "📱 APK Download Link:"
        echo "   https://expo.dev/artifacts/$BUILD_ID"
        echo ""
        echo "🔗 Alternative: Expo Dashboard"
        echo "   https://expo.dev/accounts/$(eas whoami 2>/dev/null | grep -oP '@\K[^ ]+' || echo 'your-username')/projects/finance-app-mobile/builds"
        echo ""
        exit 0
    elif [ "$STATUS" = "errored" ] || [ "$STATUS" = "canceled" ]; then
        echo ""
        echo "❌ Build Failed: $STATUS"
        echo "📋 Error details check කරන්න:"
        echo "   eas build:view $BUILD_ID"
        exit 1
    fi
done

echo ""
echo "⏱️  Timeout - Build තවම complete වෙලා නැහැ"
echo "📦 Build ID: $BUILD_ID"
echo "🔗 Status check කරන්න:"
echo "   eas build:view $BUILD_ID"
echo ""
echo "🔗 Download link (build complete වුනාට පස්සේ):"
echo "   https://expo.dev/artifacts/$BUILD_ID"
