# 📦 APK File එක Build කරන්නේ කොහොමද?

## මුදල් කළමනාකරණ Mobile App - APK Build Guide

---

## 🎯 Overview

මේ guide එකෙන් ඔබට **installable APK file එකක්** build කරගන්න පුළුවන්.

---

## ⚠️ IMPORTANT: පළමුව කරන්න

React Native project එකේ **native folders** (android/ios) තිබිය යුතුයි. මේවා auto-generate නොවෙන නිසා, පළමුව React Native CLI භාවිතා කර project එක initialize කරන්න ඕන.

---

## 📋 STEP 1: Native Project Folders Generate කරන්න

### Option A: නව Project එකක් සාදන්න (Recommended)

```bash
# 1. React Native CLI install කරන්න (global)
npm install -g react-native-cli

# 2. නව project එකක් create කරන්න
npx react-native init MudalKalamanakarna --version 0.72.6

# 3. ඔබගේ code copy කරන්න
cd MudalKalamanakarna

# 4. Source files copy කරන්න
# /workspace/src folder එක copy කරන්න මෙතැනට
# /workspace/App.js copy කරන්න මෙතැනට
# /workspace/package.json dependencies copy කරන්න

# 5. Dependencies install කරන්න
npm install @react-navigation/native @react-navigation/bottom-tabs
npm install @react-native-async-storage/async-storage
npm install react-native-vector-icons
npm install react-native-safe-area-context react-native-screens

# 6. Android files link කරන්න
cd android
./gradlew clean
cd ..
```

### Option B: Expo භාවිතයෙන් (Alternative - Easier)

```bash
# 1. Expo CLI install කරන්න
npm install -g expo-cli

# 2. Expo project එකක් create කරන්න
npx create-expo-app MudalKalamanakarna --template blank

# 3. ඔබගේ code copy කරන්න

# 4. EAS Build සඳහා configure කරන්න
npm install -g eas-cli
eas login
eas build:configure

# 5. APK build කරන්න
eas build --platform android --profile preview
```

---

## 📋 STEP 2: Android Configuration

### 1. android/app/build.gradle Edit කරන්න

```gradle
android {
    compileSdkVersion 33
    
    defaultConfig {
        applicationId "com.mudalkalmanakarna"
        minSdkVersion 21
        targetSdkVersion 33
        versionCode 1
        versionName "2.0.0"
    }
    
    buildTypes {
        release {
            minifyEnabled false
            shrinkResources false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### 2. Vector Icons Setup

```bash
# android/app/build.gradle හි add කරන්න:
apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"
```

### 3. AsyncStorage Setup

```bash
# android/settings.gradle හි verify කරන්න:
include ':@react-native-async-storage_async-storage'
project(':@react-native-async-storage_async-storage').projectDir = new File(rootProject.projectDir, '../node_modules/@react-native-async-storage/async-storage/android')
```

---

## 📋 STEP 3: APK Build කරන්න

### Method 1: Debug APK (Testing සඳහා)

```bash
# Project root folder එකේ
cd android

# Debug APK build කරන්න
./gradlew assembleDebug

# APK location:
# android/app/build/outputs/apk/debug/app-debug.apk
```

### Method 2: Release APK (Distribution සඳහා)

```bash
# Project root folder එකේ
cd android

# Release APK build කරන්න
./gradlew assembleRelease

# APK location:
# android/app/build/outputs/apk/release/app-release.apk
```

### Method 3: Signed Release APK (Play Store සඳහා)

#### A. Keystore Generate කරන්න

```bash
cd android/app

# Keystore create කරන්න
keytool -genkeypair -v -storetype PKCS12 \
  -keystore my-release-key.keystore \
  -alias my-key-alias \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000

# Password සහ details ඇතුළත් කරන්න
# Password: mudalapp2024 (example)
# දත්ත සුරකින්න!
```

#### B. Gradle Configure කරන්න

```bash
# android/gradle.properties හි add කරන්න:
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=mudalapp2024
MYAPP_RELEASE_KEY_PASSWORD=mudalapp2024
```

```gradle
// android/app/build.gradle හි add කරන්න:
signingConfigs {
    release {
        if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {
            storeFile file(MYAPP_RELEASE_STORE_FILE)
            storePassword MYAPP_RELEASE_STORE_PASSWORD
            keyAlias MYAPP_RELEASE_KEY_ALIAS
            keyPassword MYAPP_RELEASE_KEY_PASSWORD
        }
    }
}

buildTypes {
    release {
        signingConfig signingConfigs.release
        minifyEnabled true
        shrinkResources true
        proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    }
}
```

#### C. Signed APK Build කරන්න

```bash
cd android
./gradlew assembleRelease

# Signed APK location:
# android/app/build/outputs/apk/release/app-release.apk
```

---

## 📋 STEP 4: APK File Download කරගන්න

### Method 1: Direct Copy (Local Build නම්)

```bash
# APK file එක copy කරන්න
cp android/app/build/outputs/apk/release/app-release.apk ~/Desktop/MudalKalamanakarna.apk

# හෝ specific location එකක්:
cp android/app/build/outputs/apk/release/app-release.apk /path/to/download/folder/
```

### Method 2: ADB භාවිතයෙන් Phone එකට Send කරන්න

```bash
# Phone එක USB connect කරන්න
adb devices

# APK install කරන්න phone එකට
adb install android/app/build/outputs/apk/release/app-release.apk

# හෝ phone එකේ download folder එකට copy කරන්න
adb push android/app/build/outputs/apk/release/app-release.apk /sdcard/Download/
```

### Method 3: Cloud Upload කරන්න

```bash
# Google Drive, Dropbox, හෝ any cloud service එකට upload කරන්න
# Then share link එක use කරන්න download කරගන්න
```

---

## 🔧 Build Errors විසඳන්නේ කොහොමද?

### Error 1: "SDK location not found"

```bash
# android/local.properties create කරන්න:
echo "sdk.dir=/path/to/Android/sdk" > android/local.properties

# Mac/Linux:
echo "sdk.dir=$HOME/Library/Android/sdk" > android/local.properties

# Windows:
echo "sdk.dir=C:\\Users\\YOUR_USERNAME\\AppData\\Local\\Android\\sdk" > android/local.properties
```

### Error 2: "Execution failed for task ':app:mergeDebugResources'"

```bash
# Clean build කරන්න:
cd android
./gradlew clean
./gradlew assembleRelease --stacktrace
```

### Error 3: "Could not resolve all files for configuration"

```bash
# Dependencies sync කරන්න:
cd android
./gradlew --refresh-dependencies
```

### Error 4: "Out of memory"

```bash
# android/gradle.properties හි add කරන්න:
org.gradle.jvmargs=-Xmx4096m -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
```

---

## 📊 APK Size Reduce කරන්න

### 1. Enable Proguard

```gradle
// android/app/build.gradle:
buildTypes {
    release {
        minifyEnabled true
        shrinkResources true
        proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    }
}
```

### 2. Enable Split APKs (Optional)

```gradle
// android/app/build.gradle:
splits {
    abi {
        reset()
        enable true
        universalApk false
        include "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
    }
}
```

### 3. Remove Unused Resources

```gradle
// android/app/build.gradle:
android {
    buildTypes {
        release {
            shrinkResources true
        }
    }
}
```

---

## 📱 APK Install කරන්න

### Method 1: Direct Install (Phone එකේ)

```
1. APK file එක phone එකට transfer කරන්න
2. File Manager open කරන්න
3. APK file එක tap කරන්න
4. "Install from Unknown Sources" allow කරන්න
5. Install click කරන්න
6. App open කරන්න!
```

### Method 2: ADB භාවිතයෙන්

```bash
adb install path/to/app-release.apk
```

### Method 3: Google Drive Link

```
1. APK Google Drive එකට upload කරන්න
2. Link share කරන්න
3. Phone එකෙන් link open කරන්න
4. Download කරන්න
5. Install කරන්න
```

---

## ✅ Final Checklist

Build කිරීමට පෙර check කරන්න:

- [ ] Node.js installed (v16+)
- [ ] JDK 11 installed
- [ ] Android Studio installed
- [ ] Android SDK installed
- [ ] ANDROID_HOME set
- [ ] Project dependencies installed (`npm install`)
- [ ] Android project folder exists
- [ ] gradle.properties configured
- [ ] build.gradle configured
- [ ] Vector icons linked
- [ ] Clean build done (`./gradlew clean`)

Build කිරීමෙන් පසු:

- [ ] APK file created
- [ ] APK size reasonable (< 50MB ideal)
- [ ] Test install on device
- [ ] App opens successfully
- [ ] All features work
- [ ] Data persistence works
- [ ] No crashes

---

## 🎯 Quick Commands Summary

```bash
# Debug APK (Testing)
cd android && ./gradlew assembleDebug

# Release APK (Unsigned)
cd android && ./gradlew assembleRelease

# Clean Build
cd android && ./gradlew clean && ./gradlew assembleRelease

# Install to Device
adb install android/app/build/outputs/apk/release/app-release.apk

# Copy to Desktop
cp android/app/build/outputs/apk/release/app-release.apk ~/Desktop/
```

---

## 📦 APK File Locations

```
Debug APK:
/workspace/android/app/build/outputs/apk/debug/app-debug.apk

Release APK:
/workspace/android/app/build/outputs/apk/release/app-release.apk

AAB (Play Store):
/workspace/android/app/build/outputs/bundle/release/app-release.aab
```

---

## 🌐 Play Store Submit කරන්න (Optional)

### 1. AAB Build කරන්න

```bash
cd android
./gradlew bundleRelease

# AAB location:
# android/app/build/outputs/bundle/release/app-release.aab
```

### 2. Play Console එකට Upload කරන්න

```
1. https://play.google.com/console වෙත යන්න
2. Create App click කරන්න
3. App details fill කරන්න
4. Release → Production → Create Release
5. AAB file upload කරන්න
6. Release notes add කරන්න
7. Review සහ Publish
```

---

## 💡 Pro Tips

1. **Debug APK පළමුව test කරන්න**
   - Smaller, faster to build
   - Good for testing

2. **Release APK production සඳහා**
   - Optimized, smaller size
   - Better performance

3. **Signed APK Play Store සඳහා**
   - Required for official distribution
   - Keep keystore safe!

4. **Version number increment කරන්න**
   - build.gradle හි versionCode සහ versionName
   - Each release එකට unique version එකක්

5. **Test thoroughly before distribution**
   - Different devices එකේ test කරන්න
   - All features verify කරන්න
   - Performance check කරන්න

---

## 🎊 සාර්ථකයි!

APK file එක successfully build වීමෙන් පසු:

✅ ඔබට දැන් app එක කැමති කෙනෙකුටම share කරන්න පුළුවන්!
✅ Google Play Store එකට submit කරන්න පුළුවන්!
✅ Direct install කරගන්න පුළුවන්!

**සතුටින් share කරන්න!** 📱✨

---

Made with ❤️ for Sri Lanka 🇱🇰
