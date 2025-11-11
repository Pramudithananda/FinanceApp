# 📱 APK Build Instructions

## Current APK Download
**Link:** https://files.catbox.moe/i0w41b.apk

## Building a New APK

### Prerequisites
1. **Android Studio** installed with Android SDK
2. **Java JDK** (version 11 or higher)
3. **Node.js** (v16 or higher)
4. **React Native CLI**

### Setup Steps

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Set Android Environment Variables**
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/tools/bin
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

3. **Build APK**

   **Option 1: Using the build script**
   ```bash
   ./build-apk.sh
   ```

   **Option 2: Manual build**
   ```bash
   cd android
   ./gradlew clean
   ./gradlew assembleRelease
   ```

4. **Find the APK**
   The APK will be located at:
   ```
   android/app/build/outputs/apk/release/app-release.apk
   ```

### Upload to Catbox

After building, upload to catbox:
```bash
curl -F "reqtype=fileupload" -F "fileToUpload=@android/app/build/outputs/apk/release/app-release.apk" https://catbox.moe/user/api.php
```

### Alternative: Using React Native CLI

```bash
npx react-native build-android --mode=release
```

### Troubleshooting

**Issue: Gradle not found**
- Make sure Android Studio is installed
- Run `cd android && ./gradlew` to download Gradle wrapper

**Issue: SDK not found**
- Open Android Studio
- Go to SDK Manager
- Install Android SDK Platform 33
- Install Android SDK Build-Tools

**Issue: Build fails**
- Clean build: `cd android && ./gradlew clean`
- Delete `node_modules` and reinstall: `rm -rf node_modules && npm install`
- Clear Metro cache: `npm start -- --reset-cache`

## Quick Build Command

```bash
# One-liner build and upload
cd android && ./gradlew assembleRelease && cd .. && \
curl -F "reqtype=fileupload" \
     -F "fileToUpload=@android/app/build/outputs/apk/release/app-release.apk" \
     https://catbox.moe/user/api.php
```
