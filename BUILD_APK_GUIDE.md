# 📦 APK Build කිරීමේ මාර්ගෝපදේශය

## 🎯 APK File එකක් Build කරන්නේ කොහොමද?

### ⚠️ වැදගත් දැනුම්දීම

දැනට අපට source code තියෙනවා, ඒත් APK එකක් build කරන්න Android project structure එක සම්පූර්ණ කරන්න ඕන.

---

## 🔧 Method 1: Complete Project Setup (Recommended)

### Step 1: React Native Project එකක් Initialize කරන්න

```bash
# නව folder එකක React Native project එකක් create කරන්න
npx react-native init FinanceApp --version 0.73.0

# Project folder එකට යන්න
cd FinanceApp
```

### Step 2: අපේ Code එක Copy කරන්න

```bash
# අපේ App.js file එක copy කරන්න
cp /workspace/src/App.js ./src/App.js

# Configuration files copy කරන්න
cp /workspace/package.json ./package.json
cp /workspace/app.json ./app.json
```

### Step 3: Dependencies Install කරන්න

```bash
npm install
npm install react-native-vector-icons
```

### Step 4: Vector Icons Link කරන්න

```bash
# Android සඳහා manually link කරන්න
# android/app/build.gradle file එකට add කරන්න:
```

**android/app/build.gradle** file එකේ bottom එකේ add කරන්න:
```gradle
apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"
```

### Step 5: APK Build කරන්න

```bash
cd android
./gradlew assembleRelease
cd ..
```

### Step 6: APK File එක Find කරන්න

APK file එක මෙතන තිබෙනවා:
```
android/app/build/outputs/apk/release/app-release.apk
```

---

---

## 🚀 Method 2: Quick Build Script (Auto)

මම ඔබට automated script එකක් හදලා දෙන්නම්:

### Script Run කරන්න

```bash
# Script එක executable කරන්න (Linux/Mac)
chmod +x build-apk.sh

# Script එක run කරන්න
./build-apk.sh
```

Script එක automatically:
- Dependencies පරීක්ෂා කරයි
- Android project එක clean කරයි
- APK build කරයි
- APK file එක copy කරයි

---

## 📱 Method 3: Complete Auto Setup (ආරම්භයේ සිට)

මම complete setup script එකක් හදලා තියෙනවා:

### Complete Setup Script

```bash
# Script run කරන්න
chmod +x build-apk-simple.sh
./build-apk-simple.sh
```

මේ script එක:
- React Native project එකක් initialize කරයි
- අපේ code copy කරයි
- Dependencies install කරයි
- APK build කරයි

---

## 🎯 Method 4: Manual Step-by-Step (සම්පූර්ණ පාලනය)

### පියවර 1: React Native CLI Install කරන්න

```bash
npm install -g react-native-cli
```

### පියවර 2: නව Project එකක් Create කරන්න

```bash
# workspace folder එකෙන් එළියට යන්න
cd ..

# නව React Native project එකක් create කරන්න
npx react-native init FinanceApp --version 0.73.0

# Project folder එකට යන්න
cd FinanceApp
```

### පියවර 3: අපේ Code Copy කරන්න

```bash
# Source files copy කරන්න
cp ../workspace/src/App.js ./src/App.js
cp ../workspace/index.js ./index.js

# Configuration files copy කරන්න
cp ../workspace/app.json ./app.json
```

### පියවර 4: package.json Update කරන්න

`package.json` file එක open කරලා dependencies section එකේ add කරන්න:

```json
{
  "dependencies": {
    "react": "18.2.0",
    "react-native": "0.73.0",
    "react-native-vector-icons": "^10.0.3"
  }
}
```

### පියවර 5: Dependencies Install කරන්න

```bash
npm install
```

### පියවර 6: Vector Icons Setup කරන්න

**Android සඳහා:**

`android/app/build.gradle` file එකේ end එකේ add කරන්න:

```gradle
apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"
```

**iOS සඳහා (Mac only):**

```bash
cd ios
pod install
cd ..
```

### පියවර 7: Test කරන්න (Optional)

```bash
# Metro bundler start කරන්න
npm start

# නව terminal එකක
npm run android
```

### පියවර 8: Release APK Build කරන්න

```bash
cd android
./gradlew clean
./gradlew assembleRelease
cd ..
```

### පියවර 9: APK File එක Copy කරන්න

```bash
cp android/app/build/outputs/apk/release/app-release.apk ./මුදල්-කළමනාකරණ-v1.0.apk
```

### ✅ සාර්ථකයි!

APK file එක දැන් මෙතන තියෙනවා:
```
මුදල්-කළමනාකරණ-v1.0.apk
```

---

## 📲 APK File එක Install කරන්නේ කොහොමද?

### Android Phone එකේ:

**පියවර 1:** USB cable එකෙන් හෝ file sharing app එකකින් APK file එක phone එකට transfer කරන්න

**පියවර 2:** Phone එකේ Settings යන්න:
- Settings → Security (හෝ Privacy)
- "Install unknown apps" හොයන්න
- File manager app එකට permission දෙන්න

**පියවර 3:** APK file එක tap කරන්න

**පියවර 4:** "Install" button එක click කරන්න

**පියවර 5:** Install වුණාට පස්සේ "Open" click කරන්න

---

## 🐛 Common Issues (පොදු ගැටලු)

### 1. "android/ folder එක නැහැ"

**විසඳුම:**
```bash
# React Native project එකක් initialize කරන්න ඕන
npx react-native init FinanceApp --version 0.73.0
```

### 2. "ANDROID_HOME is not set"

**විසඳුම:**

**Linux/Mac:**
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

**Windows:**
```
System Properties → Environment Variables
ANDROID_HOME = C:\Users\YourName\AppData\Local\Android\Sdk
```

### 3. "SDK location not found"

**විසඳුම:**

`android/local.properties` file එකක් create කරන්න:

```properties
sdk.dir=/Users/YourName/Library/Android/sdk
```

### 4. "Build failed"

**විසඳුම:**
```bash
# Clean කරලා rebuild කරන්න
cd android
./gradlew clean
./gradlew assembleRelease --stacktrace
cd ..
```

### 5. "Could not find or load main class org.gradle.wrapper.GradleWrapperMain"

**විසඳුම:**
```bash
cd android
gradle wrapper
cd ..
```

### 6. Vector Icons පෙන්නේ නැහැ

**විසඳුම:**

`android/app/build.gradle` file එකේ මේක තියෙනවද බලන්න:
```gradle
apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"
```

එතකොට rebuild කරන්න:
```bash
cd android
./gradlew clean
./gradlew assembleRelease
cd ..
```

---

## 🎯 APK Sign කරන්නේ කොහොමද? (Play Store සඳහා)

Production APK එකක් හදන්න නම් sign කරන්න ඕන:

### පියවර 1: Keystore Create කරන්න

```bash
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

Password එකක් දාන්න සහ විස්තර fill කරන්න.

### පියවර 2: Keystore File එක Android Folder එකට Move කරන්න

```bash
mv my-release-key.keystore android/app/
```

### පියවර 3: Gradle Properties Setup කරන්න

`android/gradle.properties` file එකේ add කරන්න:

```properties
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=your-password-here
MYAPP_RELEASE_KEY_PASSWORD=your-password-here
```

### පියවර 4: Build Gradle Configure කරන්න

`android/app/build.gradle` file එකේ add කරන්න:

```gradle
android {
    ...
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
            ...
            signingConfig signingConfigs.release
        }
    }
}
```

### පියවර 5: Signed APK Build කරන්න

```bash
cd android
./gradlew assembleRelease
cd ..
```

දැන් ඔබට signed APK එකක් තියෙනවා!

---

## 📊 APK Size අඩු කරන්නේ කොහොමද?

### Method 1: Enable Proguard

`android/app/build.gradle`:

```gradle
buildTypes {
    release {
        minifyEnabled true
        shrinkResources true
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
}
```

### Method 2: Split APKs (Per Architecture)

```gradle
splits {
    abi {
        enable true
        reset()
        include "armeabi-v7a", "arm64-v8a", "x86", "x86_64"
        universalApk false
    }
}
```

මේකෙන් architecture එකක් මත base වෙලා වෙන වෙනම APK හදනවා (size අඩුයි).

### Method 3: Use App Bundle (AAB) for Play Store

```bash
cd android
./gradlew bundleRelease
cd ..
```

AAB file එක තියෙනවා: `android/app/build/outputs/bundle/release/app-release.aab`

---

## 🚀 Quick Reference Commands

```bash
# Clean build
cd android && ./gradlew clean && cd ..

# Build debug APK
cd android && ./gradlew assembleDebug && cd ..

# Build release APK
cd android && ./gradlew assembleRelease && cd ..

# Build with logs
cd android && ./gradlew assembleRelease --stacktrace --info && cd ..

# Check build variants
cd android && ./gradlew tasks --all && cd ..

# Build app bundle
cd android && ./gradlew bundleRelease && cd ..
```

---

## ✅ Checklist Before Building

ඔබේ APK build කිරීමට පෙර:

- [ ] Node.js installed (v18+)
- [ ] Android Studio installed
- [ ] JDK installed (v11+)
- [ ] ANDROID_HOME set කරලා තියෙනවා
- [ ] React Native project initialize කරලා තියෙනවා
- [ ] Dependencies install කරලා තියෙනවා
- [ ] Vector icons setup කරලා තියෙනවා
- [ ] android/ folder එක තියෙනවා

---

## 📞 අමතර උදව්

### Documentation Files:
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Android Studio setup
- **[QUICK_START_SINHALA.md](QUICK_START_SINHALA.md)** - සිංහල ආරම්භක guide
- **[README.md](README.md)** - Main documentation

### Online Resources:
- React Native Build: https://reactnative.dev/docs/signed-apk-android
- Android Studio: https://developer.android.com/studio

---

## 🎉 සාර්ථකද?

APK build කිරීම සාර්ථක නම්:

✅ ඔබට දැන් APK file එකක් තියෙනවා  
✅ Phone එකට install කරන්න පුළුවන්  
✅ Friends ලට share කරන්න පුළුවන්  
✅ Play Store එකට upload කරන්න පුළුවන් (signed නම්)

---

**සාර්ථක APK build කිරීමක් වේවා! 🎉**

**ප්‍රශ්න තිබේ නම් documentation files බලන්න හෝ GitHub issue එකක් create කරන්න!**
