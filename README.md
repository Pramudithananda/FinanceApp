# 💰 මුදල් කළමනාකරණ Mobile App v2.0

A complete React Native mobile application for personal finance management, featuring a beautiful Sinhala interface for managing bank accounts, cash, categories, and more.

> **සම්පූර්ණ සිංහල මොබයිල් යෙදුම - ඔබගේ මුදල් කළමනාකරණය සඳහා**

---

## 🎯 පිළිබඳව (About)

මෙය React Native භාවිතයෙන් නිර්මාණය කරන ලද සම්පූර්ණ මුදල් කළමනාකරණ mobile application එකකි. ඔබගේ බැංකු ගිණුම්, මුදල්, වියදම් ප්‍රවර්ග සහ තවත් බොහෝ දේ කළමනාකරණය කිරීමට අවශ්‍ය සියලු විශේෂාංග මෙහි ඇත.

**NEW in v2.0:**
- ✅ Full React Native mobile app (Android & iOS)
- ✅ Bottom tab navigation
- ✅ Complete CRUD for accounts
- ✅ Custom categories with icons & colors
- ✅ AsyncStorage data persistence
- ✅ Modern UI/UX with Material icons
- ✅ 100% Sinhala interface

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

## 📁 Project Structure

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

## 💻 Tech Stack

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

## 🔧 Customization

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
