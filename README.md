# 💰 Sinhala Finance Manager (React Native)

A Sinhala-first personal finance mobile application built with Expo and React Native. Manage your bank balance, cash on hand, and categorized daily expenses through a modern, touch-friendly interface with local language copy throughout the core flows.

## 🌟 Key Features

- **Dashboard Overview** – Live bank and cash balance cards with rich colour cues
- **Quick Actions** – One-tap buttons for deposits, cash withdrawals, and expense logging
- **Expense Categories** – Create, edit, and delete spend categories with targets and per-unit cost tracking
- **Transaction History** – Recent transactions summarised with Sinhala descriptions and emoji cues
- **Persistent Storage** – Automatic state save/load using `AsyncStorage`, so data survives app restarts
- **Sinhala UX Copy** – Buttons, alerts, and helper text localised for Sri Lankan users

## 🚀 Getting Started

### Prerequisites
- Node.js 18+
- npm 9+ (ships with current Node releases)
- Expo CLI (`npm install -g expo-cli`) or use `npx expo` per command

### Installation
```bash
npm install
```

### Running the app
```bash
npm start
```
The Expo Dev Tools dashboard opens in your terminal/browser. From there you can:
- Press **a** to launch on Android (emulator or connected device)
- Press **i** to launch on iOS simulator (macOS only)
- Scan the QR code with the Expo Go app to run on your phone

## 🧭 Project Structure
```
.
├── App.js                   # Root component wiring navigation, state, and persistence
├── app.json                 # Expo configuration (name, slug, bundling pattern)
├── babel.config.js          # Expo/Metro Babel configuration
├── package.json             # Scripts and dependencies
├── src/
│   ├── components/
│   │   ├── ActionButton.js
│   │   ├── BalanceCard.js
│   │   ├── CategoryCard.js
│   │   ├── Header.js
│   │   ├── TransactionItem.js
│   │   └── Modals/
│   │       ├── CategoryDetailsModal.js
│   │       ├── CategoryModal.js
│   │       └── TransactionModal.js
│   ├── styles.js            # Centralised StyleSheet used across screens
│   └── utils/
│       ├── formatters.js    # Locale-aware currency formatter
│       └── storage.js       # AsyncStorage helpers (load/save/clear)
└── මුදල් කළමනාකරණ_1.0.apk   # Legacy Android build (reference only)
```

## 🧩 Core Concepts
- **State Management:** React hooks (`useState`, `useEffect`, `useMemo`) keep balances, transactions, and categories in sync.
- **Persistence:** All financial data is persisted via `AsyncStorage` each time state changes.
- **Hardware Back Handling:** Modal stacks close gracefully when the Android back button is pressed.
- **Input Validation:** Sinhala alerts guide the user through invalid amounts or missing selections.

## 📦 Dependencies
- [`expo`](https://expo.dev/) – Platform tooling and runtime
- [`react-native`](https://reactnative.dev/) – Cross-platform UI primitives
- [`@react-native-async-storage/async-storage`](https://github.com/react-native-async-storage/async-storage) – Local persistence layer

## 🧪 Testing & Verification
- After installing dependencies, run `npm start` and load the app in Expo Go or a simulator.
- Create deposits, withdraw cash, add expenses, and manage categories; verify totals update instantly.
- Close and reopen the app to confirm data persists from `AsyncStorage`.

## 🗺️ Future Enhancements
- Add charts/analytics for monthly trends
- Integrate biometric lock or passcode for privacy
- Sync with cloud storage for multi-device access
- Introduce income/expense category filters and search
- Export transaction history (CSV / PDF)

## 📄 License
This project is released under the MIT License. Feel free to fork, customise, and share with the Sri Lankan community.

---

**සිංහල භාෂාවෙන් සම්පූර්ණ මුදල් කළමනාකරණය – ඔබට අවශ්‍ය පරිදි වෙනස් කරගෙන යන්න!**
