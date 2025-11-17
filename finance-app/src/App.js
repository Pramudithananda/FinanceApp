import React, { useState } from 'react';
import { 
  Home, 
  Building2, 
  Wallet, 
  FolderOpen, 
  Settings,
  Plus,
  Edit2,
  Trash2,
  BarChart3,
  Link,
  TrendingUp,
  TrendingDown,
  Building
} from 'lucide-react';

// Main App Component
export default function ExpenseTrackerApp() {
  const [currentScreen, setCurrentScreen] = useState('dashboard');
  const [accounts, setAccounts] = useState({
    bank: [
      { id: 1, name: "People's Bank", number: "1234567890", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" },
      { id: 2, name: "Commercial Bank", number: "0987654321", type: "ඉතුරුම්", balance: 0, category: "පුබාන මුදල්" }
    ],
    cash: [
      { id: 1, name: "පුබාන මුදල්", balance: 0 },
      { id: 2, name: "ඇත්නික්කා මුදල්", balance: 0 }
    ]
  });
  
  const [categories, setCategories] = useState([
    { id: 1, name: "පෙන් මලදී ගැනීම", budget: 10000, spent: 0 },
    { id: 2, name: "කෑම", budget: 0, spent: 0 }
  ]);

  const renderScreen = () => {
    switch(currentScreen) {
      case 'dashboard':
        return <DashboardScreen />;
      case 'bank':
        return <BankScreen accounts={accounts.bank} setAccounts={setAccounts} />;
      case 'cash':
        return <CashScreen accounts={accounts.cash} setAccounts={setAccounts} />;
      case 'categories':
        return <CategoriesScreen categories={categories} setCategories={setCategories} />;
      case 'settings':
        return <SettingsScreen />;
      default:
        return <DashboardScreen />;
    }
  };

  return (
    <div className="h-screen flex flex-col bg-gray-50">
      {/* Main Content */}
      <div className="flex-1 overflow-y-auto pb-20">
        {renderScreen()}
      </div>

      {/* Bottom Navigation */}
      <div className="fixed bottom-0 left-0 right-0 bg-indigo-600 shadow-lg">
        <div className="flex justify-around items-center py-3 px-2">
          <NavButton 
            icon={<Home size={24} />} 
            label="Dashboard" 
            active={currentScreen === 'dashboard'}
            onClick={() => setCurrentScreen('dashboard')}
          />
          <NavButton 
            icon={<Building2 size={24} />} 
            label="Bank" 
            active={currentScreen === 'bank'}
            onClick={() => setCurrentScreen('bank')}
          />
          <NavButton 
            icon={<Wallet size={24} />} 
            label="Cash" 
            active={currentScreen === 'cash'}
            onClick={() => setCurrentScreen('cash')}
          />
          <NavButton 
            icon={<FolderOpen size={24} />} 
            label="Categories" 
            active={currentScreen === 'categories'}
            onClick={() => setCurrentScreen('categories')}
          />
          <NavButton 
            icon={<Settings size={24} />} 
            label="Settings" 
            active={currentScreen === 'settings'}
            onClick={() => setCurrentScreen('settings')}
          />
        </div>
      </div>
    </div>
  );
}

// Navigation Button Component
function NavButton({ icon, label, active, onClick }) {
  return (
    <button 
      onClick={onClick}
      className="flex flex-col items-center justify-center min-w-0 flex-1"
    >
      <div className={`${active ? 'text-yellow-300' : 'text-white'}`}>
        {icon}
      </div>
      <span className={`text-xs mt-1 ${active ? 'text-yellow-300' : 'text-white'}`}>
        {label}
      </span>
    </button>
  );
}

// Dashboard Screen
function DashboardScreen() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-600 to-purple-700 p-4">
      {/* Header */}
      <div className="mb-6 pt-4">
        <div className="bg-white/10 backdrop-blur-sm rounded-xl p-4 mb-4">
          <h1 className="text-2xl font-bold text-white mb-2">❤️ නුපුරුදු හෝමනා...</h1>
          <p className="text-white/80 text-sm">Lalanthi Stengran: ආදරෙයි පී...</p>
          <div className="flex gap-2 mt-3">
            <button className="text-white/80 text-sm px-3 py-1 bg-white/10 rounded-lg">Like</button>
            <button className="text-white/80 text-sm px-3 py-1 bg-white/10 rounded-lg">Reply</button>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="flex gap-2 mb-4">
          <button className="flex-1 bg-indigo-500 text-white rounded-lg p-4 flex items-center justify-between">
            <span className="font-semibold text-sm">1234567890</span>
            <span className="flex items-center gap-2">
              <span>රු 0</span>
            </span>
          </button>
          <button className="flex-1 bg-green-500 text-white rounded-lg p-4 flex items-center justify-between">
            <span className="font-semibold text-sm">0987654321</span>
            <span className="flex items-center gap-2">
              <span>රු 0</span>
            </span>
          </button>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="mb-6">
        <h2 className="text-white text-lg font-semibold mb-3 flex items-center gap-2">
          මුදල් ගිනුම
        </h2>
        <div className="grid grid-cols-2 gap-3">
          <div className="bg-yellow-500 rounded-xl p-4 relative">
            <div className="absolute top-2 right-2 bg-white rounded-full w-6 h-6 flex items-center justify-center">
              <span className="text-xs">✓</span>
            </div>
            <h3 className="text-white font-semibold mb-2">පුබාන මුදල්</h3>
            <p className="text-white text-2xl font-bold">රු 0</p>
          </div>
          <div className="bg-red-500 rounded-xl p-4">
            <h3 className="text-white font-semibold mb-2">ඇත්නික්කා මුදල්</h3>
            <p className="text-white text-2xl font-bold">රු 0</p>
          </div>
        </div>
      </div>

      {/* Main Actions */}
      <div className="space-y-3">
        <button className="w-full bg-indigo-600 text-white rounded-xl py-4 px-6 flex items-center justify-center gap-2 font-semibold shadow-lg">
          <Building className="w-5 h-5" />
          බැංකු නාන්පතු
        </button>
        <button className="w-full bg-green-600 text-white rounded-xl py-4 px-6 flex items-center justify-center gap-2 font-semibold shadow-lg">
          <Wallet className="w-5 h-5" />
          බැංකු Withdraw
        </button>
        <button className="w-full bg-red-600 text-white rounded-xl py-4 px-6 flex items-center justify-center gap-2 font-semibold shadow-lg">
          <TrendingDown className="w-5 h-5" />
          විදමී කරන්න
        </button>
        <button className="w-full bg-gray-600 text-white rounded-xl py-4 px-6 flex items-center justify-center gap-2 font-semibold shadow-lg">
          <Plus className="w-5 h-5" />
          නව ගිනුමි එකතු කරන්න
        </button>
      </div>
    </div>
  );
}

// Bank Screen
function BankScreen({ accounts, setAccounts }) {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-indigo-600 text-white p-6">
        <h1 className="text-2xl font-bold text-center">Bank</h1>
      </div>

      <div className="p-4">
        {/* Summary Card */}
        <div className="bg-white rounded-xl shadow-sm p-6 mb-4">
          <h2 className="text-center text-gray-600 mb-2">සම්පූර්ණ බැංකු ශේෂය</h2>
          <p className="text-center text-4xl font-bold text-indigo-600 mb-1">රු 0</p>
          <p className="text-center text-gray-500 text-sm">2 ගිනුම් වලින්</p>
        </div>

        {/* Add Button */}
        <button className="w-full bg-indigo-600 text-white rounded-xl py-4 px-6 mb-4 flex items-center justify-center gap-2 font-semibold shadow-sm">
          <Plus className="w-5 h-5" />
          නව බැංකු ගිනුමි එකතු කරන්න
        </button>

        {/* Bank Accounts List */}
        <div className="space-y-3">
          {accounts.map((account) => (
            <div key={account.id} className="bg-white rounded-xl shadow-sm p-4 border-l-4 border-indigo-500">
              <div className="flex justify-between items-start mb-3">
                <h3 className="font-bold text-lg">{account.name}</h3>
                <div className="flex gap-2">
                  <button className="text-indigo-600 hover:text-indigo-800">
                    <BarChart3 size={20} />
                  </button>
                  <button className="text-gray-600 hover:text-gray-800">
                    <Link size={20} />
                  </button>
                  <button className="text-red-500 hover:text-red-700">
                    <Trash2 size={20} />
                  </button>
                  <button className="text-yellow-600 hover:text-yellow-800">
                    <Edit2 size={20} />
                  </button>
                </div>
              </div>
              <p className="text-gray-600 text-sm mb-1">ගිනුම් අංකය: {account.number}</p>
              <p className="text-gray-600 text-sm mb-1">වර්ගය: {account.type}</p>
              <p className="text-indigo-600 text-sm mb-2 flex items-center gap-1">
                <Link size={14} />
                වර්ගීම: {account.category}
              </p>
              <p className="text-gray-800 font-bold text-xl">ශේෂය: <span className="text-indigo-600">රු {account.balance}</span></p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

// Cash Screen
function CashScreen({ accounts, setAccounts }) {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-indigo-600 text-white p-6">
        <h1 className="text-2xl font-bold text-center">Cash</h1>
      </div>

      <div className="p-4">
        {/* Summary Card */}
        <div className="bg-white rounded-xl shadow-sm p-6 mb-4">
          <h2 className="text-center text-gray-600 mb-2">සම්පූර්ණ මුදල් ශේෂය</h2>
          <p className="text-center text-4xl font-bold text-green-600 mb-1">රු 0</p>
          <p className="text-center text-gray-500 text-sm">2 ගිනුම් වලින්</p>
        </div>

        {/* Add Button */}
        <button className="w-full bg-green-600 text-white rounded-xl py-4 px-6 mb-4 flex items-center justify-center gap-2 font-semibold shadow-sm">
          <Plus className="w-5 h-5" />
          නව මුදල් ගිනුමි එකතු කරන්න
        </button>

        {/* Cash Accounts List */}
        <div className="space-y-3">
          {accounts.map((account, index) => (
            <div 
              key={account.id} 
              className={`bg-white rounded-xl shadow-sm p-4 border-l-4 ${
                index === 0 ? 'border-yellow-500' : 'border-red-500'
              }`}
            >
              <div className="flex justify-between items-start mb-3">
                <h3 className="font-bold text-lg">{account.name}</h3>
                <div className="flex gap-2">
                  <button className="text-red-500 hover:text-red-700">
                    <Trash2 size={20} />
                  </button>
                  <button className="text-yellow-600 hover:text-yellow-800">
                    <Edit2 size={20} />
                  </button>
                </div>
              </div>
              <p className="text-gray-800 font-bold text-xl">
                ශේෂය: <span className={index === 0 ? 'text-yellow-600' : 'text-red-600'}>රු {account.balance}</span>
              </p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

// Categories Screen
function CategoriesScreen({ categories, setCategories }) {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-indigo-600 text-white p-6">
        <h1 className="text-2xl font-bold text-center">Expenses Categories</h1>
        <p className="text-center text-sm mt-1 text-white/80">Manage categories used in expenses</p>
      </div>

      <div className="p-4">
        {/* Add New Category Form */}
        <div className="bg-white rounded-xl shadow-sm p-4 mb-6">
          <h2 className="font-bold mb-4">නව කාන්ඩිකයක් එක් කරන්න</h2>
          <div className="space-y-3">
            <div>
              <label className="block text-sm text-gray-600 mb-1">නාමය</label>
              <input 
                type="text" 
                placeholder="උදා: කෑම"
                className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <div>
              <label className="block text-sm text-gray-600 mb-1">ඉලක්කය (රු)</label>
              <input 
                type="number" 
                defaultValue="0"
                className="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
            </div>
            <button className="w-full bg-indigo-600 text-white rounded-lg py-3 font-semibold hover:bg-indigo-700">
              එක් කරන්න
            </button>
          </div>
        </div>

        {/* Existing Categories */}
        <div className="mb-4">
          <h2 className="font-bold text-lg mb-3">කාන්ඩික ලැයිස්තුව</h2>
          <div className="space-y-3">
            {categories.map((category) => (
              <div key={category.id} className="bg-white rounded-xl shadow-sm p-4">
                <div className="flex justify-between items-start mb-2">
                  <h3 className="font-semibold text-gray-800">{category.name}</h3>
                  <div className="flex gap-2">
                    <button className="text-yellow-600 hover:text-yellow-800">
                      <Edit2 size={18} />
                    </button>
                    <button className="text-red-500 hover:text-red-700">
                      <Trash2 size={18} />
                    </button>
                  </div>
                </div>
                <p className="text-sm text-gray-600">
                  Target: රු {category.budget.toLocaleString()} • Spent: රු {category.spent}
                </p>
                {category.budget > 0 && (
                  <div className="mt-2">
                    <div className="w-full bg-gray-200 rounded-full h-2">
                      <div 
                        className="bg-indigo-600 h-2 rounded-full" 
                        style={{ width: `${(category.spent / category.budget) * 100}%` }}
                      />
                    </div>
                  </div>
                )}
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

// Settings Screen
function SettingsScreen() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-indigo-600 text-white p-6">
        <h1 className="text-2xl font-bold text-center">Settings</h1>
        <p className="text-center text-sm mt-1 text-white/80">App settings and information</p>
      </div>

      <div className="p-4">
        {/* App Information */}
        <div className="mb-6">
          <h2 className="font-bold text-lg mb-3">ඇප් තොරතුරු</h2>
          <div className="bg-white rounded-xl shadow-sm p-4 space-y-3">
            <div className="flex justify-between">
              <span className="text-gray-600">ඇප් නම:</span>
              <span className="font-semibold">මුදල් කළමනාකරණ</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-600">වෙළුම:</span>
              <span className="font-semibold">v3.0 - Enhanced</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-600">නිර්මාණය:</span>
              <span className="font-semibold">2024</span>
            </div>
            <div className="flex justify-between">
              <span className="text-gray-600">භාෂාව:</span>
              <span className="font-semibold">සිංහල</span>
            </div>
          </div>
        </div>

        {/* Data Management */}
        <div className="mb-6">
          <h2 className="font-bold text-lg mb-3">දත්ත කළමනාකරණය</h2>
          <div className="space-y-3">
            <button className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-3 hover:bg-gray-50">
              <span className="text-2xl">🗂️</span>
              <div className="flex-1 text-left">
                <h3 className="font-semibold">දත්ත අපනයනය කරන්න</h3>
                <p className="text-sm text-gray-600">JSON ආකාරයෙන් ඔබගේ දත්ත බාගත කරන්න</p>
              </div>
            </button>
            
            <button className="w-full bg-white rounded-xl shadow-sm p-4 flex items-center gap-3 hover:bg-gray-50">
              <span className="text-2xl">📊</span>
              <div className="flex-1 text-left">
                <h3 className="font-semibold">මැසික වාර්තාව (HTML)</h3>
                <p className="text-sm text-gray-600">උපාබ පවතින මාසයේ HTML වාර්තාව</p>
              </div>
            </button>
            
            <button className="w-full bg-red-50 rounded-xl shadow-sm p-4 flex items-center gap-3 hover:bg-red-100 border border-red-200">
              <span className="text-2xl">🗑️</span>
              <div className="flex-1 text-left">
                <h3 className="font-semibold text-red-600">සියලුම දත්ත මකන්න</h3>
                <p className="text-sm text-red-500">ප්‍රවේශමෙන්! මෙය ආපසු හරවන්න බැහැ</p>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
