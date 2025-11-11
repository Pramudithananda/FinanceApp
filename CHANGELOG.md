# 📝 Changelog | වෙනස්කම් ලොගය

All notable changes to this project will be documented in this file.

---

## [1.0.0] - 2025-11-11

### ✨ Added | එකතු කළ දේවල්

#### Core Features
- ✅ **Dashboard View** - සම්පූර්ණ dashboard interface
  - සම්පූර්ණ ශේෂය display
  - බැංකු ශේෂය summary
  - මුදල් ශේෂය summary
  - ගිණුම් cards display

- ✅ **Account Management** - ගිණුම් කළමනාකරණය
  - බැංකු ගිණුම් track කිරීම
  - මුදල් ගිණුම් track කිරීම
  - බහු ගිණුම් සහාය
  - ගිණුම් cards with colors

- ✅ **Data Persistence** - දත්ත ස්ථිරව සුරැකීම
  - AsyncStorage integration
  - Automatic data saving
  - Data restoration on app restart
  - Persistent account data

#### UI/UX
- ✅ **Modern Design** - නවීන පෙනුම
  - Card-based interface
  - Beautiful color scheme
  - Smooth animations
  - Responsive layout

- ✅ **Bottom Navigation** - පහළ navigation
  - 5 main tabs
  - Active state indication
  - Icon-based navigation
  - Smooth tab switching

- ✅ **Sinhala Support** - සිංහල සහාය
  - සම්පූර්ණ සිංහල interface
  - Currency formatting (රු)
  - Sinhala labels
  - Mixed language support

#### Components
- ✅ **AccountCard Component** - ගිණුම් card
  - Multiple color schemes
  - Balance display
  - Account details
  - Touch interaction

- ✅ **BalanceCard Component** - ශේෂ card
  - Label display
  - Amount formatting
  - Highlighted option
  - Clean design

- ✅ **StatCard Component** - සංඛ්‍යා card
  - Colored backgrounds
  - Icon support
  - Amount display
  - Compact design

- ✅ **AddButton Component** - Add button
  - Rounded design
  - Icon integration
  - Touch feedback
  - Reusable

#### Utilities
- ✅ **Formatters** - Format functions
  - `formatCurrency()` - මුදල් format
  - `formatDate()` - දිනය format
  - `formatShortDate()` - කෙටි දිනය
  - `parseCurrency()` - Parse currency

- ✅ **Storage Helpers** - දත්ත සුරැකීම
  - `saveAccounts()` - ගිණුම් save
  - `loadAccounts()` - ගිණුම් load
  - `saveCashBalance()` - මුදල් save
  - `loadCashBalance()` - මුදල් load
  - `clearAllData()` - Clear all

- ✅ **Constants** - නියත අගයන්
  - Color definitions
  - Account types
  - Transaction types
  - Sinhala labels

#### Documentation
- ✅ **Comprehensive README** - සම්පූර්ණ documentation
- ✅ **Sinhala Setup Guide** - සිංහල ස්ථාපන මාර්ගෝපදේශය
- ✅ **Quick Start Guide** - ඉක්මන් ආරම්භය
- ✅ **Project Structure Doc** - ව්‍යාපෘති ව්‍යුහය
- ✅ **Changelog** - වෙනස්කම් ලොගය

#### Configuration
- ✅ **Babel Config** - Babel සැකසීම
- ✅ **Metro Config** - Metro bundler
- ✅ **ESLint Config** - Code linting
- ✅ **Prettier Config** - Code formatting
- ✅ **Git Ignore** - Git exclusions

### 🛠️ Technical Details

#### Dependencies
```json
{
  "react": "18.2.0",
  "react-native": "0.72.0",
  "@react-native-async-storage/async-storage": "^1.19.0",
  "react-native-vector-icons": "^10.0.0"
}
```

#### Supported Platforms
- ✅ Android (API 21+)
- ✅ iOS (iOS 12+)

#### Performance
- ⚡ Fast startup (< 2s)
- ⚡ 60 FPS animations
- ⚡ Low memory usage
- ⚡ Optimized bundle size

---

## [Upcoming] - Future Releases

### 🔮 Planned Features | සැලසුම් කර ඇති features

#### Version 1.1.0
- [ ] **Transaction System** - ගනුදෙනු පද්ධතිය
  - Add deposits
  - Add withdrawals
  - Transaction history
  - Category support

- [ ] **Categories** - ප්‍රවර්ග පද්ධතිය
  - Expense categories
  - Custom categories
  - Category management
  - Budget per category

#### Version 1.2.0
- [ ] **Analytics** - විශ්ලේෂණය
  - Charts and graphs
  - Monthly reports
  - Yearly summary
  - Spending patterns

- [ ] **Export Features** - Export කිරීම
  - PDF export
  - Excel export
  - CSV export
  - Share reports

#### Version 1.3.0
- [ ] **Cloud Sync** - Cloud සම්බන්ධීකරණය
  - Firebase integration
  - Auto backup
  - Multi-device sync
  - Account sync

- [ ] **Security** - ආරක්ෂාව
  - Biometric authentication
  - PIN protection
  - Encrypted storage
  - Privacy mode

#### Version 2.0.0
- [ ] **Advanced Features** - උසස් විශේෂාංග
  - Budget planning
  - Goals and targets
  - Reminders
  - Widgets
  - Dark mode
  - Multiple currencies
  - Receipt scanning
  - Bill reminders

### 🐛 Known Issues | දන්නා ගැටළු

Currently no known issues. 🎉

---

## Version History Summary

| Version | Date | Description |
|---------|------|-------------|
| 1.0.0 | 2025-11-11 | Initial release with core features |

---

## How to Update | යාවත්කාලීන කරන්නේ කෙසේද

### From Git Repository

```bash
git pull origin main
npm install
npm run android  # or npm run ios
```

### Manual Update

1. Download latest release
2. Extract files
3. Run `npm install`
4. Run the app

---

## Breaking Changes | වෙනස්කම්

### Version 1.0.0
- Initial release - no breaking changes

---

## Migration Guide | Migration මාර්ගෝපදේශය

### To Version 1.0.0
- First release - no migration needed
- Fresh installation recommended

---

## Support | සහාය

For issues or feature requests:
- 🐛 [Report Issues](https://github.com/yourusername/finance-app/issues)
- 💡 [Request Features](https://github.com/yourusername/finance-app/issues/new)
- 💬 [Discussions](https://github.com/yourusername/finance-app/discussions)

---

<div align="center">

**Stay Updated! | යාවත්කාලීන වන්න!**

Star ⭐ the repository to get notified of new releases

</div>
