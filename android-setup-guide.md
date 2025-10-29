# Android Setup සහ APK Build කරන විදිහ

## 📋 අවශ්‍ය දේවල්

1. **Node.js** (version 16 හෝ ඊට වැඩි)
2. **Java Development Kit (JDK)** - JDK 11 හෝ JDK 17
3. **Android Studio**
4. **Android SDK**
5. **React Native CLI**

---

## 🔧 පියවර 1: Android Studio Setup කරන්න

### Android Studio Install කරන්න
1. [Android Studio](https://developer.android.com/studio) download කරන්න
2. Install කරන්න සහ open කරන්න
3. SDK Manager එක open කරන්න (Tools → SDK Manager)

### Android SDK Install කරන්න
SDK Manager එකෙන් මේවා install කරන්න:
- ✅ Android SDK Platform 33 (හෝ ඊට වැඩි)
- ✅ Android SDK Build-Tools
- ✅ Android SDK Command-line Tools
- ✅ Android Emulator
- ✅ Android SDK Platform-Tools

### Environment Variables Set කරන්න

**Windows:**
```bash
ANDROID_HOME = C:\Users\YourUsername\AppData\Local\Android\Sdk
Path = %ANDROID_HOME%\platform-tools
Path = %ANDROID_HOME%\tools
```

**macOS/Linux:**
```bash
# ~/.bashrc හෝ ~/.zshrc file එකට add කරන්න
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
```

---

## 🏗️ පියවර 2: React Native Project Setup කරන්න

### Dependencies Install කරන්න
```bash
cd /workspace
npm install
```

### Android Project Structure හදන්න
```bash
npx react-native init BudgetTrackerApp --version 0.72.6
```

එහෙම නැතිනම්, මේ command එක use කරන්න:
```bash
npx @react-native-community/cli init BudgetTrackerApp
```

---

## 📱 පියවර 3: Android Folder Structure හදන්න

ඔබේ project එකේ `android/` folder එක තිබෙන්න ඕනේ. නැතිනම්:

```bash
cd /workspace
npx react-native upgrade
```

### Android Manifest Update කරන්න
`android/app/src/main/AndroidManifest.xml`:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET" />
    
    <application
      android:name=".MainApplication"
      android:label="@string/app_name"
      android:icon="@mipmap/ic_launcher"
      android:roundIcon="@mipmap/ic_launcher_round"
      android:allowBackup="false"
      android:theme="@style/AppTheme">
      <activity
        android:name=".MainActivity"
        android:label="@string/app_name"
        android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize|uiMode"
        android:launchMode="singleTask"
        android:windowSoftInputMode="adjustResize"
        android:exported="true">
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
      </activity>
    </application>
</manifest>
```

---

## 🔨 පියවර 4: APK Build කරන්න

### Debug APK Build කරන්න (Testing සඳහා)
```bash
cd /workspace
npx react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res

cd android
./gradlew assembleDebug
```

APK එක හොයාගන්න පුළුවන්:
```
android/app/build/outputs/apk/debug/app-debug.apk
```

### Release APK Build කරන්න (Production සඳහා)

#### 1. Signing Key Generate කරන්න
```bash
cd android/app
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

Password එකක් type කරන්න (මතක තියාගන්න!)

#### 2. Gradle Properties Set කරන්න
`android/gradle.properties` file එකට add කරන්න:
```properties
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=your-password-here
MYAPP_RELEASE_KEY_PASSWORD=your-password-here
```

#### 3. Build Config Update කරන්න
`android/app/build.gradle` file එකේ:
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
            signingConfig signingConfigs.release
            minifyEnabled enableProguardInReleaseBuilds
            proguardFiles getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro"
        }
    }
}
```

#### 4. Release APK Build කරන්න
```bash
cd /workspace/android
./gradlew assembleRelease
```

Release APK එක මෙතනින් හොයාගන්න පුළුවන්:
```
android/app/build/outputs/apk/release/app-release.apk
```

---

## 📤 පියවර 5: APK Upload කරලා Link එකක් ගන්න

### Option 1: GitHub Releases (නිදහස්)
1. GitHub repository එකට යන්න
2. "Releases" → "Create a new release" click කරන්න
3. Tag version එකක් add කරන්න (e.g., v1.0.0)
4. APK file එක drag & drop කරන්න
5. "Publish release" click කරන්න
6. Download link එක copy කරන්න

### Option 2: Google Drive
1. [Google Drive](https://drive.google.com) යන්න
2. APK file එක upload කරන්න
3. Right-click → "Get link" → "Anyone with the link"
4. Link එක copy කරන්න share කරන්න

### Option 3: Firebase App Distribution
1. [Firebase Console](https://console.firebase.google.com) යන්න
2. App Distribution select කරන්න
3. APK upload කරන්න
4. Testers add කරන්න
5. Distribution link එක share කරන්න

### Option 4: Dropbox
1. Dropbox account එකකට login වෙන්න
2. APK upload කරන්න
3. "Share" button එක click කරන්න
4. Link එක copy කරන්න

---

## 🎯 Quick Build Commands

### Development Testing
```bash
# Metro bundler start කරන්න
npm start

# වෙන terminal එකකින්
npm run android
```

### Production APK
```bash
# Release APK build කරන්න
cd android && ./gradlew assembleRelease

# APK location
ls -la app/build/outputs/apk/release/app-release.apk
```

### Bundle (Google Play Store සඳහා)
```bash
cd android && ./gradlew bundleRelease

# AAB location
ls -la app/build/outputs/bundle/release/app-release.aab
```

---

## 🐛 Common Issues සහ Solutions

### Issue 1: `SDK location not found`
**Solution:**
```bash
# android/local.properties file එකක් හදන්න
echo "sdk.dir=/path/to/Android/Sdk" > android/local.properties
```

### Issue 2: `Execution failed for task ':app:installDebug'`
**Solution:**
- USB debugging enable කරන්න phone එකේ
- `adb devices` command එකෙන් device එක connect වෙලා තියෙනවද බලන්න

### Issue 3: `Unable to load script`
**Solution:**
```bash
# Metro bundler restart කරන්න
npm start -- --reset-cache
```

### Issue 4: `Gradle build failed`
**Solution:**
```bash
# Gradle cache clear කරන්න
cd android
./gradlew clean
./gradlew assembleDebug
```

---

## 📲 APK Install කරන්න Phone එකේ

1. Phone එකේ Settings → Security → "Unknown sources" enable කරන්න
2. APK file එක phone එකට transfer කරන්න
3. File manager එකෙන් APK එක open කරලා install කරන්න

---

## ✅ Checklist

- [ ] Node.js installed
- [ ] Java JDK installed
- [ ] Android Studio installed
- [ ] Android SDK installed
- [ ] Environment variables set කරලා
- [ ] `npm install` run කරලා
- [ ] Android project structure හදලා
- [ ] APK build කරලා
- [ ] APK test කරලා phone එකේ
- [ ] APK upload කරලා link එක share කරලා

---

**මතක තියාගන්න:** ඔබේ APK file එක 50MB ට වැඩි නම්, GitHub releases හරියන්නේ නැහැ. ඒ වෙලාවට Google Drive හෝ Firebase App Distribution use කරන්න.

**App Version Update:** Version update කරන්න නම් `android/app/build.gradle` file එකේ `versionCode` සහ `versionName` change කරන්න.
