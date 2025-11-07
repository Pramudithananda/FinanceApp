# 💰 මුදල් කළමනාකරණ - Financial Management App

A modern React Native mobile application for personal finance management with a beautiful Sinhala interface. Track your bank balance, cash, expenses, and income with ease.

## 🌟 Features

### 🏦 Account Management
- **Bank Account Balance** - Track your bank deposits and withdrawals
- **Cash Balance** - Manage your on-hand cash
- **Real-time Balance Updates** - Instant balance calculations
- **Smart Money Flow** - Automatic transfers between bank and cash

### 💸 Transaction Management
- **Bank Deposits** - Direct deposits or cash-to-bank transfers
- **Bank Withdrawals** - Withdraw money from bank to cash
- **Transaction History** - View all your recent transactions
- **Smart Logic** - Cash reduces when depositing to bank, bank reduces when withdrawing

### 📊 Income & Expense Tracking
- **Income Management** - Add income to bank or cash accounts
- **Expense Tracking** - Record and track all your expenses
- **Categorized Expenses** - Organize expenses by categories
- **Budget Goals** - Set targets for each expense category
- **Progress Tracking** - Visual progress bars for budget goals
- **Date & Description** - Detailed transaction information

### 🎨 Modern UI/UX
- **Beautiful Design** - Clean and modern interface
- **Sinhala Interface** - Complete Sinhala language support
- **Responsive Design** - Works perfectly on all Android devices
- **Smooth Animations** - Hover effects and transitions
- **Professional Icon** - Custom financial app icon

## 📱 Screenshots

### Home Dashboard
- View bank and cash balances
- Quick action buttons for deposits and withdrawals
- Recent transaction history

### Expense Management
- Add new expenses with date and description
- View all expense history
- Automatic cash balance deduction
- Category-based organization

### Income Tracking
- Record income with bank/cash selection
- Track income sources and dates
- Automatic balance updates

## 🚀 Getting Started

### Prerequisites
- Node.js (version 16 or higher)
- npm or yarn
- React Native development environment set up
- Android Studio (for Android development)
- Java Development Kit (JDK)

### Installation

1. **Clone or navigate to the project**
   ```bash
   cd financial-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Install required packages**
   ```bash
   npm install @react-native-async-storage/async-storage
   ```

4. **For Android:**
   ```bash
   # Make sure you have Android Studio installed
   # Start Metro bundler
   npm start
   
   # In another terminal, run Android app
   npm run android
   ```

5. **For iOS (Mac only):**
   ```bash
   npm run ios
   ```

## 📁 Project Structure

```
financial-app/
├── android/                 # Android native code
│   └── app/
│       └── src/main/
│           ├── res/        # Android resources (icons, strings)
│           └── AndroidManifest.xml
├── src/
│   ├── components/         # React components
│   │   ├── Modals/        # Modal components
│   │   ├── Header.jsx
│   │   ├── BalanceCard.jsx
│   │   ├── ActionButton.jsx
│   │   ├── CategoryCard.jsx
│   │   └── TransactionItem.jsx
│   ├── utils/             # Utility functions
│   │   ├── formatters.js
│   │   └── storage.js
│   ├── styles.js          # App-wide styles
│   └── App.jsx            # Main app component
├── assets/
│   └── icons/             # App icons (SVG)
├── package.json
├── babel.config.js
├── metro.config.js
├── index.js
└── README.md
```

## 💻 Tech Stack

- **Frontend:** React Native 0.72.6
- **State Management:** React Hooks (useState, useEffect)
- **Storage:** AsyncStorage for local data persistence
- **Styling:** React Native StyleSheet
- **Language:** Sinhala (සිංහල)

## 🎯 Key Functionalities

### Balance Management
```javascript
// Automatic balance calculations
const handleDeposit = () => {
  if (transactionType === 'bank-deposit') {
    setBankBalance(prev => prev + amount);
  } else if (transactionType === 'income') {
    setBankBalance(prev => prev - amount);
    setCashBalance(prev => prev + amount);
  }
};
```

### Expense Tracking
```javascript
// Expense deduction from cash with category tracking
const handleExpense = () => {
  setCashBalance(prev => prev - expenseAmount);
  // Update category spent amount
  updateCategorySpent(categoryId, expenseAmount);
};
```

### Data Persistence
- All data is automatically saved to AsyncStorage
- Data persists between app sessions
- Automatic data loading on app start

## 🔧 Customization

### Adding New Features
1. **New Transaction Types** - Extend the modal system
2. **Categories** - Already supported with full CRUD operations
3. **Reports** - Add monthly/yearly reports
4. **Data Export** - Add export to CSV/PDF functionality

### Styling Modifications
- Modify colors in `src/styles.js`
- Change card designs
- Update animation timings
- Customize responsive breakpoints

### Icon Customization
- Edit `assets/icons/icon.svg` for the source icon
- Run `python3 create_icon.py` to regenerate Android icons
- Icons are automatically generated for all Android densities

## 📊 App Icon

The app includes a custom financial icon featuring:
- Blue gradient background (representing trust and finance)
- Green wallet symbol (representing money management)
- Gold coins (representing currency)
- Sinhala "රු" symbol (Sri Lankan Rupee)

Icons are automatically generated for all Android screen densities:
- mdpi (48x48)
- hdpi (72x72)
- xhdpi (96x96)
- xxhdpi (144x144)
- xxxhdpi (192x192)

## 🌐 Language Support

Currently supports:
- **Sinhala (සිංහල)** - Primary interface language

### Adding More Languages
You can extend the app to support multiple languages by creating a translation system.

## 📝 Building APK

### Development Build
```bash
cd android
./gradlew assembleDebug
```

The APK will be generated at:
`android/app/build/outputs/apk/debug/app-debug.apk`

### Release Build
```bash
cd android
./gradlew assembleRelease
```

The signed APK will be at:
`android/app/build/outputs/apk/release/app-release.apk`

## 🔒 Security Notes

- All data is stored locally on the device
- No data is sent to external servers
- Consider adding encryption for sensitive financial data
- For production, implement proper app signing

## 🐛 Troubleshooting

### Common Issues

1. **Metro bundler not starting**
   ```bash
   npm start --reset-cache
   ```

2. **Android build fails**
   ```bash
   cd android
   ./gradlew clean
   cd ..
   npm run android
   ```

3. **Icons not showing**
   - Make sure icons are in the correct mipmap folders
   - Run `python3 create_icon.py` to regenerate icons

4. **AsyncStorage not working**
   - Make sure `@react-native-async-storage/async-storage` is installed
   - Check Android permissions in AndroidManifest.xml

## 📈 Future Enhancements

- [ ] **Data Export** - PDF/Excel export functionality
- [ ] **Budget Planning** - Monthly budget tracking
- [ ] **Charts & Analytics** - Visual data representation
- [ ] **Multi-currency** - Support for multiple currencies
- [ ] **Backup & Sync** - Cloud synchronization
- [ ] **Receipt Scanning** - Camera integration for receipts
- [ ] **Dark Mode** - Theme switching
- [ ] **Password Protection** - App lock feature

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- **React Native Team** - For the amazing framework
- **AsyncStorage** - For local data persistence
- **Sinhala Typography** - For language support

## 📞 Support

For issues, questions, or contributions, please open an issue on the repository.

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*
