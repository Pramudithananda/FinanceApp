# ගිණුම් කළමනාකරණය - Account Management App

A modern, beautiful account management application with Sinhala interface and excellent UI/UX design.

## 🌟 Features

- **Modern Dashboard**: Beautiful glassmorphism design with gradient backgrounds
- **Multi-Account Management**: Manage multiple bank accounts and cash wallets
- **Transaction Tracking**: Track income, expenses, and transfers
- **Sinhala Interface**: Full Sinhala language support
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile
- **Real-time Updates**: Instant balance updates and transaction history
- **Data Export**: Export your financial data as JSON
- **Beautiful UI/UX**: Modern design with smooth animations

## 🚀 Quick Start

### Option 1: Direct Download
Download the built application:
- [Download Account App (ZIP)](account-app.zip)
- Extract and open `index.html` in your browser

### Option 2: Local Development
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

### Option 3: Deploy to Netlify
1. Go to [Netlify Drop](https://app.netlify.com/drop)
2. Drag and drop the `dist` folder
3. Get instant live URL

### Option 4: Deploy to Vercel
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel --prod
```

## 📱 App Features

### Dashboard
- Total balance overview
- Account cards with real-time balances
- Quick action buttons for income/expense/transfer
- Recent transactions list

### Account Management
- Add multiple bank accounts
- Cash wallet support
- Account number tracking
- Balance monitoring

### Transactions
- Income tracking
- Expense management
- Transfer between accounts
- Category classification
- Date tracking
- Notes and descriptions

## 🎨 UI/UX Highlights

- **Glassmorphism Design**: Modern glass-like effects
- **Gradient Backgrounds**: Beautiful color transitions
- **Smooth Animations**: Hover effects and transitions
- **Responsive Layout**: Mobile-first design
- **Accessibility**: Keyboard navigation and screen reader support
- **Dark/Light Mode Ready**: Easy theme switching capability

## 🛠️ Technology Stack

- **Frontend**: React 18 with Hooks
- **Styling**: CSS-in-JS with styled-jsx
- **Icons**: Lucide React
- **Build Tool**: Vite
- **Language**: Sinhala/English

## 📊 Data Structure

```javascript
// Account Structure
{
  id: 1,
  name: "Bank of Ceylon",
  type: "bank",
  balance: 50000,
  currency: "LKR",
  accountNumber: "1234567890"
}

// Transaction Structure
{
  id: Date.now(),
  type: "income|expense|transfer",
  amount: 1000,
  description: "Salary",
  date: "2024-01-15",
  accountId: 1,
  category: "Salary",
  notes: "Monthly salary"
}
```

## 🔧 Customization

### Adding New Features
1. Modify `App.jsx` for new components
2. Update state management in React hooks
3. Add new routes and navigation
4. Customize styling in the styled-jsx section

### Styling Changes
- Colors: Modify CSS custom properties
- Layout: Update grid and flexbox properties
- Animations: Adjust transition timings
- Typography: Change font families and sizes

## 📱 Mobile Optimization

The app is fully optimized for mobile devices:
- Touch-friendly buttons
- Swipe gestures support
- Responsive navigation
- Mobile-optimized forms
- Fast loading times

## 🔒 Security Features

- Client-side data validation
- Secure form handling
- XSS protection
- Input sanitization
- Safe data export

## 📈 Performance

- Lazy loading of components
- Optimized bundle size
- Efficient state management
- Minimal re-renders
- Fast initial load

## 🌐 Browser Support

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers

## 📞 Support

For support or feature requests:
- Create an issue on GitHub
- Contact the development team
- Check the documentation

## 📄 License

MIT License - Feel free to use and modify as needed.

---

**Built with ❤️ for the Sinhala community**

## 🎯 Quick Links

- [Live Demo](http://localhost:3000) (Local Development)
- [Download App](account-app.zip)
- [Source Code](src/App.jsx)
- [Deploy Instructions](README.md)

## 🚀 Deployment Status

✅ **Build Successful** - App is ready for deployment
✅ **Local Server Running** - Available at http://localhost:3000
✅ **Production Build** - Optimized for deployment
✅ **Mobile Ready** - Responsive design complete