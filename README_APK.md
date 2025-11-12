# 📥 APK File එක Download කරන්න

## 🎯 ඉක්මන් Summary

ඔබට **3 options** තියෙනවා APK file එකක් ලබාගන්න:

---

## ⚡ Option 1: Auto Setup Script (BEST!) ⭐

**ඉක්මනම සහ පහසුම method!**

### Single Command:

```bash
chmod +x COMPLETE_SETUP.sh && ./COMPLETE_SETUP.sh
```

### මේක කරන දේවල්:

✅ React Native project එකක් create කරනවා  
✅ ඔබේ code copy කරනවා  
✅ Dependencies install කරනවා  
✅ Vector icons setup කරනවා  
✅ APK build කරනවා  
✅ `මුදල්-කළමනාකරණ-v1.0.apk` file එක දෙනවා

### කොපමණ කාලයක්?
⏱️ 10-15 minutes (පළමු වතාවට)

### අවශ්‍ය දේවල්:
- Node.js (v18+)
- Android Studio
- JDK (v11+)

---

## 📦 Option 2: Existing APK Use කරන්න

**වේගවත්ම method!**

Repository එකේ දැනටමත් APK එකක් තියෙනවා:

```
මුදල් කළමනාකරණ_1.0.apk (21 MB)
```

### Download කරන්න:
1. Workspace folder එකේ file එක තියෙනවා
2. Phone එකට copy කරන්න (USB/WhatsApp/Drive)
3. Install කරන්න

⚠️ **Note:** මේක old version එකක්

---

## 🔧 Option 3: Manual Build

**Full control අවශ්‍ය නම්:**

### Quick Commands:

```bash
# Project create කරන්න
cd ..
npx react-native init FinanceApp --version 0.73.0
cd FinanceApp

# Code copy කරන්න
cp ../workspace/src/App.js ./src/App.js
cp ../workspace/index.js ./index.js
cp ../workspace/app.json ./app.json

# Dependencies
npm install react-native-vector-icons

# Vector icons setup
echo 'apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"' >> android/app/build.gradle

# Build APK
cd android
./gradlew assembleRelease
cd ..

# Copy APK
cp android/app/build/outputs/apk/release/app-release.apk ./FinanceApp.apk
```

⏱️ 20-30 minutes

---

## 📲 APK Install කරන්නේ කොහොමද?

### පියවර 1: Phone එකට Transfer කරන්න

**Options:**
- USB cable
- WhatsApp/Telegram (self-send)
- Google Drive/Dropbox
- Bluetooth
- Email

### පියවර 2: Unknown Sources Enable කරන්න

**Android Settings:**
- `Settings → Security → Unknown Sources` (ON කරන්න)

හෝ

- `Settings → Apps → Special Access → Install Unknown Apps`
- File Manager app එකට permission දෙන්න

### පියවර 3: Install කරන්න

1. File manager app open කරන්න
2. APK file එක tap කරන්න
3. "Install" button click කරන්න
4. Warning එකක් ආවොත් "Install Anyway" select කරන්න
5. "Open" click කරන්න

### ✅ ඉවරයි!

App එක දැන් ඔබේ phone එකේ! 🎉

---

## 🎯 Which Option Should I Choose?

| Option | Time | Difficulty | Latest Code | Recommended For |
|--------|------|------------|-------------|-----------------|
| **Auto Script** | 10-15 min | Easy ⭐ | ✅ Yes | Everyone |
| **Existing APK** | 1 min | Very Easy | ❌ Old | Quick testing |
| **Manual Build** | 20-30 min | Medium | ✅ Yes | Developers |

**👉 Recommendation:** Use **Auto Script (Option 1)** for best results!

---

## 🚀 Start Now!

### ඉක්මනම Way:

```bash
# One command - does everything!
chmod +x COMPLETE_SETUP.sh && ./COMPLETE_SETUP.sh
```

### Alternative Scripts:

```bash
# දැනටමත් React Native project එකක් තියෙනවා නම්:
chmod +x build-apk.sh && ./build-apk.sh

# Simple version:
chmod +x build-apk-simple.sh && ./build-apk-simple.sh
```

---

## 📚 Detailed Documentation

වැඩිදුර විස්තර අවශ්‍ය නම්:

### සිංහල Guides:
- **[HOW_TO_GET_APK_SINHALA.md](HOW_TO_GET_APK_SINHALA.md)** - ඉක්මන් guide
- **[APK_DOWNLOAD_SINHALA.md](APK_DOWNLOAD_SINHALA.md)** - සම්පූර්ණ guide
- **[QUICK_START_SINHALA.md](QUICK_START_SINHALA.md)** - Quick start

### English Guides:
- **[BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md)** - Complete build guide
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Environment setup
- **[README.md](README.md)** - Main documentation

---

## 🐛 Troubleshooting

### "Permission denied"
```bash
chmod +x COMPLETE_SETUP.sh
```

### "ANDROID_HOME not set"
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### "Build failed"
```bash
cd android
./gradlew clean
./gradlew assembleRelease --stacktrace
cd ..
```

### "App not installed on phone"
- Old version එකක් uninstall කරන්න
- Storage space තියෙනවද බලන්න
- Unknown sources enabled කරලා තියෙනවද බලන්න

---

## 💡 Tips

### පළමු වතාවට Build කරන්න කලින්:

1. ✅ Node.js install කරන්න: https://nodejs.org/
2. ✅ Android Studio install කරන්න: https://developer.android.com/studio
3. ✅ JDK install කරන්න (v11+)
4. ✅ ANDROID_HOME set කරන්න
5. ✅ Internet connection good ද බලන්න

### APK Share කරන්න:

- Google Drive, Dropbox use කරන්න
- WhatsApp/Telegram via send කරන්න
- QR code generate කරන්න
- Direct download link create කරන්න

---

## 📁 APK File Locations

Build කිරීමෙන් පස්සේ APK file එක මෙතන තියෙනවා:

```
# Auto script use කළා නම්:
workspace/මුදල්-කළමනාකරණ-v1.0.apk
../FinanceApp/මුදල්-කළමනාකරණ-v1.0.apk

# Manual build කළා නම්:
android/app/build/outputs/apk/release/app-release.apk
```

---

## ✅ Success Checklist

Build process එක සාර්ථක නම්:

- [x] Script එක errors නැතිව complete වුණා
- [x] APK file එකක් generate වුණා
- [x] File size ~15-25 MB වගේ
- [x] File name: `මුදල්-කළමනාකරණ-v1.0.apk`
- [x] Phone එකට transfer කරන්න ready

---

## 🎉 Final Steps

1. **APK Build කරන්න:**
   ```bash
   ./COMPLETE_SETUP.sh
   ```

2. **Phone එකට Transfer කරන්න:**
   - USB / Cloud / WhatsApp use කරන්න

3. **Install කරන්න:**
   - APK tap කරලා install කරන්න

4. **Enjoy:**
   - ඔබේ finance app use කරන්න! 💰

---

## 📞 Need Help?

**Quick Help:**
- [HOW_TO_GET_APK_SINHALA.md](HOW_TO_GET_APK_SINHALA.md) - සිංහල quick guide
- [BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md) - Detailed build instructions

**Full Documentation:**
- [START_HERE.md](START_HERE.md) - Where to begin
- [SETUP_GUIDE.md](SETUP_GUIDE.md) - Environment setup
- [README.md](README.md) - Complete documentation

---

**සාර්ථක APK build කිරීමක් වේවා! 🚀**

**Start කරන්න:** `chmod +x COMPLETE_SETUP.sh && ./COMPLETE_SETUP.sh`

---

*මුදල් කළමනාකරණ යෙදුම v1.0 | Built with React Native | Made for Sri Lanka 🇱🇰*
