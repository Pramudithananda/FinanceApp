# 💰 Personal Finance Management App - සිංහල

A modern, responsive personal finance management application built with React Native, featuring a beautiful Sinhala interface for managing bank accounts, cash flow, income, and expenses.

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
- **Categorized View** - Separate tabs for income and expenses
- **Date & Description** - Detailed transaction information

### 🎨 Modern UI/UX
- **Glassmorphism Design** - Modern frosted glass effects
- **Gradient Backgrounds** - Beautiful color gradients
- **Smooth Animations** - Hover effects and transitions
- **Responsive Design** - Works perfectly on mobile and desktop
- **Sinhala Interface** - Complete Sinhala language support

## 📱 Screenshots

### Home Dashboard
- View bank and cash balances
- Quick action buttons for deposits and withdrawals
- Recent transaction history

### Expense Management
- Add new expenses with date and description
- View all expense history
- Automatic cash balance deduction

### Income Tracking
- Record income with bank/cash selection
- Track income sources and dates
- Automatic balance updates

## 🚀 Getting Started

### Prerequisites
- Node.js (version 14 or higher)
- npm or yarn
- React Native CLI
- Android Studio (for Android development)
- Xcode (for iOS development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/personal-finance-app.git
   cd personal-finance-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Install required packages**
   ```bash
   npm install @react-native-async-storage/async-storage
   ```

4. **Start the development server**
   ```bash
   npm start
   ```

5. **Run on Android**
   ```bash
   npm run android
   ```

6. **Run on iOS**
   ```bash
   npm run ios
   ```

## 📁 Project Structure

```
BudgetTrackerApp/
├── android/
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── java/com/budgettrackerapp/
│   │   │   │   ├── MainActivity.java
│   │   │   │   └── MainApplication.java
│   │   │   └── AndroidManifest.xml
│   │   └── build.gradle
│   └── build.gradle
├── ios/
├── src/
│   ├── components/
│   │   ├── Modals/
│   │   │   ├── TransactionModal.js
│   │   │   ├── CategoryModal.js
│   │   │   └── CategoryDetailsModal.js
│   │   ├── Header.js
│   │   ├── BalanceCard.js
│   │   ├── ActionButton.js
│   │   ├── CategoryCard.js
│   │   └── TransactionItem.js
│   ├── utils/
│   │   ├── storage.js
│   │   └── formatters.js
│   ├── App.js
│   └── styles.js
├── App.tsx
├── index.js
├── package.json
├── app.json
├── babel.config.js
├── metro.config.js
└── README.md
```

## 💻 Tech Stack

- **Frontend:** React Native 0.73.0
- **Storage:** AsyncStorage
- **Styling:** React Native StyleSheet
- **State Management:** React Hooks (useState, useEffect)
- **Platform:** Android & iOS

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
1. **New Transaction Types** - Extend the modal system
2. **Categories** - Add expense/income categories
3. **Reports** - Add monthly/yearly reports
4. **Data Persistence** - Integrate with localStorage or database

### Styling Modifications
- Modify gradient colors in styles.js
- Change card designs
- Update animation timings
- Customize responsive breakpoints

## 🌐 Language Support

Currently supports:
- **Sinhala (සිංහල)** - Primary interface language
- **English** - Mixed with Sinhala for technical terms

### Adding More Languages
```javascript
const translations = {
  si: { deposit: 'Deposit කරන්න', ... },
  en: { deposit: 'Make Deposit', ... },
  ta: { deposit: 'வைப்பு செய்க', ... }
};
```

## 📊 Future Enhancements

- [ ] **Data Persistence** - Local storage integration
- [ ] **Export Features** - PDF/Excel export
- [ ] **Budget Planning** - Monthly budget tracking
- [ ] **Categories** - Expense categorization
- [ ] **Charts & Analytics** - Visual data representation
- [ ] **Multi-currency** - Support for multiple currencies
- [ ] **Backup & Sync** - Cloud synchronization
- [ ] **Receipt Scanning** - Camera integration for receipts

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

- **React Native Team** - For the amazing framework
- **AsyncStorage** - For data persistence
- **Sinhala Typography** - For language support

## 📞 Contact

Your Name - [@yourusername](https://twitter.com/yourusername) - email@example.com

Project Link: [https://github.com/yourusername/personal-finance-app](https://github.com/yourusername/personal-finance-app)

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*