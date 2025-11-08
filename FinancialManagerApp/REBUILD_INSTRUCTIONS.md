# 🔄 App එක Rebuild කරන උපදෙස්

## ⚠️ වැදගත්: Color වෙනස්කම් පෙන්වන්න නම්

Style වෙනස්කම් app එකට load කරන්න **cache clear කරලා rebuild** කරන්න ඕනේ.

---

## 🚀 Rebuild කරන ක්‍රම

### ක්‍රමය 1: Metro Bundler Reset (වේගවත්)

```bash
# Terminal එකේ Metro bundler stop කරන්න (Ctrl+C)

# Cache clear කරලා restart කරන්න
npx react-native start --reset-cache

# නව terminal එකකින් run කරන්න
npx react-native run-android
```

### ක්‍රමය 2: Complete Clean Build (සම්පූර්ණ)

```bash
# 1. Metro bundler stop කරන්න (Ctrl+C)

# 2. App uninstall කරන්න phone එකෙන්
adb uninstall com.financialmanager.app

# 3. Android build cache clear කරන්න
cd android
./gradlew clean
cd ..

# 4. Metro cache clear කරන්න
npx react-native start --reset-cache

# 5. නව terminal එකකින් fresh install කරන්න
npx react-native run-android
```

### ක්‍රමය 3: Nuclear Option (සියලු cache clear)

```bash
# Metro bundler stop කරන්න

# සියලු cache clear කරන්න
rm -rf node_modules
rm -rf android/build
rm -rf android/app/build
rm -rf $TMPDIR/react-*
rm -rf $TMPDIR/metro-*

# Reinstall කරන්න
npm install

# Cache clear කරලා run කරන්න
npx react-native start --reset-cache

# නව terminal එකක
npx react-native run-android
```

---

## 🎨 වර්ණ වෙනස්කම් Check කරන්නේ කෙසේද

### පියවර 1: App එක Run කරන්න
```bash
npx react-native start --reset-cache
# නව terminal එකක
npx react-native run-android
```

### පියවර 2: බැංකු තැන්පතුවක් Add කරන්න
1. App එක open කරන්න
2. "🏦 බැංකුවට තැන්පත් කරන්න" tap කරන්න
3. මුදලක් ඇතුළත් කරන්න (උදා: 5000)
4. "සේව් කරන්න" tap කරන්න

### පියවර 3: මෑත ගනුදෙනු Check කරන්න
- Scroll down කරලා "මෑත ගනුදෙනු" section එක බලන්න
- බැංකු තැන්පතු amount එක **bright green colour** එකෙන් පෙන්වෙන්න ඕනේ:
  ```
  🏦 බැංකුවට තැන්පත් කිරීම
  +රු 5,000.00  ← මේක BRIGHT GREEN එකෙන් ✅
  ```

---

## 🐛 තාමත් Green වෙලා නැත්නම්

### Debug කරන්න:

#### 1. Check Transaction Type
App code එකේ console log එකක් add කරන්න:

```javascript
// TransactionItem.js line 9 වෙනස් කරන්න
if (transaction.type === 'bank-deposit') {
  console.log('✅ Bank deposit detected:', transaction);
  icon = '🏦';
  amountStyle = styles.depositAmount;
  sign = '+';
}
```

#### 2. Check Style Loading
styles.js එකේ colour එක හරියටම load වෙනවාද:

```javascript
console.log('Deposit color:', styles.depositAmount.color);
// Should print: #22C55E
```

#### 3. Verify Transaction Data
Transaction එක add කරද්දී type එක හරියටම set වෙනවාද:

```javascript
// App.js line 166-172 check කරන්න
const transaction = {
  id: timestamp,
  type, // මේක 'bank-deposit' විය යුතුයි
  amount,
  ...
};
console.log('Transaction type:', type);
```

---

## ✅ Expected Results / අපේක්ෂිත ප්‍රතිඵල

### වර්ණ පටිතිය:

| Transaction | Colour | Hex Code |
|-------------|--------|----------|
| 🏦 බැංකු තැන්පතු | 🟢 Bright Green | `#22C55E` |
| ⬇️ මුදල් ලබාගැනීම | 🟢 Bright Green | `#22C55E` |
| ⬆️ වියදම් | 🔴 Red | `#EF4444` |

### Screen එකේ පෙනෙන විදිහ:

```
මෑත ගනුදෙනු
━━━━━━━━━━━━━━━━━━━

🏦  බැංකුවට තැන්පත් කිරීම       +රු 10,000  🟢
    2025-11-08 11:30              

⬇️  මුදල් ලබාගැනීම               +රු 5,000   🟢
    2025-11-08 10:15

⬆️  කෑම                          -රු 500     🔴
    2025-11-08 09:45
```

---

## 🔍 Advanced Troubleshooting

### If Still Not Working:

#### 1. Check React Native Version
```bash
npx react-native --version
```

#### 2. Check Device/Emulator
```bash
adb devices
```

#### 3. Check Logs
```bash
# Terminal එකේ errors බලන්න
npx react-native log-android
```

#### 4. Verify File Changes
```bash
# styles.js එකේ වෙනස්කම් තියෙනවාද
grep "depositAmount" src/styles.js
# Should show: color: '#22C55E'
```

---

## 💡 Quick Tips

### 🚀 Fastest Reload:
```bash
# App එකේ ඉන්න අතරතුර
# Press: R R (double tap R key)
# හෝ shake phone එක → "Reload"
```

### 🧹 Clean Everything:
```bash
watchman watch-del-all && 
rm -rf $TMPDIR/react-* && 
rm -rf node_modules && 
npm install && 
npm start -- --reset-cache
```

### 📱 Device එකේ App Data Clear:
```
Settings → Apps → මුදල් කළමනාකරණය → 
Storage → Clear Cache → Clear Data
```

---

## 📞 තාමත් Issue තියේද?

### Check These:

1. ✅ Metro bundler restart කළාද `--reset-cache` සමඟ?
2. ✅ App එක uninstall කරලා reinstall කළාද?
3. ✅ Android build cache clean කළාද?
4. ✅ styles.js file එක save කළාද?
5. ✅ Transaction type එක 'bank-deposit' හරියටද?

### Still Issues:

Debug logs add කරලා check කරන්න:
```javascript
console.log('Transaction:', transaction);
console.log('Type:', transaction.type);
console.log('Style:', amountStyle);
```

---

## ✨ වර්ණ සාර්ථකව Load වෙන්න ඕනේ!

**Bright Vivid Green** (`#22C55E`) - බැංකු තැන්පතු සඳහා  
**Red** (`#EF4444`) - වියදම් සඳහා

---

**Cache clear කරලා rebuild කරන්න අමතක කරන්න එපා!** 🔄
