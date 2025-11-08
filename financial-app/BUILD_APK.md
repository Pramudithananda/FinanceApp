# APK Build Instructions

## 📱 Building the APK

### Prerequisites
1. Node.js (v16 or higher) ✅ Installed
2. Java JDK ✅ Installed
3. Android SDK (with build-tools, platform-tools)
4. Gradle (will be downloaded automatically)

### Quick Build Steps

#### Option 1: Using Gradle Wrapper (Recommended)

```bash
cd financial-app/android
./gradlew assembleDebug
```

The APK will be generated at:
`android/app/build/outputs/apk/debug/app-debug.apk`

#### Option 2: Using React Native CLI

```bash
cd financial-app
npm run android
```

#### Option 3: Manual Build with Android Studio

1. Open Android Studio
2. Open `financial-app/android` folder
3. Wait for Gradle sync
4. Build > Build Bundle(s) / APK(s) > Build APK(s)

### APK Analysis Summary

**Existing APK (`මුදල් කළමනාකරණ_1.0.apk`):**
- Size: 21MB
- Built with: Android Gradle 8.1.1
- Type: React Native app
- Contains: classes.dex, React Native libraries, resources

**New APK Features:**
- ✅ Custom financial app icon
- ✅ Updated version (2.0.0)
- ✅ All source code organized
- ✅ Proper Android configuration
- ✅ Debug keystore created

### Build Configuration

**App Details:**
- Package: `com.financialapp`
- Version: 2.0.0
- Min SDK: 21
- Target SDK: 33
- Compile SDK: 33

**Icons:**
- All density icons created (mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)
- Square and round versions included
- Custom financial design

### Troubleshooting

**If Gradle wrapper is missing:**
```bash
cd android
gradle wrapper --gradle-version=8.3
```

**If Android SDK is not found:**
1. Install Android Studio
2. Set ANDROID_HOME environment variable:
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

**If build fails:**
```bash
cd android
./gradlew clean
./gradlew assembleDebug
```

### Signing the APK (for Release)

For release builds, you need to create a release keystore:

```bash
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

Then update `android/app/build.gradle` with release signing config.

### APK Location After Build

- Debug APK: `android/app/build/outputs/apk/debug/app-debug.apk`
- Release APK: `android/app/build/outputs/apk/release/app-release.apk`

---

**Note:** The source code is ready. To build the APK, ensure Android SDK is properly installed and configured.
