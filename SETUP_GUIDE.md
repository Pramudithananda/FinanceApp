# 🚀 Complete Setup Guide - ස්ථාපන මාර්ගෝපදේශය

This guide will help you set up the Finance Management App on your development machine step by step.

## 📋 Prerequisites Checklist

Before starting, make sure you have:

### Required for All Platforms:
- [ ] Node.js 18+ installed ([Download](https://nodejs.org/))
- [ ] npm or yarn package manager
- [ ] Git installed
- [ ] A code editor (VS Code recommended)

### For Android Development:
- [ ] Android Studio installed
- [ ] Java Development Kit (JDK) 11+
- [ ] Android SDK installed
- [ ] ANDROID_HOME environment variable set
- [ ] Android device or emulator

### For iOS Development (Mac only):
- [ ] macOS computer
- [ ] Xcode installed from App Store
- [ ] Xcode Command Line Tools
- [ ] CocoaPods installed
- [ ] iOS Simulator or physical iPhone

---

## 🔧 Step 1: Install Node.js

### Windows/Mac/Linux:

1. Visit [nodejs.org](https://nodejs.org/)
2. Download the LTS version (18.x or higher)
3. Run the installer
4. Verify installation:
```bash
node --version
npm --version
```

---

## 🤖 Step 2: Setup Android Environment

### Install Android Studio:

1. **Download Android Studio**
   - Visit: https://developer.android.com/studio
   - Download the latest version
   - Install with default settings

2. **Install Android SDK**
   - Open Android Studio
   - Go to: Settings → Appearance & Behavior → System Settings → Android SDK
   - Select SDK Platforms tab
   - Check: Android 13.0 (Tiramisu) or latest
   - Select SDK Tools tab
   - Check:
     - Android SDK Build-Tools
     - Android SDK Platform-Tools
     - Android Emulator
     - Intel x86 Emulator Accelerator (HAXM)
   - Click "Apply" to install

3. **Setup Environment Variables**

   **Windows:**
   ```bash
   # Add to System Environment Variables:
   ANDROID_HOME = C:\Users\YourUsername\AppData\Local\Android\Sdk
   
   # Add to Path:
   %ANDROID_HOME%\platform-tools
   %ANDROID_HOME%\emulator
   %ANDROID_HOME%\tools
   %ANDROID_HOME%\tools\bin
   ```

   **Mac/Linux:**
   ```bash
   # Add to ~/.bash_profile or ~/.zshrc:
   export ANDROID_HOME=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/tools/bin
   
   # Apply changes:
   source ~/.bash_profile  # or source ~/.zshrc
   ```

4. **Create Android Virtual Device (AVD)**
   - Open Android Studio
   - Click: Tools → Device Manager
   - Click: Create Device
   - Select: Pixel 5 or any modern device
   - Select: System Image (Android 13 or latest)
   - Click: Finish

5. **Verify Installation**
   ```bash
   adb --version
   ```

---

## 🍎 Step 3: Setup iOS Environment (Mac Only)

### Install Xcode:

1. **Install Xcode**
   - Open Mac App Store
   - Search for "Xcode"
   - Click "Get" / "Install"
   - Wait for installation (takes time, it's large)

2. **Install Xcode Command Line Tools**
   ```bash
   xcode-select --install
   ```

3. **Install CocoaPods**
   ```bash
   sudo gem install cocoapods
   
   # Verify installation
   pod --version
   ```

4. **Accept Xcode License**
   ```bash
   sudo xcodebuild -license accept
   ```

---

## 📦 Step 4: Install React Native CLI

```bash
# Install globally
npm install -g react-native-cli

# Verify installation
react-native --version
```

---

## 🏗️ Step 5: Setup Project

### Clone and Install:

```bash
# Navigate to your projects folder
cd ~/projects

# Clone repository (or your repo URL)
git clone <your-repo-url>
cd workspace

# Install dependencies
npm install

# For iOS (Mac only) - Install pods
cd ios && pod install && cd ..
```

### Link Vector Icons:

```bash
# Auto-link native dependencies
npx react-native link react-native-vector-icons

# For Android, manually add to android/app/build.gradle if needed:
# apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"
```

---

## ▶️ Step 6: Run the App

### Run on Android:

```bash
# Start Metro bundler (in terminal 1)
npm start

# In a new terminal (terminal 2)
# Start Android emulator first, then:
npm run android
```

**Troubleshooting Android:**
- If emulator doesn't start: Open Android Studio → Device Manager → Start AVD
- If build fails: `cd android && ./gradlew clean && cd ..`
- If metro cache issues: `npm start -- --reset-cache`

### Run on iOS (Mac only):

```bash
# Start Metro bundler (in terminal 1)
npm start

# In a new terminal (terminal 2)
npm run ios
```

**Troubleshooting iOS:**
- If build fails: `cd ios && pod install && cd ..`
- If simulator doesn't open: `npx react-native run-ios --simulator="iPhone 14"`
- Clean build: `cd ios && xcodebuild clean && cd ..`

---

## 🔨 Step 7: Building APK

### Debug APK:
```bash
cd android
./gradlew assembleDebug
cd ..

# APK location:
# android/app/build/outputs/apk/debug/app-debug.apk
```

### Release APK:
```bash
cd android
./gradlew assembleRelease
cd ..

# APK location:
# android/app/build/outputs/apk/release/app-release.apk
```

**Note:** Release APK needs to be signed for production. See Android documentation for keystore setup.

---

## 🐛 Common Issues & Solutions

### Issue: "SDK location not found"
**Solution:**
```bash
# Create android/local.properties file:
sdk.dir = /Users/YourUsername/Library/Android/sdk  # Mac
# or
sdk.dir = C:\\Users\\YourUsername\\AppData\\Local\\Android\\Sdk  # Windows
```

### Issue: "Unable to load script from assets"
**Solution:**
```bash
# Clear cache and restart
npm start -- --reset-cache

# In another terminal
npm run android
```

### Issue: "Execution failed for task ':app:installDebug'"
**Solution:**
```bash
# Check device connection
adb devices

# If device is unauthorized, check phone for authorization prompt
```

### Issue: Vector Icons not showing
**Solution:**
```bash
# Re-link icons
npx react-native link react-native-vector-icons

# Clean and rebuild
cd android && ./gradlew clean && cd ..
npm run android
```

### Issue: Metro bundler port already in use
**Solution:**
```bash
# Kill Metro
npx react-native start --reset-cache

# Or kill port 8081
# Mac/Linux:
lsof -ti:8081 | xargs kill -9

# Windows:
netstat -ano | findstr :8081
taskkill /PID <PID> /F
```

---

## 📱 Testing on Physical Device

### Android:
1. Enable Developer Options on phone:
   - Settings → About Phone → Tap "Build Number" 7 times
2. Enable USB Debugging:
   - Settings → Developer Options → USB Debugging
3. Connect phone via USB
4. Run: `npm run android`

### iOS (Mac only):
1. Connect iPhone via USB
2. Open Xcode → Select your device
3. Configure signing in Xcode
4. Run: `npm run ios`

---

## ✅ Verification Steps

After setup, verify everything works:

```bash
# Check Node
node --version  # Should show v18.x.x or higher

# Check npm
npm --version   # Should show 9.x.x or higher

# Check React Native
react-native --version

# Check Android (if on path)
adb --version

# Check iOS (Mac only)
xcodebuild -version

# Check project dependencies
cd workspace
npm list react-native
```

---

## 🎉 You're Ready!

If all steps completed successfully, you should now have:
- ✅ Development environment setup
- ✅ Project dependencies installed
- ✅ App running on emulator/simulator
- ✅ Ready to start development

## 📚 Next Steps

1. Read the main [README.md](README.md) for features
2. Explore the code in `src/App.js`
3. Make your first change and see hot reload in action
4. Check out the Future Enhancements section for ideas

---

## 💡 Tips

- Use `npm start -- --reset-cache` if you see weird caching issues
- Keep Android Studio and Xcode updated
- Use `console.log()` for debugging
- Install React Native Debugger for better debugging experience
- Join React Native community on Discord/Reddit for help

---

**සාර්ථක දියුණුවක් වේවා! (Good luck with development!)**
