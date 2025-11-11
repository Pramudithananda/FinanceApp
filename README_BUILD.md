# 🔨 APK Build Guide - නව Code එකෙන් Build කරන්න

## ⚠️ Important
මෙම environment එකේ Android SDK නැති නිසා direct build කිරීමට නොහැකියි. පහත methods use කරන්න:

## Method 1: GitHub Actions (Recommended) 🚀

1. **GitHub repository එකකට push කරන්න:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin YOUR_GITHUB_REPO_URL
   git push -u origin main
   ```

2. **GitHub Actions automatically build කරයි:**
   - `.github/workflows/build-apk.yml` file එක automatically run වේ
   - Build complete වූ පසු APK download කරන්න
   - Catbox link එක Actions logs එකේ තියෙනවා

## Method 2: Local Build (Android Studio Required) 💻

### Prerequisites:
- Android Studio installed
- Android SDK installed
- Java JDK 11+

### Steps:

1. **Android SDK Setup:**
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   export PATH=$PATH:$ANDROID_HOME/tools
   ```

2. **Dependencies Install:**
   ```bash
   npm install
   ```

3. **Build APK:**
   ```bash
   ./build-and-upload.sh
   ```
   
   හෝ manually:
   ```bash
   cd android
   ./gradlew assembleRelease
   ```

4. **APK Location:**
   ```
   android/app/build/outputs/apk/release/app-release.apk
   ```

## Method 3: Using Docker 🐳

Docker container එකක් use කරන්න:

```bash
docker run --rm -v $(pwd):/workspace -w /workspace \
  reactnativecommunity/react-native-android \
  bash -c "npm install && cd android && ./gradlew assembleRelease"
```

## Method 4: Online Build Services 🌐

### Option A: AppCenter (Microsoft)
1. https://appcenter.ms වෙත register කරන්න
2. New app create කරන්න
3. GitHub connect කරන්න
4. Build configure කරන්න

### Option B: Bitrise
1. https://bitrise.io වෙත register කරන්න
2. GitHub connect කරන්න
3. Android build workflow select කරන්න

## Quick Build Script

`build-and-upload.sh` script එක use කරන්න:
- APK build කරයි
- Catbox වෙත upload කරයි
- Download link එක print කරයි

```bash
./build-and-upload.sh
```

## Troubleshooting

### Gradle Build Fails:
```bash
cd android
./gradlew clean
./gradlew assembleRelease --stacktrace
```

### Dependencies Issues:
```bash
rm -rf node_modules
npm install
cd android
./gradlew clean
```

### SDK Issues:
- Android Studio open කරන්න
- SDK Manager open කරන්න
- Android SDK Platform 33 install කරන්න
- Build Tools install කරන්න

## Current Status

✅ **Code Ready:** All React Native code is complete
✅ **Android Config:** All Android files are configured
✅ **Build Scripts:** Build scripts are ready
⏳ **Waiting:** Android SDK needed for build

## Next Steps

1. Choose one of the build methods above
2. Build the APK
3. Upload to Catbox (or use the script)
4. Share the download link

---

**Note:** මෙම environment එකේ direct build කිරීමට නොහැකියි. ඉහත methods එකක් use කරන්න.
