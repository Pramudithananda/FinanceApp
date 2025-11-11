# ⚡ Quick APK Build - නව Code එකෙන්

## 🎯 Fastest Method: GitHub Actions

මෙය **easiest** method එක:

1. **GitHub repository create කරන්න** (හෝ existing එකක් use කරන්න)

2. **Code push කරන්න:**
   ```bash
   git init
   git add .
   git commit -m "Finance App - New Version"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/finance-app.git
   git push -u origin main
   ```

3. **GitHub Actions automatically build කරයි:**
   - Go to your repository → Actions tab
   - Workflow automatically run වේ
   - Build complete වූ පසු APK download කරන්න
   - Catbox link එක Actions logs එකේ තියෙනවා

## 🔧 Alternative: Local Build

Android Studio installed නම්:

```bash
# 1. Setup environment
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# 2. Install dependencies
npm install

# 3. Build
cd android
./gradlew assembleRelease

# 4. APK location
# android/app/build/outputs/apk/release/app-release.apk
```

## 📤 Upload to Catbox

Build complete වූ පසු:

```bash
curl -F "reqtype=fileupload" \
     -F "fileToUpload=@android/app/build/outputs/apk/release/app-release.apk" \
     https://catbox.moe/user/api.php
```

## ⚠️ Current Limitation

මෙම environment එකේ Android SDK නැති නිසා direct build කිරීමට නොහැකියි.

**Solutions:**
1. ✅ GitHub Actions (Recommended - Free & Automatic)
2. ✅ Local build with Android Studio
3. ✅ Online build services (AppCenter, Bitrise)

---

**මම code එක සූදානම් කරලා තියෙනවා. ඉහත methods එකක් use කරලා build කරන්න!** 🚀
