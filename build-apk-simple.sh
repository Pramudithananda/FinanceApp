#!/bin/bash

# Simple APK Build Script - දැනට තියෙන project එකට
# මුදල් කළමනාකරණ යෙදුම

echo "🚀 සරල APK Build Script"
echo ""

# පළමුව React Native project එකක් initialize කරන්න ඕන නම් පරීක්ෂා කරමු
if [ ! -d "android" ]; then
    echo "⚠️  android/ folder එක නැහැ"
    echo ""
    echo "විකල්පය 1: මම React Native project එකක් create කරන්නද? (y/n)"
    read -p "Enter choice: " choice
    
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        echo ""
        echo "🔧 React Native project එකක් initialize කරනවා..."
        
        # Backup current files
        echo "📦 දැනට තියෙන files backup කරනවා..."
        mkdir -p ../finance-app-backup
        cp -r src package.json app.json index.js ../finance-app-backup/
        
        # Initialize new React Native project
        cd ..
        npx react-native init FinanceManagementApp --version 0.73.0
        
        if [ $? -eq 0 ]; then
            echo "✅ React Native project එක create කළා"
            
            # Restore our files
            echo "📋 අපේ files restore කරනවා..."
            cp -r finance-app-backup/* FinanceManagementApp/
            
            echo ""
            echo "✅ සාර්ථකයි! දැන් මේ commands run කරන්න:"
            echo ""
            echo "  cd ../FinanceManagementApp"
            echo "  npm install react-native-vector-icons"
            echo "  npm run android"
            echo ""
            echo "APK build කරන්න:"
            echo "  cd android"
            echo "  ./gradlew assembleRelease"
            echo ""
        else
            echo "❌ Project initialization අසාර්ථකයි"
            exit 1
        fi
    else
        echo ""
        echo "📚 Manual steps:"
        echo ""
        echo "1. නව folder එකක React Native project එකක් create කරන්න:"
        echo "   npx react-native init FinanceApp --version 0.73.0"
        echo ""
        echo "2. අපේ files copy කරන්න:"
        echo "   cd FinanceApp"
        echo "   cp /workspace/src/App.js ./src/"
        echo "   cp /workspace/package.json ./"
        echo ""
        echo "3. Dependencies install කරන්න:"
        echo "   npm install"
        echo "   npm install react-native-vector-icons"
        echo ""
        echo "4. APK build කරන්න:"
        echo "   cd android"
        echo "   ./gradlew assembleRelease"
        echo ""
        exit 0
    fi
else
    echo "✅ android/ folder එක තියෙනවා"
    echo ""
    echo "🔨 APK build කරනවා..."
    
    cd android
    ./gradlew clean
    ./gradlew assembleRelease
    
    if [ $? -eq 0 ]; then
        cd ..
        APK_PATH="android/app/build/outputs/apk/release/app-release.apk"
        
        if [ -f "$APK_PATH" ]; then
            # Copy to workspace root with Sinhala name
            cp "$APK_PATH" "මුදල්-කළමනාකරණ-v1.0.apk"
            
            echo ""
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "✅ සාර්ථකයි! APK build සම්පූර්ණයි!"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
            echo "📱 APK File:"
            echo "   $(pwd)/මුදල්-කළමනාකරණ-v1.0.apk"
            echo ""
            echo "ප්‍රමාණය: $(du -h මුදල්-කළමනාකරණ-v1.0.apk | cut -f1)"
            echo ""
            echo "📥 Phone එකට install කරන්න:"
            echo "   1. APK file එක phone එකට transfer කරන්න"
            echo "   2. File එක tap කරන්න"
            echo "   3. Install කරන්න"
            echo ""
        else
            echo "❌ APK file එක හොයාගන්න බැහැ"
            exit 1
        fi
    else
        cd ..
        echo "❌ Build අසාර්ථකයි"
        exit 1
    fi
fi
