# 📦 APK Build Instructions - APK Build කරන විදිහ

## 🚀 Method 1: EAS Build (Recommended - Download Link ලැබේ)

EAS Build භාවිතා කරලා cloud හරහා build කරන්න. Build එක complete වුනාට පස්සේ direct download link එකක් ලැබේ.

### Step 1: EAS CLI Install කරන්න

```bash
npm install -g eas-cli
```

### Step 2: Expo Account හදාගන්න (Free)

```bash
eas login
```

නැත්නම් නව account එකක් හදාගන්න:
```bash
eas register
```

### Step 3: Project Initialize කරන්න

```bash
eas build:configure
```

මේක automatically `eas.json` file එක create කරයි (දැනටමත් create කරලා තියෙනවා).

### Step 4: APK Build කරන්න

**Preview APK (Testing සඳහා):**
```bash
npm run build:android
# හෝ
eas build --platform android --profile preview
```

**Production APK:**
```bash
npm run build:android:prod
# හෝ
eas build --platform android --profile production
```

### Step 5: Build Status Check කරන්න

```bash
npm run build:status
# හෝ
eas build:list
```

### Step 6: Download Link ලබාගන්න

Build complete වුනාට පස්සේ:

1. **Terminal හරහා:**
   - Build complete වුනාට පස්සේ terminal හි direct download link එකක් show වේ
   - Link එක copy කරලා browser හි open කරන්න

2. **Expo Dashboard හරහා:**
   - https://expo.dev/accounts/[your-username]/projects/finance-app-mobile/builds
   - Build complete වුනාට පස්සේ "Download" button එක click කරන්න

3. **EAS CLI හරහා:**
   ```bash
   eas build:list
   ```
   - Latest build එකේ ID එක copy කරන්න
   - Download link: `https://expo.dev/artifacts/[build-id]`

### Build Time
- පළමු build: ~15-20 minutes
- පසුව builds: ~10-15 minutes

---

## 🔧 Method 2: Local Build (Advanced)

Local machine හි build කරන්න (Android Studio required).

### Prerequisites

1. **Android Studio Install කරන්න:**
   - https://developer.android.com/studio
   - Android SDK, Build Tools install කරන්න

2. **Environment Variables Set කරන්න:**
   ```bash
   export ANDROID_HOME=$HOME/Library/Android/sdk  # macOS
   # හෝ
   export ANDROID_HOME=$HOME/Android/Sdk  # Linux
   
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/tools/bin
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

### Build Command

```bash
eas build --platform android --local
```

මේක local machine හි build කරයි. APK file එක `builds/` folder එකේ save වේ.

---

## 📱 Method 3: Expo Go (Quick Testing)

Development සඳහා Expo Go app භාවිතා කරන්න (APK build කරන්න අවශ්‍ය නැත).

```bash
npm start
```

QR code එක scan කරන්න Expo Go app හරහා.

---

## 🎯 Quick Build Script

මේ script එක run කරන්න APK build කරන්න සහ download link එක get කරන්න:

```bash
#!/bin/bash
# build-apk.sh

echo "🚀 Building APK..."
eas build --platform android --profile preview --non-interactive

echo "⏳ Waiting for build to complete..."
BUILD_ID=$(eas build:list --platform android --limit 1 --json | jq -r '.[0].id')

echo "📦 Build ID: $BUILD_ID"
echo "🔗 Download Link: https://expo.dev/artifacts/$BUILD_ID"

# Build status check
while true; do
  STATUS=$(eas build:view $BUILD_ID --json | jq -r '.status')
  echo "📊 Build Status: $STATUS"
  
  if [ "$STATUS" = "finished" ]; then
    echo "✅ Build Complete!"
    echo "🔗 Download: https://expo.dev/artifacts/$BUILD_ID"
    break
  elif [ "$STATUS" = "errored" ]; then
    echo "❌ Build Failed!"
    break
  fi
  
  sleep 30
done
```

Script එක run කරන්න:
```bash
chmod +x build-apk.sh
./build-apk.sh
```

---

## 📋 Build Configuration

`eas.json` file එකේ configuration:

```json
{
  "build": {
    "preview": {
      "android": {
        "buildType": "apk"  // APK format
      }
    },
    "production": {
      "android": {
        "buildType": "apk"  // APK format
      }
    }
  }
}
```

---

## 🔍 Troubleshooting

### Build Failed?

1. **Check logs:**
   ```bash
   eas build:view [build-id]
   ```

2. **Clear cache:**
   ```bash
   eas build --clear-cache
   ```

3. **Check app.json:**
   - Package name valid ද?
   - Version code increment කරලා තියෙනවද?

### Download Link නැත?

1. Build complete වුනාද check කරන්න:
   ```bash
   eas build:list
   ```

2. Expo dashboard හි check කරන්න:
   - https://expo.dev/accounts/[username]/projects

3. Build ID එක use කරලා direct link:
   ```
   https://expo.dev/artifacts/[build-id]
   ```

---

## 📞 Help

- **EAS Build Docs:** https://docs.expo.dev/build/introduction/
- **Expo Discord:** https://chat.expo.dev/
- **Build Status:** https://expo.dev/accounts/[username]/projects

---

**සාර්ථක Build! 🎉**
