# 💰 Personal Finance App - APK Build කිරීමේ සම්පූර්ණ මාර්ගෝපදේශය

## 🎯 ඔබට APK එකක් හදලා Download Link එකක් ඕනේද?

**සුභ පැතුම්!** ඔබ නිවැරැදි තැනකට ආවා! මම ඔබට විධි 3ක් දෙනවා APK file එකක් හදලා download link එකක් ගන්න.

---

## 🚀 ක්‍රම 3

### ක්‍රමය 1️⃣: EAS Build - ලේසිම! ☁️ (Recommended)

**ඔබේ computer එකේ Android Studio install කරන්න එපා!**

```bash
# Step 1: EAS CLI install කරන්න
npm install -g eas-cli

# Step 2: Login වෙන්න (free account එකක් හදාගන්න expo.dev එකේ)
eas login

# Step 3: Build කරන්න (cloud එකේ build වෙනවා!)
eas build --platform android --profile preview
```

**කොච්චර කල් යනවද?** 5-10 minutes

**Build වෙලා ඉවර වෙද්දී:**
```
✅ Build successful!
📱 Download your APK: https://expo.dev/artifacts/eas/xyz123.apk

ඔබේ link එක මේකයි! ☝️
එය copy කරලා කාටත් share කරන්න පුළුවන්!
```

---

### ක්‍රමය 2️⃣: GitHub Actions - Automatic Build 🤖

**Code එක push කරන ඔන්න වෙලාවට automatic APK build වෙනවා!**

#### Setup:

1. **Workflow file එකක් හදන්න:**
```bash
mkdir -p .github/workflows
```

2. **මේ code එක copy කරලා `.github/workflows/build-apk.yml` file එකට paste කරන්න:**

```yaml
name: Build APK

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build-apk:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v3
    
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
    
    - name: Make gradlew executable
      run: chmod +x android/gradlew
    
    - name: Build Release APK
      run: |
        cd android
        ./gradlew assembleRelease
    
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-release
        path: android/app/build/outputs/apk/release/app-release.apk
    
    - name: Create Release
      if: startsWith(github.ref, 'refs/tags/')
      uses: softprops/action-gh-release@v1
      with:
        files: android/app/build/outputs/apk/release/app-release.apk
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

3. **GitHub එකට push කරන්න:**
```bash
git add .
git commit -m "Add APK build workflow"
git push
```

4. **Release එකක් trigger කරන්න:**
```bash
git tag v1.0.0
git push origin v1.0.0
```

5. **Download link ගන්න:**
   - GitHub repository → "Releases" tab එකට යන්න
   - ඔබේ release එක click කරන්න
   - APK file එක download කරන්න හෝ link එක copy කරන්න

**Download Link Format:**
```
https://github.com/YOUR_USERNAME/YOUR_REPO/releases/download/v1.0.0/app-release.apk
```

---

### ක්‍රමය 3️⃣: ඔබේ Computer එකෙන් Build කරන්න 💻

**Full control ඕනේ නම්:**

#### Windows වලට:

```bash
# 1. Prerequisites install කරන්න
# - Node.js: https://nodejs.org (LTS version)
# - Java JDK 11: https://adoptium.net
# - Android Studio: https://developer.android.com/studio

# 2. Android SDK path set කරන්න
# System Environment Variables:
# ANDROID_HOME = C:\Users\YourName\AppData\Local\Android\Sdk

# 3. Dependencies install කරන්න
cd /workspace
npm install

# 4. React Native project initialize කරන්න (android folder එක නැතිනම්)
npx react-native init TempApp
xcopy /E /I TempApp\android .\android
rmdir /S /Q TempApp

# 5. APK build කරන්න
cd android
gradlew assembleRelease

# APK location:
# android\app\build\outputs\apk\release\app-release.apk
```

#### Mac/Linux වලට:

```bash
# 1. Prerequisites install කරන්න
brew install node
brew install --cask android-studio
brew install --cask zulu11

# 2. Android SDK path set කරන්න
# ~/.zshrc හෝ ~/.bashrc එකට add කරන්න:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# 3. Dependencies install කරන්න
cd /workspace
npm install

# 4. React Native project initialize කරන්න
npx react-native init TempApp
cp -r TempApp/android ./
rm -rf TempApp

# 5. APK build කරන්න
cd android
./gradlew assembleRelease

# APK location:
# android/app/build/outputs/apk/release/app-release.apk
```

---

## 📤 APK Upload කරලා Download Link ගන්නේ කොහොමද?

### Option A: GitHub Releases (Best!)

```bash
# GitHub CLI install කරලා තියෙනවනම්:
gh release create v1.0.0 \
  android/app/build/outputs/apk/release/app-release.apk \
  --title "Budget Tracker v1.0.0" \
  --notes "මුල්ම release - Personal Finance App"

# Link:
# https://github.com/USERNAME/REPO/releases/download/v1.0.0/app-release.apk
```

**හෝ Web Interface එකෙන්:**
1. GitHub repository → "Releases"
2. "Draft a new release"
3. Tag: v1.0.0
4. APK file drag & drop
5. "Publish release"
6. Download link copy කරන්න

---

### Option B: Google Drive (ලේසිම!)

1. [drive.google.com](https://drive.google.com) යන්න
2. APK file upload කරන්න
3. Right-click → "Share" → "Anyone with the link"
4. Link copy කරන්න

**Direct Download Link:**
```
https://drive.google.com/uc?export=download&id=FILE_ID
```

---

### Option C: Transfer.sh (ඉක්මන් - 14 days)

```bash
cd android/app/build/outputs/apk/release
curl --upload-file app-release.apk https://transfer.sh/BudgetTracker.apk

# Instant link එනවා:
# https://transfer.sh/xxxxx/BudgetTracker.apk
```

---

## 📱 Phone එකේ Install කරන්නේ කොහොමද?

### විධිය:

1. **Phone Settings → Security**
   - "Install unknown apps" enable කරන්න
   - ඔබේ browser එක (Chrome) select කරන්න
   - "Allow from this source" ON කරන්න

2. **Download කරන්න**
   - Phone browser එකෙන් download link එක open කරන්න
   - APK file download වෙනවා

3. **Install කරන්න**
   - Downloads folder එකට යන්න
   - APK file එක tap කරන්න
   - "Install" button එක click කරන්න
   - "Open" click කරන්න

4. **Done!** 🎉
   - App එක දැන් ඔබේ phone එකේ run වෙනවා!

---

## 📚 වැඩිදුර විස්තර සඳහා Documents

මම ඔබට detailed guides ටිකක් හැදුවා:

### 1. `QUICK-START.md` ⚡
- 5 minutes වලින් APK එකක් හදන්න
- ඉක්මන් commands
- Troubleshooting tips

### 2. `BUILD-APK-SINHALA.md` 🇱🇰
- සම්පූර්ණ guide සිංහලෙන්
- හැම step එකම විස්තරාත්මකව
- Common problems සහ solutions

### 3. `APK-HOSTING-LINKS.md` 🔗
- APK hosting options 8ක්
- Free සහ paid services
- Link shorteners
- QR code generation

### 4. `android-setup-guide.md` 🔧
- Android Studio setup
- SDK configuration
- Environment variables
- Build commands

---

## 🎯 ඉක්මන් Commands

```bash
# EAS Build (Recommended)
npm install -g eas-cli
eas login
eas build --platform android

# Local Build
cd android && ./gradlew assembleRelease

# Upload to Transfer.sh
curl --upload-file app-release.apk https://transfer.sh/

# GitHub Release
gh release create v1.0.0 app-release.apk

# Install via USB
adb install app-release.apk
```

---

## ✅ Checklist

### Build කරන කලින්:
- [ ] Node.js installed (v16+)
- [ ] Java JDK 11 installed
- [ ] Android Studio සහ SDK installed (local build සඳහා)
- [ ] `npm install` run කරලා
- [ ] Internet connection active

### Build කරලා ඉවර වෙද්දී:
- [ ] APK file එක හොයාගත්තා
- [ ] APK size check කරලා (< 100MB recommended)
- [ ] Phone එකේ test කරලා
- [ ] Upload කරලා link share කරලා

### Sharing වෙලාවේ:
- [ ] Clear instructions දීලා
- [ ] Version number mention කරලා
- [ ] Minimum Android version කියලා
- [ ] APK size කියලා

---

## 🐛 Problems?

### "Command not found"
```bash
# Node.js හරියට install වෙලා නැහැ
# Download කරලා install කරන්න: https://nodejs.org
```

### "SDK location not found"
```bash
# Android SDK path set කරන්න
echo "sdk.dir=/path/to/Android/Sdk" > android/local.properties
```

### "Build failed"
```bash
# Clean කරලා rebuild කරන්න
cd android
./gradlew clean
./gradlew assembleRelease --stacktrace
```

### "APK too large"
```bash
# Split APKs use කරන්න හෝ bundle එකක් හදන්න
cd android && ./gradlew bundleRelease
```

---

## 📞 Help ඕනේද?

විස්තරාත්මක guides බලන්න:
- `QUICK-START.md` - ඉක්මන් ආරම්භය
- `BUILD-APK-SINHALA.md` - සම්පූර්ණ Sinhala guide
- `APK-HOSTING-LINKS.md` - Hosting options

---

## 🎊 සාර්ථකත්වය සතු වේවා!

ඔබේ Personal Finance Management App එක දැන් Android phone එකක APK file එකක් විදිහට build කරන්න පුළුවන්!

**ඉක්මනින්ම කරන්න අවශ්‍ය:**
```bash
# EAS Build භාවිතා කරන්න (5 minutes)
npm install -g eas-cli
eas login
eas build --platform android
```

**Build වෙලා link එනවා - එය share කරන්න කාටත්!** 🚀📱

---

**Made with ❤️ for Sri Lankan developers**

*දේශීය මුදල් කළමනාකරණ යෙදුම - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා* 🇱🇰
