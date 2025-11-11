# 💰 Personal Finance Management App - සිංහල

A modern, responsive personal finance management application built with React, featuring a beautiful Sinhala interface for managing bank accounts, cash flow, income, and expenses.

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

## 🚀 Getting Started (Web)

### Prerequisites
- Node.js (version 14 or higher)
- npm or yarn

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
   npm install lucide-react
   ```

4. **Start the development server**
   ```bash
   npm start
   ```

5. **Open your browser**
   Navigate to `http://localhost:3000`

### Quick Setup Alternative

1. **Create a new React app**
   ```bash
   npx create-react-app my-finance-app
   cd my-finance-app
   ```

2. **Install Lucide React for icons**
   ```bash
   npm install lucide-react
   ```

3. **Replace src/App.js with:**
   ```jsx
   import React from 'react';
   import FinanceApp from './components/FinanceApp';
   
   function App() {
     return <FinanceApp />;
   }
   
   export default App;
   ```

4. **Create src/components/FinanceApp.jsx and paste the component code**

5. **Run the app**
   ```bash
   npm start
   ```

## 📁 Project Structure (Web)

```
personal-finance-app/
├── public/
│   ├── index.html
│   └── favicon.ico
├── src/
│   ├── components/
│   │   └── FinanceApp.jsx
│   ├── App.js
│   ├── index.js
│   └── index.css
├── package.json
└── README.md
```

## 💻 Tech Stack (Web)

- **Frontend:** React 18+
- **Icons:** Lucide React
- **Styling:** CSS-in-JS with styled-jsx
- **State Management:** React Hooks (useState)
- **Responsive Design:** CSS Grid & Flexbox

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

## 🔧 Customization (Web)

### Adding New Features
1. **New Transaction Types** - Extend the modal system
2. **Categories** - Add expense/income categories
3. **Reports** - Add monthly/yearly reports
4. **Data Persistence** - Integrate with localStorage or database

### Styling Modifications
- Modify gradient colors in CSS
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

## 📊 Future Enhancements (Web)

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

- **Lucide React** - For beautiful icons
- **React Team** - For the amazing framework
- **CSS Gradients** - For inspiration on modern design
- **Sinhala Typography** - For language support

## 📞 Contact

Your Name - [@yourusername](https://twitter.com/yourusername) - email@example.com

Project Link: [https://github.com/yourusername/personal-finance-app](https://github.com/yourusername/personal-finance-app)

## 🚀 Demo

[Live Demo](https://your-demo-link.netlify.app) | [Video Demo](https://your-video-link.com)

---

**Made with ❤️ for the Sri Lankan community**

*දේශීය මුදල් කළමනාකරණ පද්ධතිය - ශ්‍රී ලාංකීය ප්‍රජාව සඳහා*

---

## 📱 React Native Mobile App (Expo)

We now ship a fully native-style mobile experience, built with Expo and React Native. The app mirrors the Sinhala finance dashboard with AsyncStorage persistence, Sinhala UX copy, and modal-driven flows for deposits, income transfers, expenses, and category management.

### 🧭 Location

```
mobile-app/
├── App.js
├── app.json
├── package.json
├── assets/
└── src/
    ├── components/
    │   ├── ActionButton.js
    │   ├── BalanceCard.js
    │   ├── CategoryCard.js
    │   ├── Header.js
    │   ├── TransactionItem.js
    │   └── modals/
    │       ├── CategoryDetailsModal.js
    │       ├── CategoryModal.js
    │       └── TransactionModal.js
    ├── styles.js
    └── utils/
        ├── formatters.js
        └── storage.js
```

### 🛠️ Setup & Run

1. Install dependencies:
   ```bash
   cd mobile-app
   npm install
   ```
2. Start the Expo dev server:
   ```bash
   npm start
   ```
3. Use the Expo Go client (Android/iOS) or run on an emulator/simulator via the on-screen prompts (`a` for Android, `i` for iOS).

### ✨ Mobile Highlights
- Sinhala-first UI with matching terminology to the web dashboard.
- Local persistence via `AsyncStorage` (`src/utils/storage.js`).
- Reusable UI primitives (`BalanceCard`, `CategoryCard`, `ActionButton`).
- Modal flows for transactions and category CRUD with Sinhala validation strings.
- Pull-to-refresh triggers storage re-hydration and combines gracefully with the modal UX.
- Expo asset placeholders live in `mobile-app/assets/`; replace them with brand assets before release.

### 🔍 Known Considerations
- Existing root-level `deepseek_*` files are legacy prototypes and **not** wired into the new mobile stack.
- Ensure you have the `expo` CLI installed globally if you prefer `expo start` commands outside of `npm scripts`.
