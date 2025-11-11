# 💰 Personal Finance Management App - මුදල් කළමනාකරණ යෙදුම

A modern, beautiful personal finance management mobile application built with **React Native**, featuring a complete Sinhala interface for managing bank accounts, cash flow, income, and expenses.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![React Native](https://img.shields.io/badge/React%20Native-0.73-61dafb.svg)
![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-lightgrey.svg)

## 🌟 Features

### 🏦 Account Management
- **Bank Account Balance** - Track multiple bank accounts with real-time balances
- **Cash Balance** - Manage your on-hand cash with ease
- **Real-time Balance Updates** - Instant balance calculations across all accounts
- **Multiple Account Support** - Manage People's Bank, Commercial Bank, and more
- **Visual Account Cards** - Beautiful, color-coded account cards with balances

### 💸 Transaction Management
- **Bank Deposits** - Direct deposits or cash-to-bank transfers
- **Bank Withdrawals** - Withdraw money from bank to cash
- **Transaction History** - View all your recent transactions with dates
- **Smart Logic** - Automatic balance updates across accounts

### 📊 Dashboard Features
- **Total Balance Overview** - See your complete financial picture at a glance
- **Bank vs Cash Split** - Separate views for bank and cash balances
- **Quick Actions** - Fast access to common operations
- **Account Summary** - Beautiful cards showing all your accounts

### 🎨 Modern UI/UX
- **Native Mobile Design** - Optimized for mobile devices
- **Smooth Animations** - Native animations and transitions
- **Sinhala Interface** - Complete Sinhala language support (සිංහල)
- **Bottom Navigation** - Easy navigation between sections
- **Gradient Cards** - Beautiful, color-coded account cards
- **Material Design** - Modern, clean interface following Material Design principles

### 📱 Navigation Tabs
- **Dashboard** - Main overview of all accounts and balances
- **Bank** - Dedicated bank account management
- **Cash** - Cash account management
- **Categories** - Expense categorization (coming soon)
- **Settings** - App configuration and preferences

## 📱 Screenshots

### Home Dashboard
- View total balance across all accounts
- Bank account cards with individual balances
- Cash account summary
- Quick add buttons for new accounts

### Account Cards
- Color-coded cards for easy identification
- Account name and number display
- Current balance in Sri Lankan Rupees (රු)
- Default account indicator

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (version 18 or higher) - [Download](https://nodejs.org/)
- **npm** or **yarn** - Comes with Node.js
- **React Native CLI** - Install globally:
  ```bash
  npm install -g react-native-cli
  ```

#### For Android Development:
- **Android Studio** - [Download](https://developer.android.com/studio)
- **Java Development Kit (JDK)** - Version 11 or higher
- **Android SDK** (installed via Android Studio)
- Set up Android environment variables (ANDROID_HOME)

#### For iOS Development (Mac only):
- **Xcode** - Install from Mac App Store
- **CocoaPods** - Install via:
  ```bash
  sudo gem install cocoapods
  ```

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd workspace
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Install required native dependencies**
   ```bash
   # For iOS (Mac only)
   cd ios && pod install && cd ..
   ```

4. **Link vector icons (if needed)**
   ```bash
   npx react-native link react-native-vector-icons
   ```

### Running the App

#### For Android:

1. **Start Metro Bundler**
   ```bash
   npm start
   # or
   yarn start
   ```

2. **Run on Android device/emulator** (in a new terminal)
   ```bash
   npm run android
   # or
   yarn android
   ```

#### For iOS (Mac only):

1. **Start Metro Bundler**
   ```bash
   npm start
   # or
   yarn start
   ```

2. **Run on iOS simulator** (in a new terminal)
   ```bash
   npm run ios
   # or
   yarn ios
   ```

### Building APK for Android

To build a release APK:

```bash
npm run build:apk
# or
yarn build:apk
```

The APK will be generated at:
```
android/app/build/outputs/apk/release/app-release.apk
```

### Troubleshooting

#### Metro Bundler Issues
```bash
# Clear cache and restart
npm start -- --reset-cache
```

#### Android Build Issues
```bash
# Clean Android build
cd android && ./gradlew clean && cd ..
```

#### iOS Build Issues (Mac only)
```bash
# Clean iOS build
cd ios && xcodebuild clean && cd ..
# Reinstall pods
cd ios && pod deintegrate && pod install && cd ..
```

## 📁 Project Structure

```
workspace/
├── android/                 # Android native code
├── ios/                     # iOS native code (Mac only)
├── src/                     # Source code
│   └── App.js              # Main application component
├── assets/                  # Images, fonts, etc.
├── index.js                # Entry point
├── app.json                # App configuration
├── package.json            # Dependencies
├── metro.config.js         # Metro bundler configuration
├── babel.config.js         # Babel configuration
└── README.md               # This file
```

## 💻 Tech Stack

- **Framework:** React Native 0.73
- **Language:** JavaScript (ES6+)
- **Icons:** React Native Vector Icons (Feather)
- **Storage:** AsyncStorage (for data persistence)
- **State Management:** React Hooks (useState)
- **Navigation:** Custom bottom tab navigation
- **Styling:** React Native StyleSheet API

## 🎯 Key Functionalities

### Balance Management
```javascript
// Automatic balance calculations
const handleDeposit = () => {
  if (transactionType === 'bank') {
    setBankBalance(prev => prev + amount);
  } else {
    // Cash to bank transfer
    setCashBalance(prev => prev - amount);
    setBankBalance(prev => prev + amount);
  }
};
```

### Expense Tracking
```javascript
// Expense deduction from cash
const handleExpense = () => {
  setCashBalance(prev => prev - expenseAmount);
  setExpenses(prev => [newExpense, ...prev]);
};
```

## 🔧 Customization

### Adding New Features
1. **New Account Types** - Add more bank or cash accounts
2. **Transaction System** - Implement full transaction management with deposits/withdrawals
3. **Categories** - Add expense/income categories and tracking
4. **Reports** - Add monthly/yearly financial reports with charts
5. **Data Persistence** - Integrate AsyncStorage for permanent data storage
6. **Biometric Auth** - Add fingerprint/face recognition for app security
7. **Multi-currency** - Support for multiple currencies
8. **Budget Planning** - Monthly budget goals and tracking

### Styling Modifications
- Modify colors in `src/App.js` StyleSheet
- Change card designs and layouts
- Update icon styles and sizes
- Customize navigation bar appearance
- Add custom fonts (Sinhala Unicode fonts)
- Modify theme colors (primary: #4F46E5)

## 🌐 Language Support

Currently supports:
- **Sinhala (සිංහල)** - Primary interface language
- **English** - Mixed with Sinhala for button labels and navigation

### Adding More Languages
To add support for Tamil or other languages:

```javascript
// Create a translations file: src/translations.js
const translations = {
  si: { 
    dashboard: 'Dashboard',
    totalBalance: 'සම්පූර්ණ ශේෂය',
    bankAccounts: 'බැංකු ගිණුම්',
    cashAccounts: 'මුදල් ගිණුම්',
  },
  en: { 
    dashboard: 'Dashboard',
    totalBalance: 'Total Balance',
    bankAccounts: 'Bank Accounts',
    cashAccounts: 'Cash Accounts',
  },
  ta: { 
    dashboard: 'Dashboard',
    totalBalance: 'மொத்த இருப்பு',
    bankAccounts: 'வங்கி கணக்குகள்',
    cashAccounts: 'பண கணக்குகள்',
  }
};
```

## 📊 Future Enhancements

- [ ] **Data Persistence** - AsyncStorage for permanent data storage
- [ ] **Transaction System** - Full deposit/withdrawal functionality
- [ ] **Export Features** - PDF/Excel export of transactions
- [ ] **Budget Planning** - Monthly budget goals and tracking
- [ ] **Categories** - Expense categorization with custom categories
- [ ] **Charts & Analytics** - Visual data representation with React Native Charts
- [ ] **Multi-currency** - Support for USD, EUR, GBP alongside LKR
- [ ] **Backup & Sync** - Cloud backup to Firebase/AWS
- [ ] **Receipt Scanning** - Camera integration for receipt capture
- [ ] **Biometric Security** - Fingerprint/Face ID authentication
- [ ] **Notifications** - Push notifications for bill reminders
- [ ] **Dark Mode** - Toggle between light and dark themes
- [ ] **Offline Mode** - Full offline functionality with sync
- [ ] **Multi-language** - Tamil and English language support

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. **Fork the project**
2. **Create your feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Lucide React** - For beautiful icons
- **React Team** - For the amazing framework
- **CSS Gradients** - For inspiration on modern design
- **Sinhala Typography** - For language support

## 🔐 Security & Privacy

This app stores all data locally on your device. No data is sent to external servers. For production use, consider:

- Implementing encrypted local storage
- Adding biometric authentication
- Secure backup solutions
- Regular security audits

## 🐛 Known Issues

- Vector icons may need manual linking on older React Native versions
- First-time setup requires proper Android Studio/Xcode configuration
- Some Sinhala fonts may not render correctly on all devices (install Unicode fonts)

## 📝 Development Roadmap

### Version 1.0 (Current) ✅
- Basic UI with navigation
- Multiple account display
- Balance calculations
- Sinhala interface

### Version 1.1 (Planned)
- Full transaction system
- Data persistence with AsyncStorage
- Add/Edit/Delete accounts
- Transaction history

### Version 1.2 (Planned)
- Category management
- Budget tracking
- Charts and analytics
- Export functionality

### Version 2.0 (Future)
- Cloud backup
- Multi-user support
- Biometric security
- Receipt scanning

## 📞 Contact & Support

For issues, questions, or contributions:
- Create an issue in the GitHub repository
- Email: your-email@example.com
- Twitter: [@yourusername](https://twitter.com/yourusername)

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ යෙදුම - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*

**මෙය මුදල් කළමනාකරණය සඳහා නිර්මාණය කරන ලද ජංගම යෙදුමකි**
