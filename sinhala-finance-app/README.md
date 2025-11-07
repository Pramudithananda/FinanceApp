# සිංහල මුදල් කළමනාකරණ ඇප් (Sinhala Personal Finance)

**Sinhala Finance** යනු ශ්‍රී ලාංකීය භාවිතකරුවන් සඳහා නිර්මාණය කළ නවීන React Native/Expo ඇප් එකකි. බැංකු ශේෂය, cash මාරු කිරීම, වියදම් කාණ්ඩ සහ මෑත ගනුදෙනු Sinhala UI එකකින් පහසුවෙන් පාලනය කරන්න.

## ✨ මුලික විශේෂාංග

- 🏦 **ශේෂ පාලනය** – බැංකු සහ cash ශේෂවල නවීන card දර්ශන, එක්-තල්ලු ක්‍රියාකාරීත්වය සමඟ.
- 💸 **Transaction Modal 3ක්** – තැන්පතු, cash මාරු කිරීම, විස්තරාත්මක වියදම් සටහන් කිරීම.
- 📂 **කාණ්ඩ කළමනාකරණය** – වර්ණ මාලාව, ඒකක මිල, ඉලක්ක මුදල් ඇතුළත් කරන responsive UI.
- 📊 **භූමිකාත්මක ප්‍රගති පෙන්වීම** – තත්‍ය කාලීන progress bar, ඉතිරිය, මෑත transaction popup.
- 💾 **ස්ථානික දත්ත සුරක්ෂිත කිරීම** – AsyncStorage භාවිතයෙන් offline භාවිතයට state ප්‍රතිසංරක්ෂණය/යළි ලබා ගැනීම.
- 🎨 **Sinhala-first UI** – තේරුම්ගන්නාසුලු සිංහල copy, Unicode iconography, ප්‍රතිචාරශීලි හැඩතල.

## 📁 ගොනු ව්‍යවස්ථාව

```
sinhala-finance-app/
├── App.js                    # SafeAreaProvider + Dashboard screen
├── app.json                  # Expo configuration (icon, splash, adaptive icon)
├── package.json              # Scripts & dependencies
├── babel.config.js
├── assets/
│   ├── icon.png
│   ├── adaptive-icon.png
│   └── splash.png
└── src/
    ├── components/           # Reusable UI blocks
    ├── components/modals/    # Transaction & category modals
    ├── hooks/                # useFinanceData state manager
    ├── screens/              # DashboardScreen
    ├── theme/                # colors & styles
    └── utils/                # currency/date formatters
```

## 🚀 Development Setup

1. **Dependencies install කරන්න**
   ```bash
   cd sinhala-finance-app
   npm install
   # or
   yarn install
   ```

2. **Expo dev server start කරන්න**
   ```bash
   npm run start
   ```

3. **Android build/preview**
   ```bash
   npm run android
   ```

4. **iOS preview (macOS)**
   ```bash
   npm run ios
   ```

> Expo CLI ඔබට QR code එකක් ලබා දෙන අතර එය Expo Go app එකෙන් scan කර ප්‍රයෝගය බලාගත හැක.

## 🛠️ Key Implementation Notes

- `useFinanceData` hook එක AsyncStorage හරහා state hydrate/persist කිරීම සිදු කරයි.
- Transactions සදහා `TRANSACTION_TYPES` constant එක භාවිත කරනු ලැබේ, UI ට icon + Sinhala copy mapping.
- සියලු උපුටාගත් currency values `Intl.NumberFormat('si-LK', { currency: 'LKR' })` භාවිතයෙන් සැකසේ.
- Adaptive app icon එක (`assets/adaptive-icon.png`) සහ Expo splash storyboard එක (`assets/splash.png`) මුදල් තේමාවට ගැළපෙන රුපි රටාවකින් නිර්මාණය කර ඇත.

## 🧪 Suggested QA Checklist

- ✅ Cash balance එකට වඩා වැඩි වියදම් attempt කිරීමේදී guard alert පෙන්වීම.
- ✅ Category delete කිරීමෙන් පසු transactions හි snapshot නම පවතින බව.
- ✅ App restart කිරීමට පසුව AsyncStorage තුළ data යළි reads/persists වීම.
- ✅ Sinhala fonts (rupee sign) Android/Expo Go තුළ නිවැරදි ලෙස render වීම.

## 🔄 APK / Icon Integration Guidance

Expo project එකෙන් production APK (Android) හෝ AAB සැකසීමට:

```bash
expo prebuild --platform android
expo build:android   # or 'eas build -p android'
```

Build pipeline දුර දිගු කරන විට `app.json` හරහා icon/adaptive icon, splash image ඔබට ගැනීමට අවශ්‍ය අනෙකුත් assets update කරන්න. දැනට `./assets/icon.png` හි ඇති රුපියල්-තේමාවේ icon එක APK ලා launch icon ලෙස configure කර ඇත.

## 📌 Next Steps / Ideas

- 📈 Charts & analytics (Victory Native / Recharts)
- ☁️ Cloud sync (Supabase / Firebase) හරහා multi-device backups
- 🔐 පාස්කෝඩ් / biometric lock
- 🌐 Bi-lingual (Sinhala + English) toggle

---

**Made with ❤️ for the Sri Lankan community — මුදල් තත්ත්වය පාලනය කරමින් ධනාත්මක ජීවිතයක්!**
