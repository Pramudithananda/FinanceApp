# 📥 APK Download මාර්ගෝපදේශය

## 🎯 APK File එකක් Build කරන්න බැරිද?

ඔබට APK file එකක් download කරගන්න විදිහක් ඕනද? මෙන්න options 3ක්:

---

## 🚀 Option 1: Complete Auto Setup (ඉක්මනම!)

මම ඔබට automated script එකක් හදලා තියෙනවා. මේක run කළාම ඔක්කොම automatic වෙනවා!

### ඉක්මන් Setup:

```bash
# Complete setup script run කරන්න
chmod +x COMPLETE_SETUP.sh
./COMPLETE_SETUP.sh
```

**මේ script එක කරන දේවල්:**
1. ✅ Prerequisites පරීක්ෂා කරනවා (Node, Java, etc.)
2. ✅ React Native project එකක් create කරනවා
3. ✅ අපේ code copy කරනවා
4. ✅ Dependencies install කරනවා
5. ✅ Vector icons setup කරනවා
6. ✅ APK build කරනවා
7. ✅ APK file එක copy කරනවා

**කොපමණ කාලයක් ගතවේද?**
- පළමු වතාවට: ~10-15 minutes
- Dependencies download කරන්න ඕන නිසා

**අවසානයේ:**
ඔබට `මුදල්-කළමනාකරණ-v1.0.apk` file එකක් ලැබෙනවා!

---

## 📱 Option 2: දැනට තියෙන APK Use කරන්න

Repository එකේ දැනටමත් APK එකක් තියෙනවා:

```
මුදල් කළමනාකරණ_1.0.apk (21MB)
```

මේක old version එකක්, ඒත් test කරන්න පුළුවන්.

### Download කරන්නේ කොහොමද?

**Option A: Git Clone කරලා තියෙනවා නම්:**
```bash
# APK file එක phone එකට copy කරන්න
# USB cable එකෙන් හෝ cloud storage use කරන්න
```

**Option B: GitHub වෙබ් interface එකෙන්:**
1. Repository එකේ file list එක බලන්න
2. `මුදල් කළමනාකරණ_1.0.apk` click කරන්න
3. "Download" button එක click කරන්න

---

## 🔧 Option 3: Manual Build (Step by Step)

ඔබට full control එකක් ඕන නම් manual steps follow කරන්න.

### අවශ්‍ය දේවල්:

- ✅ Node.js (v18+)
- ✅ Android Studio
- ✅ JDK (v11+)
- ✅ ANDROID_HOME environment variable

### Steps:

**1. React Native Project Create කරන්න:**
```bash
cd ..
npx react-native init FinanceApp --version 0.73.0
cd FinanceApp
```

**2. අපේ Code Copy කරන්න:**
```bash
cp ../workspace/src/App.js ./src/App.js
cp ../workspace/index.js ./index.js
cp ../workspace/app.json ./app.json
```

**3. Dependencies Install කරන්න:**
```bash
npm install react-native-vector-icons
```

**4. Vector Icons Setup:**

`android/app/build.gradle` file එකේ add කරන්න:
```gradle
apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"
```

**5. APK Build කරන්න:**
```bash
cd android
./gradlew clean
./gradlew assembleRelease
cd ..
```

**6. APK Copy කරන්න:**
```bash
cp android/app/build/outputs/apk/release/app-release.apk ./මුදල්-කළමනාකරණ-v1.0.apk
```

**විස්තර සඳහා:** [BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md) බලන්න

---

## 📲 APK Install කරන්නේ කොහොමද?

APK file එක phone එකට install කරන්න:

### පියවර 1: APK Transfer කරන්න

**Option A: USB Cable:**
```bash
# Phone එක computer එකට connect කරන්න
# APK file එක phone storage එකට copy කරන්න
```

**Option B: Cloud Storage:**
- Google Drive, Dropbox, etc. use කරන්න
- APK upload කරන්න
- Phone එකෙන් download කරන්න

**Option C: WhatsApp/Telegram:**
- APK file එක own number එකට send කරන්න
- Phone එකෙන් download කරන්න

### පියවර 2: Unknown Sources Enable කරන්න

**Settings → Security → Unknown Sources**

හෝ

**Settings → Apps → Special Access → Install Unknown Apps**

File Manager app එකට permission දෙන්න.

### පියවර 3: APK Install කරන්න

1. File manager app එකෙන් APK file එක හොයන්න
2. APK file එක tap කරන්න
3. "Install" button එක click කරන්න
4. Security warning ආවොත් "Install Anyway" select කරන්න
5. Install වුණාට පස්සේ "Open" click කරන්න

### ✅ සාර්ථකයි!

App එක දැන් phone එකේ තියෙනවා. Enjoy! 🎉

---

## 🎯 Quick Comparison

| Option | කාලය | අපහසුතාව | Recommended For |
|--------|------|-----------|-----------------|
| **Auto Setup** | 10-15 min | Easy | Everyone |
| **Existing APK** | 1 min | Very Easy | Quick testing |
| **Manual Build** | 30+ min | Medium | Developers |

---

## 🐛 Common Issues

### 1. "ANDROID_HOME is not set"

**විසඳුම:**
```bash
# Terminal එකේ run කරන්න:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### 2. "Could not find or load main class"

**විසඳුම:**
```bash
cd android
gradle wrapper
./gradlew clean
cd ..
```

### 3. "App not installed" phone එකේ

**විසඳුම:**
- Old version එකක් තියෙනවා නම් uninstall කරන්න
- Storage space තියෙනවද බලන්න
- Unknown sources permission තියෙනවද බලන්න

### 4. Script errors

**විසඳුම:**
```bash
# Make sure script is executable
chmod +x COMPLETE_SETUP.sh

# Run with bash
bash COMPLETE_SETUP.sh
```

---

## 📚 වැඩිදුර උදව්

### Detailed Guides:
- **[BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md)** - සම්පූර්ණ APK build guide
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Environment setup
- **[QUICK_START_SINHALA.md](QUICK_START_SINHALA.md)** - සිංහල quick start

### Video Tutorials:
- YouTube: "React Native APK Build Tutorial"
- Search: "React Native Android APK සිංහල"

---

## ⚡ ඉක්මන් Commands

```bash
# Complete auto setup
chmod +x COMPLETE_SETUP.sh && ./COMPLETE_SETUP.sh

# අනිත් scripts
chmod +x build-apk.sh && ./build-apk.sh
chmod +x build-apk-simple.sh && ./build-apk-simple.sh
```

---

## 💡 Tips

### Build කරන්න කලින්:
1. ✅ Node.js install කරන්න
2. ✅ Android Studio install කරන්න
3. ✅ ANDROID_HOME set කරන්න
4. ✅ Internet connection තියෙනවද බලන්න (dependencies download කරන්න)

### APK Share කරන්න:
1. Google Drive, Dropbox use කරන්න
2. WhatsApp/Telegram via send කරන්න
3. USB cable එකෙන් transfer කරන්න
4. QR code generate කරලා share කරන්න

### Play Store එකට Upload කරන්න නම්:
1. APK එක sign කරන්න ඕන
2. App bundle (AAB) use කරන්න better
3. Developer account එකක් ඕන ($25 one-time)
4. App listing create කරන්න

---

## 🎉 Success Steps

ඔබ APK file එක download කරගත්තාට පස්සේ:

1. ✅ Phone එකට transfer කරන්න
2. ✅ Unknown sources enable කරන්න
3. ✅ APK install කරන්න
4. ✅ App open කරන්න
5. ✅ Finance management පටන් ගන්න!

---

## 📞 උදව් අවශ්‍යද?

**Documentation:**
- Main: [README.md](README.md)
- Build: [BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md)
- Setup: [SETUP_GUIDE.md](SETUP_GUIDE.md)

**Community:**
- React Native Docs
- Stack Overflow
- GitHub Issues

---

## 🚀 Next Steps

1. **දැන්:** COMPLETE_SETUP.sh run කරන්න
2. **10 minutes වලින්:** APK ready වෙයි
3. **එතකොට:** Phone එකට install කරන්න
4. **Enjoy:** ඔබේ finance app use කරන්න!

---

**සාර්ථක APK download කිරීමක් වේවා! 🎉**

**Questions? Check [BUILD_APK_GUIDE.md](BUILD_APK_GUIDE.md) for detailed instructions!**

---

*මුදල් කළමනාකරණ යෙදුම - Version 1.0*  
*සිංහල Interface | Android Support | Free & Open Source*
