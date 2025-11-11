# 📁 Project Structure | ව්‍යාපෘති ව්‍යුහය

## ප්‍රධාන Files

```
finance-app-mobile/
│
├── 📱 App.js                    # ප්‍රධාන app component
├── 📍 index.js                  # Entry point
├── ⚙️ app.json                  # App configuration
├── 📦 package.json              # Dependencies
│
├── 🎨 components/               # Reusable components
│   ├── AccountCard.js          # ගිණුම් card component
│   ├── BalanceCard.js          # ශේෂ card component
│   ├── StatCard.js             # Statistics card
│   └── AddButton.js            # Add button component
│
├── 🛠️ utils/                    # Utility functions
│   ├── formatters.js           # මුදල් සහ දිනය format කිරීම
│   ├── storage.js              # දත්ත සුරැකීම (AsyncStorage)
│   └── constants.js            # App constants & colors
│
├── 🤖 android/                  # Android native code
├── 🍎 ios/                      # iOS native code
│
├── 📖 README.md                 # Main documentation
├── 📖 MOBILE_APP_README.md      # Detailed mobile app docs
├── 🇱🇰 SETUP_GUIDE_SINHALA.md   # සිංහල setup guide
├── ⚡ QUICK_START.md            # Quick start guide
│
└── 📄 Configuration files
    ├── babel.config.js
    ├── metro.config.js
    ├── .gitignore
    ├── .prettierrc.js
    └── .eslintrc.js
```

---

## 📱 App.js - ප්‍රධාන Component

```javascript
App.js
├── State Management
│   ├── activeTab          # වර්තමාන tab
│   ├── accounts           # ගිණුම් array
│   └── cashBalance        # මුදල් ශේෂය
│
├── Data Persistence
│   ├── loadData()         # දත්ත load කිරීම
│   └── saveData()         # දත්ත save කිරීම
│
├── Views
│   ├── DashboardView      # Dashboard interface
│   └── PlaceholderView    # අනෙක් tabs
│
└── Navigation
    └── BottomNav          # පහළ navigation bar
```

---

## 🎨 Components විස්තරය

### AccountCard.js
```javascript
Props:
- account: {id, name, number, balance, type}
- onPress: Function
- colorScheme: 'primary' | 'secondary' | 'tertiary' | 'cash'

භාවිතය: ගිණුම් display කිරීමට
```

### BalanceCard.js
```javascript
Props:
- label: String (සිංහල label)
- amount: Number (මුදල)
- highlighted: Boolean

භාවිතය: ශේෂ සංඛ්‍යා display කිරීමට
```

### StatCard.js
```javascript
Props:
- label: String
- amount: Number
- color: String (background color)
- icon: String (emoji හෝ icon)

භාවිතය: සංඛ්‍යාලේඛන cards
```

### AddButton.js
```javascript
Props:
- onPress: Function
- size: Number (default: 40)
- iconSize: Number (default: 20)

භාවිතය: නව items එකතු කිරීමට
```

---

## 🛠️ Utils විස්තරය

### formatters.js
```javascript
Functions:
- formatCurrency(amount)      // රු 155,000
- formatDate(date)             // සම්පූර්ණ දිනය
- formatShortDate(date)        // කෙටි දිනය
- parseCurrency(string)        // String to Number
```

### storage.js
```javascript
Functions:
- saveAccounts(accounts)       // ගිණුම් save කිරීම
- loadAccounts()               // ගිණුම් load කිරීම
- saveCashBalance(balance)     // මුදල් save කිරීම
- loadCashBalance()            // මුදල් load කිරීම
- saveTransactions(txns)       // ගනුදෙනු save කිරීම
- loadTransactions()           // ගනුදෙනු load කිරීම
- clearAllData()               // සියලු දත්ත clear කිරීම
```

### constants.js
```javascript
Exports:
- COLORS                       // App වර්ණ
- ACCOUNT_TYPES               // ගිණුම් වර්ග
- TRANSACTION_TYPES           // ගනුදෙනු වර්ග
- SINHALA_LABELS              // සිංහල labels
```

---

## 🎨 Color Scheme | වර්ණ පද්ධතිය

```javascript
Primary Colors:
- Primary:    #4F46E5  (Indigo)   - ප්‍රධාන වර්ණය
- Secondary:  #10B981  (Green)    - දෙවන වර්ණය
- Tertiary:   #F97316  (Orange)   - තුන්වන වර්ණය
- Cash:       #9333EA  (Purple)   - මුදල් වර්ණය

Functional Colors:
- Bank:       #3B82F6  (Blue)     - බැංකු
- Error:      #EF4444  (Red)      - දෝෂ
- Success:    #10B981  (Green)    - සාර්ථක
- Warning:    #F59E0B  (Amber)    - අනතුරු ඇඟවීම

Gray Scale:
- Gray 50-900                     - පසුබිම් සහ text
```

---

## 💾 Data Structure | දත්ත ව්‍යුහය

### Account Object
```javascript
{
  id: Number,
  name: String,           // "People's Bank"
  number: String,         // "1234567890"
  balance: Number,        // 155000
  type: String           // 'bank' | 'cash'
}
```

### Transaction Object (Future)
```javascript
{
  id: Number,
  type: String,          // 'deposit' | 'withdrawal' | 'transfer'
  amount: Number,
  date: Date,
  description: String,
  accountId: Number,
  category: String
}
```

---

## 🔄 State Flow | State ගමන් මග

```
1. App Loads
   ↓
2. loadData() from AsyncStorage
   ↓
3. Set State (accounts, cashBalance)
   ↓
4. Render UI
   ↓
5. User Interaction
   ↓
6. Update State
   ↓
7. saveData() to AsyncStorage
   ↓
8. Re-render UI
```

---

## 📱 Navigation Structure

```
Bottom Navigation:
├── Dashboard Tab       # මුල් පිටුව
├── Bank Tab           # බැංකු ගිණුම්
├── Cash Tab           # මුදල් ගිණුම්
├── Categories Tab     # ප්‍රවර්ග
└── Settings Tab       # සැකසුම්
```

---

## 🚀 Performance Optimizations

1. **AsyncStorage** - ඉක්මන් දත්ත access
2. **useState** - Efficient state management
3. **Native Components** - හොඳ performance
4. **Optimized Renders** - අවම re-renders
5. **Vector Icons** - Scalable icons

---

## 🔐 Security Features

1. **Local Storage Only** - No cloud sync
2. **No External APIs** - දත්ත privacy
3. **Device Only** - දත්ත device එකේ පමණක්
4. **No Permissions Required** - අවම permissions

---

## 📈 Future Enhancements

සැලසුම් කර ඇති features:

1. **Categories System** - වියදම් categories
2. **Charts & Analytics** - දත්ත visualization
3. **Export Features** - PDF/Excel export
4. **Backup/Restore** - Cloud backup
5. **Biometric Auth** - Fingerprint/Face ID
6. **Dark Mode** - අඳුරු theme
7. **Multi-language** - වැඩි භාෂා සහාය
8. **Widgets** - Home screen widgets

---

## 🤝 Contributing Guidelines

Files වෙනස් කරන විට:

1. **Components** - නව features සඳහා නව component එකක්
2. **Utils** - common functions utils/ වල
3. **Styling** - inline styles වෙනුවට StyleSheet
4. **Comments** - සිංහල comments එකතු කරන්න
5. **Testing** - වෙනස්කම් test කරන්න

---

## 📞 Developer Notes

- React Native 0.72.0 භාවිතා කරයි
- AsyncStorage for persistence
- Vector Icons for UI icons
- StyleSheet for styling
- Functional components with Hooks

---

<div align="center">

**Project Structure හරියටම තේරුණාද? 🎯**

**වැඩි විස්තර සඳහා documentation බලන්න**

</div>
