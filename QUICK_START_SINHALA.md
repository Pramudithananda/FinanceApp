# 🚀 ඉක්මන් ආරම්භක මාර්ගෝපදේශය

මුදල් කළමනාකරණ යෙදුම ස්ථාපනය කිරීම සඳහා සරල මාර්ගෝපදේශය

## 📱 පළමු පියවර - පූර්ව අවශ්‍යතා

ඔබේ පරිගණකයේ මේවා ස්ථාපනය කර තිබිය යුතුය:

### Android යෙදුම් සඳහා:
- ✅ Node.js (18 හෝ ඊට වැඩි version)
- ✅ Android Studio
- ✅ Java Development Kit (JDK)
- ✅ Android phone එකක් හෝ emulator එකක්

### දැනට Android Studio නැත්නම්:
1. https://developer.android.com/studio වෙත යන්න
2. Download කර install කරන්න
3. Android SDK install කරන්න

---

## 🔧 දෙවන පියවර - Project Setup කිරීම

### 1. Project එක download කරන්න:
```bash
cd ~/projects
git clone <your-repo-url>
cd workspace
```

### 2. Dependencies install කරන්න:
```bash
npm install
```

මෙය මිනිත්තු කීපයක් ගත වනු ඇත. ඉවසන්න! ☕

---

## ▶️ තුන්වන පියවර - යෙදුම ධාවනය කිරීම

### Android Phone/Emulator එකෙහි:

**Terminal එකක (පළමු terminal):**
```bash
npm start
```

**නව terminal එකක (දෙවන terminal):**
```bash
npm run android
```

### පළමු වතාවට ධාවනය වීමට විනාඩි 2-3ක් ගත විය හැක!

---

## 📱 ඔබේ Phone එකෙහි Test කිරීම

### Android Phone එක සම්බන්ධ කිරීම:

1. **Developer Options සක්‍රීය කරන්න:**
   - Settings → About Phone
   - "Build Number" 7 වතාවක් tap කරන්න
   - "You are now a developer!" message එකක් පෙන්විය යුතුය

2. **USB Debugging සක්‍රීය කරන්න:**
   - Settings → Developer Options
   - "USB Debugging" ON කරන්න

3. **Phone එක USB cable එකකින් සම්බන්ධ කරන්න**

4. **Phone එකෙහි "Allow USB Debugging" message එකට "OK" කරන්න**

5. **Terminal එකෙහි:**
```bash
npm run android
```

---

## 🎨 යෙදුම භාවිතා කිරීම

### Dashboard:
- සියලුම account වල ශේෂ බලන්න
- බැංකු ගිණුම් බලන්න
- මුදල් ශේෂය බලන්න

### Bottom Navigation:
- 🏠 **Dashboard** - ප්‍රධාන පිටුව
- 🏦 **Bank** - බැංකු ගිණුම්
- 💵 **Cash** - මුදල් ගිණුම්
- 📁 **Categories** - වියදම් කාණ්ඩ
- ⚙️ **Settings** - සැකසුම්

---

## 🐛 ගැටලු හා විසඳුම්

### යෙදුම start නොවේ නම්:
```bash
npm start -- --reset-cache
```

### "Unable to load script" error එකක්:
```bash
# Metro bundler නතර කර නැවත start කරන්න
# Ctrl+C press කර:
npm start
```

### Android build fail වේ නම්:
```bash
cd android
./gradlew clean
cd ..
npm run android
```

### Phone එක detect නොවේ නම්:
```bash
# Phone එක connect වී ඇත්දැයි බලන්න:
adb devices

# ලැයිස්තුවේ ඔබේ device එක පෙන්විය යුතුය
```

---

## 🏗️ APK Build කිරීම

### Debug APK (Testing සඳහා):
```bash
npm run build:apk
```

APK file එක මෙහි තිබෙනු ඇත:
```
android/app/build/outputs/apk/release/app-release.apk
```

මෙය ඔබේ phone එකට copy කර install කළ හැක!

---

## ✨ Code වෙනස් කිරීම

### Main file: `src/App.js`

#### Colors වෙනස් කිරීම:
```javascript
// src/App.js හි styles object එකේ:
header: {
  backgroundColor: '#4F46E5',  // මෙය වෙනස් කරන්න
  // උදාහරණ: '#10B981' (green), '#EF4444' (red)
},
```

#### Account එකක් add කිරීම:
```javascript
const [accounts, setAccounts] = useState([
  // ... existing accounts
  { 
    id: 4, 
    name: "Sampath Bank", 
    number: '1111222233', 
    balance: 50000, 
    type: 'bank' 
  }
]);
```

File save කළ විගස යෙදුම auto-reload වේ! 🚀

---

## 📚 වැඩිදුර උදව්

- **පූර්ණ Documentation:** [README.md](README.md) බලන්න
- **සවිස්තර Setup:** [SETUP_GUIDE.md](SETUP_GUIDE.md) බලන්න
- **YouTube Tutorials:** React Native tutorials search කරන්න
- **ප්‍රශ්න තිබේ නම්:** GitHub Issues හි අසන්න

---

## ✅ සාර්ථකද?

ඔබට දැන්:
- ✅ Development environment එක setup කර ඇත
- ✅ යෙදුම phone එකෙහි/emulator එකෙහි run වේ
- ✅ Code වෙනස් කිරීම් කළ හැක
- ✅ APK build කළ හැක

---

## 🎯 මීළඟ අදියර

1. **අත්හදා බලන්න:**
   - Colors වෙනස් කරන්න
   - Text වෙනස් කරන්න
   - Account එකක් add කරන්න

2. **ඉගෙන ගන්න:**
   - React Native basics
   - JavaScript/ES6
   - React Hooks

3. **දියුණු කරන්න:**
   - Database එකක් add කරන්න (AsyncStorage)
   - Transaction system එකක් හදන්න
   - Charts add කරන්න

---

**සාර්ථක දියුණුවක් වේවා! 🎉**

**ප්‍රශ්න තිබේ නම් අසන්න - අපි උදව් කරන්නම්!**
