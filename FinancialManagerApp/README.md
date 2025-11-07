# 💰 Financial Manager App - මුදල් කළමනාකරණය

A modern, feature-rich personal finance management application built with React Native, featuring a beautiful Sinhala interface for comprehensive money management.

## 🌟 Features

### 💳 Account Management
- **Bank Account Balance** - Track bank deposits and withdrawals
- **Cash Balance Management** - Monitor on-hand cash
- **Real-time Updates** - Instant balance calculations
- **Smart Money Flow** - Seamless transfers between bank and cash

### 📊 Advanced Budget Tracking
- **Category-based Budgeting** - Create custom expense categories
- **Budget Goals** - Set monthly spending targets
- **Progress Visualization** - Visual progress bars for each category
- **Budget Alerts** - Warnings when approaching or exceeding limits

### 💸 Transaction Management
- **Bank Deposits** - Record income and deposits
- **Cash Withdrawals** - Transfer money from bank to cash
- **Expense Tracking** - Categorize and track all expenses
- **Transaction History** - Complete transaction log with details
- **Smart Validation** - Prevents overspending and invalid transactions

### 📈 Analytics & Insights
- **Category Details** - Detailed breakdown of spending per category
- **Transaction Statistics** - Average transaction amounts
- **Remaining Budget** - Track available budget per category
- **Percentage Tracking** - Visual representation of budget usage

### 🎨 Modern UI/UX
- **Material Design** - Clean, modern interface
- **Gradient Cards** - Beautiful color gradients
- **Smooth Animations** - Fluid transitions and interactions
- **Responsive Layout** - Optimized for all screen sizes
- **Sinhala Interface** - Complete Sinhala language support
- **Intuitive Navigation** - Easy-to-use modal-based interactions

### 💾 Data Persistence
- **Automatic Saving** - All data saved automatically
- **AsyncStorage** - Local data storage
- **No Internet Required** - Works completely offline

## 📱 Screenshots

### Main Dashboard
- Bank and cash balance cards with quick actions
- Category management with visual progress
- Recent transaction history

### Transaction Modals
- Bank deposit interface
- Income/withdrawal interface
- Expense tracking with category selection

### Category Management
- Create and edit categories
- Set budget targets
- View detailed category analytics

## 🚀 Installation & Setup

### Prerequisites
- Node.js (version 14 or higher)
- React Native development environment
- Android Studio (for Android development)
- Xcode (for iOS development - macOS only)

### Step 1: Clone the Repository
```bash
cd /workspace/FinancialManagerApp
```

### Step 2: Install Dependencies
```bash
npm install
# or
yarn install
```

### Step 3: Install Required Packages
```bash
npm install @react-native-async-storage/async-storage
npm install react-native-vector-icons
```

### Step 4: Link Native Dependencies (React Native < 0.60)
```bash
npx react-native link @react-native-async-storage/async-storage
```

### Step 5: Run the App

#### For Android:
```bash
npx react-native run-android
```

#### For iOS:
```bash
cd ios && pod install && cd ..
npx react-native run-ios
```

## 🔨 Building APK

### Debug APK
```bash
cd android
./gradlew assembleDebug
```
Output: `android/app/build/outputs/apk/debug/app-debug.apk`

### Release APK
1. Generate a signing key:
```bash
keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

2. Configure `android/gradle.properties`:
```properties
MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
MYAPP_RELEASE_KEY_ALIAS=my-key-alias
MYAPP_RELEASE_STORE_PASSWORD=*****
MYAPP_RELEASE_KEY_PASSWORD=*****
```

3. Build release APK:
```bash
cd android
./gradlew assembleRelease
```
Output: `android/app/build/outputs/apk/release/app-release.apk`

## 📁 Project Structure

```
FinancialManagerApp/
├── src/
│   ├── components/
│   │   ├── Header.js              # App header with title
│   │   ├── BalanceCard.js         # Bank/Cash balance cards
│   │   ├── ActionButton.js        # Action buttons
│   │   ├── CategoryCard.js        # Budget category cards
│   │   ├── TransactionItem.js     # Transaction list item
│   │   ├── TransactionModal.js    # Transaction input modal
│   │   ├── CategoryModal.js       # Category creation modal
│   │   └── CategoryDetailsModal.js # Category analytics modal
│   ├── utils/
│   │   ├── storage.js             # AsyncStorage utilities
│   │   └── formatters.js          # Currency & date formatters
│   ├── assets/
│   │   └── icons/
│   │       └── app-icon.svg       # App icon (custom financial icon)
│   ├── styles.js                  # Global styles
│   └── App.js                     # Main app component
├── android/                       # Android native code
├── ios/                          # iOS native code
├── index.js                      # App entry point
├── app.json                      # App configuration
├── package.json                  # Dependencies
├── babel.config.js               # Babel configuration
└── README.md                     # This file
```

## 💻 Tech Stack

- **Framework:** React Native 0.72.0
- **Language:** JavaScript (ES6+)
- **Storage:** AsyncStorage
- **Icons:** React Native Vector Icons
- **State Management:** React Hooks (useState, useEffect)
- **Styling:** StyleSheet API with custom design system

## 🎯 Key Features Explained

### 1. Smart Transaction Logic
```javascript
// Bank Deposit: Increases bank balance
// Income: Transfers from bank to cash
// Expense: Deducts from cash and updates category budget
```

### 2. Category Budget System
- Each category has a target budget
- Real-time tracking of spent amount
- Visual progress bars with color coding:
  - 🟢 Green: Under 80% of budget
  - 🟡 Yellow: 80-100% of budget
  - 🔴 Red: Over budget

### 3. Data Persistence
- Automatic saving on every change
- Loads previous data on app start
- No manual save required

### 4. Validation System
- Prevents negative amounts
- Checks sufficient balance
- Validates category selection for expenses
- Prevents duplicate category names

## 🎨 Customization

### Colors
Edit `src/styles.js` to customize the color scheme:
```javascript
export const colors = {
  primary: '#4F46E5',    // Main accent color
  success: '#10B981',    // Success/income
  danger: '#EF4444',     // Danger/expense
  // ... more colors
};
```

### App Icon
Replace the icon in `src/assets/icons/app-icon.svg` with your custom design.

### Language
Currently supports Sinhala. To add more languages, create a translation system in `src/utils/translations.js`.

## 🐛 Troubleshooting

### Common Issues

**1. Metro bundler not starting:**
```bash
npx react-native start --reset-cache
```

**2. Build errors:**
```bash
cd android && ./gradlew clean
cd ..
npm start -- --reset-cache
```

**3. AsyncStorage errors:**
```bash
npm install @react-native-async-storage/async-storage
npx react-native link @react-native-async-storage/async-storage
```

**4. Icon not showing:**
- Ensure app-icon.svg exists in `src/assets/icons/`
- Rebuild the app completely

## 🔮 Future Enhancements

- [ ] **Data Export** - Export transactions to CSV/Excel
- [ ] **Biometric Lock** - Fingerprint/Face ID protection
- [ ] **Cloud Sync** - Backup to Google Drive/iCloud
- [ ] **Charts & Graphs** - Visual spending analytics
- [ ] **Multi-currency** - Support for multiple currencies
- [ ] **Receipt Scanning** - Camera integration for receipts
- [ ] **Recurring Transactions** - Auto-add monthly bills
- [ ] **Dark Mode** - Dark theme support
- [ ] **Notifications** - Budget alerts and reminders
- [ ] **Tamil Support** - Additional language option

## 📊 Version History

### v2.0 - Enhanced (Current)
- Improved UI/UX with modern design
- Better category management
- Enhanced transaction modals
- Detailed category analytics
- Progress visualization
- Better error handling

### v1.0 - Initial Release
- Basic bank and cash management
- Simple transaction tracking
- Category system
- Local data storage

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the project
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- **React Native** - Amazing cross-platform framework
- **AsyncStorage** - Reliable local storage solution
- **Sinhala Typography** - Beautiful language support
- **Material Design** - Design inspiration

## 📞 Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Email: support@financialmanager.app

## 🌐 Resources

- [React Native Documentation](https://reactnative.dev/)
- [AsyncStorage Documentation](https://react-native-async-storage.github.io/async-storage/)
- [Android Studio Setup](https://reactnative.dev/docs/environment-setup)

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා විශේෂයෙන් නිර්මාණය කරන ලද්දකි*

## 🚀 Quick Start Commands

```bash
# Install dependencies
npm install

# Run on Android
npx react-native run-android

# Run on iOS
npx react-native run-ios

# Build APK
cd android && ./gradlew assembleRelease

# Start Metro bundler
npm start

# Clear cache
npm start -- --reset-cache
```

## 💡 Tips

1. **First Time Setup**: Make sure all prerequisites are installed
2. **Testing**: Test on real device for best performance
3. **Storage**: Data is stored locally - clearing app data will reset everything
4. **Backup**: Regularly backup important transaction data
5. **Performance**: Keep transaction history under 1000 items for optimal performance

---

**Version:** 2.0.0  
**Last Updated:** 2025-11-07  
**Status:** Production Ready ✅
