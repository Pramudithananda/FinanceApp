# 📱 APK File එක ලබාගන්න - ඉක්මන් මාර්ගෝපදේශය

## 🎯 මට APK එකක් ඕන. කරන්නේ මොකද්ද?

### ⚡ ඉක්මනම Method (5 Minutes):

```bash
# මේ command එක run කරන්න:
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```

**ඉවරයි!** Script එක ඔක්කොම කරයි. 10-15 minutes වලින් APK ready!

---

## 📥 Download Options

### Option 1: Auto Build (Recommended) ⭐

**ඉක්මනම!** Automated script එක use කරන්න:

```bash
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```

**කරන දේවල්:**
- ✅ React Native project create කරනවා
- ✅ Code setup කරනවා
- ✅ APK build කරනවා
- ✅ Ready file එක දෙනවා

**අවශ්‍ය:**
- Node.js
- Android Studio
- 10-15 minutes

**Result:**
`මුදල්-කළමනාකරණ-v1.0.apk` file එක ලැබෙනවා!

---

### Option 2: Use Existing APK

**වේගවත්ම!** Repo එකේ දැනටමත් APK එකක් තියෙනවා:

```
මුදල් කළමනාකරණ_1.0.apk (21 MB)
```

**Download කරන්න:**
1. File එක workspace folder එකේ තියෙනවා
2. Phone එකට copy කරන්න (USB/Cloud)
3. Install කරන්න

**Note:** මේක old version එකක්

---

### Option 3: Manual Build

**Full Control!** ඔබටම build කරන්න:

**Quick Manual Steps:**
```bash
# 1. New project
cd ..
npx react-native init FinanceApp --version 0.73.0
cd FinanceApp

# 2. Copy code
cp ../workspace/src/App.js ./src/App.js
cp ../workspace/index.js ./index.js

# 3. Install
npm install react-native-vector-icons

# 4. Build
cd android && ./gradlew assembleRelease && cd ..

# 5. Get APK
cp android/app/build/outputs/apk/release/app-release.apk ./FinanceApp.apk
```

**විස්තර:** [BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md)

---

## 🚀 Fastest Way - 3 Commands

```bash
# 1. Make executable
chmod +x COMPLETE_SETUP.sh

# 2. Run
./COMPLETE_SETUP.sh

# 3. Wait... (10-15 min)
```

**Done!** APK file එක ready!

---

## 📲 APK Install කරන්නේ කොහොමද?

### Phone එකේ Install කරන්න:

**1. Transfer කරන්න:**
- USB cable
- WhatsApp/Telegram
- Google Drive
- Bluetooth

**2. Enable කරන්න:**
- Settings → Security
- "Unknown Sources" ON කරන්න

**3. Install කරන්න:**
- APK file එක tap කරන්න
- "Install" click කරන්න
- "Open" click කරන්න

**ඉවරයි!** App එක ready!

---

## 🎯 Which Option කරන්නද?

| Need | Use | Time |
|------|-----|------|
| **Fastest** | Existing APK | 1 min |
| **Easiest** | Auto Script | 10 min |
| **Latest** | Auto Script | 10 min |
| **Control** | Manual Build | 30 min |

**Recommendation:** Auto Script (COMPLETE_SETUP.sh) use කරන්න! ⭐

---

## 💡 Before You Start

**අවශ්‍ය Software:**
- [ ] Node.js (v18+) - [Download](https://nodejs.org/)
- [ ] Android Studio - [Download](https://developer.android.com/studio)
- [ ] JDK (v11+)

**දැනට නැත්නම්:**
[SETUP_GUIDE.md](SETUP_GUIDE.md) බලලා install කරන්න

**දැනටමත් තියෙනවා නම්:**
`./COMPLETE_SETUP.sh` run කරන්න!

---

## 🐛 Problems?

### "ANDROID_HOME not set"
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
```

### "Permission denied"
```bash
chmod +x COMPLETE_SETUP.sh
```

### "Build failed"
```bash
cd android
./gradlew clean
cd ..
```

**More help:** [BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md)

---

## 📚 Full Guides

Detailed instructions අවශ්‍ය නම්:

- **[APK_DOWNLOAD_SINHALA.md](APK_DOWNLOAD_SINHALA.md)** - සම්පූර්ණ APK guide (සිංහල)
- **[BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md)** - Step-by-step build guide
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Environment setup
- **[QUICK_START_SINHALA.md](QUICK_START_SINHALA.md)** - Quick start (සිංහල)

---

## ✅ Success Checklist

- [ ] COMPLETE_SETUP.sh run කළා
- [ ] APK file එක ලැබුණා
- [ ] Phone එකට transfer කළා
- [ ] Install කළා
- [ ] App එක open කළා
- [ ] Finance management පටන් ගත්තා!

---

## 🎉 Summary

**APK Download කරගන්න:**

**Easiest Way:**
```bash
./COMPLETE_SETUP.sh
```

**Fastest Way:**
```bash
# Use existing APK in repo:
# මුදල් කළමනාකරණ_1.0.apk
```

**Best Way:**
```bash
# Auto script for latest version:
./COMPLETE_SETUP.sh
```

---

**ඔබට දැන් APK file එක download කරගන්න පුළුවන්! 🚀**

**Start කරන්න:** `chmod +x COMPLETE_SETUP.sh && ./COMPLETE_SETUP.sh`

---

*Questions? Check [APK_DOWNLOAD_SINHALA.md](APK_DOWNLOAD_SINHALA.md) for details!*
