# 🚀 APK File එකක් හදලා Download Link එකක් ගන්නේ කොහොමද?

## විධිය 1: ඉක්මන් Setup (Recommended for Beginners)

### 📱 Expo Go App භාවිතා කරන්න (APK එකක් නැතිව Test කරන්න)

මේක ඉක්මනින්ම ඔබේ app එක test කරන්න හොඳම විදිහ:

```bash
# Expo CLI install කරන්න
npm install -g expo-cli

# React Native app එක Expo project එකක් විදිහට convert කරන්න
npx expo init MyFinanceApp --template blank

# ඔබේ files copy කරන්න
# පස්සේ run කරන්න
expo start
```

Phone එකෙන්:
1. Google Play Store එකෙන් "Expo Go" app එක download කරන්න
2. QR code එක scan කරන්න
3. ඔබේ app එක දැන්ම run වෙනවා!

---

## විධිය 2: Online APK Builder Service භාවිතා කරන්න (ලේසිම)

### 🌐 AppGyver / EAS Build භාවිතා කරන්න

#### EAS Build (Expo Application Services) - නිදහස්!

```bash
# EAS CLI install කරන්න
npm install -g eas-cli

# Login වෙන්න (account එකක් නැතිනම් create කරගන්න)
eas login

# Project එක configure කරන්න
eas build:configure

# Android APK build කරන්න
eas build --platform android --profile preview
```

Build එක complete වෙලා ඉවර වෙද්දී:
- ✅ Download link එකක් එනවා
- ✅ ඒ link එක කාටත් share කරන්න පුළුවන්
- ✅ Direct download link එකක්!

---

## විධිය 3: GitHub Actions භාවිතා කරලා Automatic Build (Advanced)

### GitHub Actions Workflow හදන්න

1. ඔබේ project එකේ `.github/workflows/build-apk.yml` file එකක් හදන්න:

```yaml
name: Build Android APK

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: 18
        
    - name: Setup Java JDK
      uses: actions/setup-java@v3
      with:
        distribution: 'zulu'
        java-version: 11
        
    - name: Install dependencies
      run: npm install
      
    - name: Build APK
      run: |
        cd android
        chmod +x gradlew
        ./gradlew assembleRelease
        
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-release
        path: android/app/build/outputs/apk/release/app-release.apk
```

2. GitHub repository එකට push කරන්න
3. "Actions" tab එකට යන්න
4. Build complete වෙද්දී APK download කරගන්න

---

## විධිය 4: ඔබේ Computer එකෙන්ම Build කරන්න (Full Control)

### ✅ පියවර 1: අවශ්‍ය Software Install කරන්න

#### Windows:
1. **Node.js**: [nodejs.org](https://nodejs.org) - LTS version
2. **Java JDK 11**: [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) හෝ [OpenJDK](https://adoptium.net/)
3. **Android Studio**: [developer.android.com/studio](https://developer.android.com/studio)

#### Mac:
```bash
# Homebrew භාවිතා කරන්න
brew install node
brew install --cask android-studio
brew tap homebrew/cask-versions
brew install --cask zulu11
```

#### Linux (Ubuntu/Debian):
```bash
# Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Java JDK
sudo apt install openjdk-11-jdk

# Android Studio
sudo snap install android-studio --classic
```

### ✅ පියවර 2: Android SDK Setup කරන්න

1. Android Studio open කරන්න
2. "More Actions" → "SDK Manager"
3. මේවා install කරන්න:
   - Android SDK Platform 33
   - Android SDK Build-Tools
   - Android SDK Command-line Tools
   - Android Emulator

### ✅ පියවර 3: Environment Variables

**Windows** (System Environment Variables):
```
ANDROID_HOME = C:\Users\YourName\AppData\Local\Android\Sdk
JAVA_HOME = C:\Program Files\Java\jdk-11

Path එකට add කරන්න:
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%JAVA_HOME%\bin
```

**Mac/Linux** (~/.bashrc හෝ ~/.zshrc):
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$JAVA_HOME/bin
```

### ✅ පියවර 4: React Native Project Setup

```bash
# ඔබේ project folder එකට යන්න
cd /workspace

# Dependencies install කරන්න
npm install

# React Native CLI install කරන්න
npm install -g react-native-cli

# Android folder structure verify කරන්න
# නැතිනම් create කරන්න:
npx react-native init TempApp
cp -r TempApp/android ./
rm -rf TempApp
```

### ✅ පියවර 5: APK Build කරන්න!

#### Debug APK (Testing සඳහා):
```bash
cd android
./gradlew assembleDebug

# APK location:
# android/app/build/outputs/apk/debug/app-debug.apk
```

#### Release APK (Production සඳහා):

```bash
# 1. Signing key create කරන්න
cd android/app
keytool -genkeypair -v -storetype PKCS12 \
  -keystore my-release-key.keystore \
  -alias my-key-alias \
  -keyalg RSA -keysize 2048 \
  -validity 10000

# Password එකක් type කරන්න සහ details fill කරන්න

# 2. gradle.properties update කරන්න
echo "MYAPP_RELEASE_STORE_FILE=my-release-key.keystore" >> android/gradle.properties
echo "MYAPP_RELEASE_KEY_ALIAS=my-key-alias" >> android/gradle.properties
echo "MYAPP_RELEASE_STORE_PASSWORD=YOUR_PASSWORD" >> android/gradle.properties
echo "MYAPP_RELEASE_KEY_PASSWORD=YOUR_PASSWORD" >> android/gradle.properties

# 3. Release build කරන්න
cd android
./gradlew assembleRelease

# APK location:
# android/app/build/outputs/apk/release/app-release.apk
```

---

## 📤 APK Upload කරලා Download Link එකක් ගන්නේ කොහොමද?

### Option 1: 🟢 GitHub Releases (Recommended - නිදහස්!)

```bash
# GitHub CLI install කරන්න
# Windows: choco install gh
# Mac: brew install gh
# Linux: sudo apt install gh

# Login වෙන්න
gh auth login

# Release create කරලා APK upload කරන්න
gh release create v1.0.0 \
  android/app/build/outputs/apk/release/app-release.apk \
  --title "Budget Tracker v1.0.0" \
  --notes "පළමු release - Personal Finance App"

# Download link එක copy කරන්න
gh release view v1.0.0 --web
```

Download link එක මෙහෙම වෙනවා:
```
https://github.com/YOUR_USERNAME/YOUR_REPO/releases/download/v1.0.0/app-release.apk
```

### Option 2: 🔵 Google Drive

1. [drive.google.com](https://drive.google.com) යන්න
2. "New" → "File upload"
3. APK file එක select කරන්න
4. Upload වෙද්දී wait කරන්න
5. File එකට right-click → "Share"
6. "Anyone with the link" select කරන්න
7. "Copy link" click කරන්න

Link එක මෙහෙම වෙනවා:
```
https://drive.google.com/file/d/FILE_ID/view?usp=sharing
```

Direct download link එකක් ඕනේනම්:
```
https://drive.google.com/uc?export=download&id=FILE_ID
```

### Option 3: 🟠 Dropbox

1. [dropbox.com](https://dropbox.com) යන්න
2. APK upload කරන්න
3. "Share" button click කරන්න
4. "Create link" click කරන්න
5. Link එක copy කරන්න

Direct download සඳහා URL එකේ අන්තිමේ `dl=0` එක `dl=1` කරන්න:
```
https://www.dropbox.com/s/xxxxx/app-release.apk?dl=1
```

### Option 4: 🟣 Firebase App Distribution

```bash
# Firebase CLI install කරන්න
npm install -g firebase-tools

# Login වෙන්න
firebase login

# Firebase project එකක් initialize කරන්න
firebase init

# APK upload කරන්න
firebase appdistribution:distribute \
  android/app/build/outputs/apk/release/app-release.apk \
  --app YOUR_FIREBASE_APP_ID \
  --groups testers

# Link එක console එකෙන් copy කරන්න
```

### Option 5: 🟡 Transfer.sh (ඉක්මන් share එකක් - 14 days)

```bash
# APK upload කරන්න
curl --upload-file android/app/build/outputs/apk/release/app-release.apk \
  https://transfer.sh/app-release.apk

# Download link එක directly එනවා:
# https://transfer.sh/xxxxx/app-release.apk
```

---

## 📲 APK Install කරන්නේ කොහොමද?

### Phone එකේ:

1. **Settings** → **Security** → **Install unknown apps**
2. ඔබේ browser එක (Chrome/Firefox) select කරන්න
3. "Allow from this source" enable කරන්න
4. Download link එක open කරන්න browser එකෙන්
5. APK download වෙද්දී wait කරන්න
6. "Install" click කරන්න
7. App එක open කරන්න!

### Computer එකෙන් Phone එකට:

```bash
# USB cable එකෙන් phone එක connect කරන්න
# USB debugging enable කරන්න phone එකේ

# APK install කරන්න
adb install android/app/build/outputs/apk/release/app-release.apk

# හෝ
cd android/app/build/outputs/apk/release/
adb install app-release.apk
```

---

## 🎯 ඉක්මන් Commands Cheat Sheet

```bash
# Debug APK
cd android && ./gradlew assembleDebug

# Release APK
cd android && ./gradlew assembleRelease

# Clean build
cd android && ./gradlew clean

# Bundle (Play Store සඳහා)
cd android && ./gradlew bundleRelease

# APK size check
ls -lh android/app/build/outputs/apk/release/app-release.apk

# APK install via USB
adb install android/app/build/outputs/apk/release/app-release.apk

# GitHub release create
gh release create v1.0.0 android/app/build/outputs/apk/release/app-release.apk

# Quick upload to transfer.sh
curl --upload-file android/app/build/outputs/apk/release/app-release.apk https://transfer.sh/
```

---

## 🐛 Common Problems සහ Solutions

### Problem 1: "SDK location not found"
```bash
# android/local.properties file එකක් හදන්න
echo "sdk.dir=/Users/yourname/Library/Android/sdk" > android/local.properties
# Windows: sdk.dir=C:\\Users\\yourname\\AppData\\Local\\Android\\Sdk
```

### Problem 2: "Java version mismatch"
```bash
# Java version check කරන්න
java -version
javac -version

# JDK 11 use කරන්න
export JAVA_HOME=/path/to/jdk-11
```

### Problem 3: "Gradle build failed"
```bash
cd android
./gradlew clean
./gradlew assembleRelease --stacktrace
```

### Problem 4: "APK too large"
```bash
# Enable Proguard (android/app/build.gradle):
# minifyEnabled true
# shrinkResources true

# හෝ Bundle හදන්න:
./gradlew bundleRelease
```

---

## ✅ Summary

**ලේසිම විදිහ:** EAS Build භාවිතා කරන්න
```bash
npm install -g eas-cli
eas login
eas build --platform android
```

**වැඩිම Control:** ඔබේ computer එකෙන් build කරන්න
```bash
cd android && ./gradlew assembleRelease
```

**ලේසිම Upload:** GitHub Releases
```bash
gh release create v1.0.0 path/to/app-release.apk
```

**Download Link:** Share කරන්න කාටත්!
```
https://github.com/user/repo/releases/download/v1.0.0/app-release.apk
```

---

**සතුටින් APK build කරන්න! 🎉📱**

අමතක නොකරන්න: First build එක ටිකක් කල් යයි. Dependencies download වෙන්න ඕනේ නිසා. දෙවෙනි build එක ඉක්මන්!
