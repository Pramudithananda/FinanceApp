# 📱 APK Build Instructions - මුදල් කළමනාකරණ App

## 🚀 Quick APK Generation

### Method 1: Local Build (Requires Android SDK)

1. **Prerequisites:**
   ```bash
   # Install Node.js (version 16 or higher)
   # Install Android Studio and Android SDK
   # Set ANDROID_HOME environment variable
   ```

2. **Build APK:**
   ```bash
   chmod +x build-apk.sh
   ./build-apk.sh
   ```

3. **APK Location:**
   - `BudgetTrackerApp.apk` (in project root)
   - `android/app/build/outputs/apk/release/app-release.apk`

### Method 2: Online Build Services (Recommended)

#### Option A: EAS Build (Expo)
1. Go to [expo.dev](https://expo.dev)
2. Create account and new project
3. Upload your code
4. Build APK online
5. Download APK directly

#### Option B: GitHub Actions
1. Push code to GitHub repository
2. Create `.github/workflows/build-apk.yml`:
   ```yaml
   name: Build APK
   on: [push]
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
         - name: Setup Node.js
           uses: actions/setup-node@v2
           with:
             node-version: '16'
         - name: Install dependencies
           run: npm install
         - name: Setup Java
           uses: actions/setup-java@v2
           with:
             java-version: '11'
         - name: Setup Android SDK
           uses: android-actions/setup-android@v2
         - name: Build APK
           run: |
             cd android
             ./gradlew assembleRelease
         - name: Upload APK
           uses: actions/upload-artifact@v2
           with:
             name: app-release
             path: android/app/build/outputs/apk/release/app-release.apk
   ```

#### Option C: Codemagic
1. Go to [codemagic.io](https://codemagic.io)
2. Connect your GitHub repository
3. Configure React Native build
4. Build and download APK

### Method 3: One-Click APK Generation

#### Using APK Builder Services:

1. **APK Builder Online:**
   - Upload your React Native project
   - Select Android platform
   - Build APK in the cloud
   - Download when ready

2. **Appetize.io:**
   - Upload your code
   - Generate APK
   - Get download link

3. **PhoneGap Build (if using PhoneGap):**
   - Upload project
   - Build for Android
   - Download APK

## 📋 APK Features

- **App Name:** මුදල් කළමනාකරණ (Budget Tracker)
- **Package:** com.budgettrackerapp
- **Version:** 1.0.0
- **Target SDK:** Android 12+
- **Min SDK:** Android 21 (Android 5.0)

## 🔧 Troubleshooting

### Common Issues:

1. **"ANDROID_HOME not set"**
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

2. **"Gradle build failed"**
   - Check Java version (should be 11 or 17)
   - Clean project: `cd android && ./gradlew clean`
   - Try: `npx react-native run-android`

3. **"SDK not found"**
   - Install Android Studio
   - Install Android SDK through SDK Manager
   - Set ANDROID_HOME environment variable

## 📱 Installation Instructions

1. **Enable Unknown Sources:**
   - Go to Settings > Security
   - Enable "Install from unknown sources"

2. **Install APK:**
   - Transfer APK to your device
   - Tap on the APK file
   - Follow installation prompts

3. **Launch App:**
   - Find "මුදල් කළමනාකරණ" in app drawer
   - Tap to launch

## 🌐 Online APK Download Links

### Quick Build Services:

1. **EAS Build:** https://expo.dev
2. **Codemagic:** https://codemagic.io
3. **Bitrise:** https://bitrise.io
4. **GitHub Actions:** Use the workflow above

### APK Hosting:

1. **Google Drive:** Upload APK and share link
2. **Dropbox:** Upload and create public link
3. **GitHub Releases:** Create release with APK
4. **Firebase Hosting:** Host APK for download

## 📊 App Information

- **Size:** ~15-25 MB
- **Permissions:** Internet (for future features)
- **Storage:** Local data storage only
- **Language:** Sinhala (සිංහල)
- **Features:** 
  - Bank balance tracking
  - Cash management
  - Expense categorization
  - Transaction history
  - Budget planning

## 🆘 Support

If you encounter any issues:

1. Check the troubleshooting section above
2. Verify all prerequisites are installed
3. Try the online build services
4. Check React Native documentation

## 🎯 Next Steps

After building the APK:

1. Test on different Android devices
2. Upload to Google Play Store (if desired)
3. Set up automatic builds
4. Add app signing for production
5. Implement app updates

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*