# Niruma Finance (Personal Finance Manager)

Niruma Finance is a Sinhala-first personal finance manager designed for Sri Lankan users who need to keep track of bank balances, cash on hand, and category-based spending. The app is built with React Native (Expo) and persists data locally on the device with AsyncStorage.

## ✨ Features

- Dual balance tracking for bank and cash
- Guided workflows to:
  - Deposit into the bank
  - Withdraw cash from the bank
  - Record income and expenses
- Unlimited expense categories with targets, unit price insights, and rich progress tracking
- Sinhala copy throughout the UI for a familiar experience
- Category analytics including last updated timestamp, average spend, and transaction history
- Persistent offline storage

## 🚀 Getting Started

1. Install dependencies
   ```bash
   npm install
   ```

2. Start the Expo development server
   ```bash
   npm start
   ```

3. Launch the app
   - Press `a` for Android emulator or connected device
   - Press `i` for iOS simulator (macOS only)
   - Or scan the QR code with Expo Go

## 📁 Project Structure

```
new_finance_app/
├── App.js
├── app.json
├── assets/
│   ├── adaptive-icon.png
│   └── icon.png
├── package.json
├── babel.config.js
└── src/
    ├── components/
    ├── hooks/
    ├── styles/
    └── utils/
```

## 🧰 Available Scripts

- `npm start` – Run Expo development server
- `npm run android` – Build & run on Android
- `npm run ios` – Build & run on iOS (macOS only)
- `npm run web` – Run web build
- `npm run lint` – Run ESLint (configurable)

## 🔒 Data Persistence

State is persisted to AsyncStorage under the key `niruma_finance_state/v1`. Clearing the app storage or uninstalling the application resets balances and categories to the seeded defaults.

## 🎨 Icon

Custom adaptive icon (`assets/icon.png` & `assets/adaptive-icon.png`) features a rupee-inspired coin to reinforce the financial focus. The icon is registered in `app.json` for Expo and Android adaptive icons.

---

Made with ❤️ to support Sinhala-speaking finance teams and households.
