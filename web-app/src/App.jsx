import React, { useState, useEffect } from 'react';
import { 
  Wallet, CreditCard, Plus, Minus, TrendingUp, TrendingDown, 
  Calendar, DollarSign, Settings, BarChart3, Users, Shield,
  Eye, EyeOff, Search, Filter, Download, Upload, Bell
} from 'lucide-react';

const App = () => {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterType, setFilterType] = useState('all');
  
  // Enhanced database states
  const [accounts, setAccounts] = useState([
    { id: 1, name: 'Bank of Ceylon', type: 'bank', balance: 50000, currency: 'LKR', accountNumber: '1234567890' },
    { id: 2, name: 'Commercial Bank', type: 'bank', balance: 25000, currency: 'LKR', accountNumber: '0987654321' },
    { id: 3, name: 'Cash Wallet', type: 'cash', balance: 10000, currency: 'LKR' }
  ]);
  
  const [transactions, setTransactions] = useState([]);
  const [expenses, setExpenses] = useState([]);
  const [income, setIncome] = useState([]);
  const [budgets, setBudgets] = useState([]);
  const [notifications, setNotifications] = useState([]);
  
  // Form states
  const [formData, setFormData] = useState({
    amount: '',
    description: '',
    date: new Date().toISOString().split('T')[0],
    accountId: 1,
    category: '',
    notes: ''
  });

  const formatCurrency = (amount) => {
    return `රු. ${amount.toLocaleString()}.00`;
  };

  const getTotalBalance = () => {
    return accounts.reduce((total, account) => total + account.balance, 0);
  };

  const getAccountById = (id) => {
    return accounts.find(account => account.id === id);
  };

  const handleTransaction = () => {
    const { amount, description, date, accountId, category, notes } = formData;
    const transactionAmount = parseFloat(amount);
    
    if (!transactionAmount || transactionAmount <= 0) {
      alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const account = getAccountById(accountId);
    if (!account) return;

    const newTransaction = {
      id: Date.now(),
      type: modalType,
      amount: transactionAmount,
      description: description || 'Transaction',
      date: date,
      accountId: accountId,
      category: category,
      notes: notes,
      accountName: account.name
    };

    // Update account balance
    setAccounts(prev => prev.map(acc => 
      acc.id === accountId 
        ? { ...acc, balance: acc.balance + (modalType === 'income' ? transactionAmount : -transactionAmount) }
        : acc
    ));

    // Add to appropriate list
    if (modalType === 'income') {
      setIncome(prev => [newTransaction, ...prev]);
    } else if (modalType === 'expense') {
      setExpenses(prev => [newTransaction, ...prev]);
    }
    
    setTransactions(prev => [newTransaction, ...prev]);
    resetForm();
    setShowModal(false);
  };

  const resetForm = () => {
    setFormData({
      amount: '',
      description: '',
      date: new Date().toISOString().split('T')[0],
      accountId: 1,
      category: '',
      notes: ''
    });
  };

  const openModal = (type) => {
    setModalType(type);
    setShowModal(true);
    resetForm();
  };

  const exportData = () => {
    const data = {
      accounts,
      transactions,
      income,
      expenses,
      exportDate: new Date().toISOString()
    };
    
    const jsonData = JSON.stringify(data, null, 2);
    const blob = new Blob([jsonData], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    
    const a = document.createElement('a');
    a.href = url;
    a.download = 'account_data.json';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  const renderDashboard = () => (
    <div className="dashboard-container">
      {/* Header Stats */}
      <div className="stats-grid">
        <div className="stat-card total-balance">
          <div className="stat-icon">
            <DollarSign color="#fff" size={24} />
          </div>
          <div className="stat-content">
            <h3>මුළු ශේෂය</h3>
            <p className="stat-amount">{formatCurrency(getTotalBalance())}</p>
          </div>
        </div>
        
        <div className="stat-card accounts">
          <div className="stat-icon">
            <CreditCard color="#fff" size={24} />
          </div>
          <div className="stat-content">
            <h3>ගිණුම්</h3>
            <p className="stat-amount">{accounts.length}</p>
          </div>
        </div>
        
        <div className="stat-card monthly-income">
          <div className="stat-icon">
            <TrendingUp color="#fff" size={24} />
          </div>
          <div className="stat-content">
            <h3>මාසික ආදායම</h3>
            <p className="stat-amount">{formatCurrency(income.reduce((sum, item) => sum + item.amount, 0))}</p>
          </div>
        </div>
        
        <div className="stat-card monthly-expenses">
          <div className="stat-icon">
            <TrendingDown color="#fff" size={24} />
          </div>
          <div className="stat-content">
            <h3>මාසික වියදම්</h3>
            <p className="stat-amount">{formatCurrency(expenses.reduce((sum, item) => sum + item.amount, 0))}</p>
          </div>
        </div>
      </div>

      {/* Account Cards */}
      <div className="accounts-section">
        <div className="section-header">
          <h2>ගිණුම්</h2>
          <button className="add-account-btn" onClick={() => openModal('account')}>
            <Plus size={20} />
            ගිණුමක් එකතු කරන්න
          </button>
        </div>
        
        <div className="accounts-grid">
          {accounts.map(account => (
            <div key={account.id} className="account-card">
              <div className="account-header">
                <div className="account-icon">
                  {account.type === 'bank' ? 
                    <CreditCard color="#3B82F6" size={24} /> : 
                    <Wallet color="#10B981" size={24} />
                  }
                </div>
                <div className="account-info">
                  <h3>{account.name}</h3>
                  <p>{account.type === 'bank' ? account.accountNumber : 'Cash Account'}</p>
                </div>
              </div>
              <div className="account-balance">
                <p className="balance-amount">{formatCurrency(account.balance)}</p>
                <p className="balance-currency">{account.currency}</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Quick Actions */}
      <div className="quick-actions">
        <h2>ක්‍රියාවන්</h2>
        <div className="action-buttons">
          <button className="action-btn income-btn" onClick={() => openModal('income')}>
            <Plus size={20} />
            <span>ආදායම</span>
          </button>
          
          <button className="action-btn expense-btn" onClick={() => openModal('expense')}>
            <Minus size={20} />
            <span>වියදම</span>
          </button>
          
          <button className="action-btn transfer-btn" onClick={() => openModal('transfer')}>
            <TrendingUp size={20} />
            <span>මාරුව</span>
          </button>
        </div>
      </div>

      {/* Recent Transactions */}
      <div className="recent-transactions">
        <div className="section-header">
          <h2>මෑත ගනුදෙනු</h2>
          <button className="view-all-btn" onClick={() => setActiveTab('transactions')}>
            සියල්ල බලන්න
          </button>
        </div>
        
        <div className="transactions-list">
          {transactions.slice(0, 5).map(transaction => (
            <div key={transaction.id} className="transaction-item">
              <div className="transaction-icon">
                {transaction.type === 'income' ? 
                  <TrendingUp color="#10B981" size={20} /> : 
                  <TrendingDown color="#EF4444" size={20} />
                }
              </div>
              <div className="transaction-details">
                <p className="transaction-description">{transaction.description}</p>
                <p className="transaction-account">{transaction.accountName}</p>
                <p className="transaction-date">{transaction.date}</p>
              </div>
              <div className="transaction-amount">
                <p className={`amount ${transaction.type === 'income' ? 'positive' : 'negative'}`}>
                  {transaction.type === 'income' ? '+' : '-'}{formatCurrency(transaction.amount)}
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderAccounts = () => (
    <div className="accounts-page">
      <div className="page-header">
        <h1>ගිණුම් කළමනාකරණය</h1>
        <div className="header-actions">
          <div className="search-box">
            <Search size={20} />
            <input 
              type="text" 
              placeholder="ගිණුම් සොයන්න..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
          <button className="add-btn" onClick={() => openModal('account')}>
            <Plus size={20} />
          </button>
        </div>
      </div>
      
      <div className="accounts-list">
        {accounts.map(account => (
          <div key={account.id} className="account-list-item">
            <div className="account-details">
              <div className="account-icon">
                {account.type === 'bank' ? 
                  <CreditCard color="#3B82F6" size={24} /> : 
                  <Wallet color="#10B981" size={24} />
                }
              </div>
              <div className="account-info">
                <h3>{account.name}</h3>
                <p>{account.type === 'bank' ? `Account: ${account.accountNumber}` : 'Cash Account'}</p>
              </div>
            </div>
            <div className="account-balance">
              <p className="balance">{formatCurrency(account.balance)}</p>
              <p className="currency">{account.currency}</p>
            </div>
            <div className="account-actions">
              <button className="action-btn">Edit</button>
              <button className="action-btn">View</button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );

  const renderTransactions = () => (
    <div className="transactions-page">
      <div className="page-header">
        <h1>ගනුදෙනු</h1>
        <div className="header-actions">
          <div className="filter-dropdown">
            <Filter size={20} />
            <select value={filterType} onChange={(e) => setFilterType(e.target.value)}>
              <option value="all">සියල්ල</option>
              <option value="income">ආදායම්</option>
              <option value="expense">වියදම්</option>
            </select>
          </div>
          <button className="export-btn" onClick={exportData}>
            <Download size={20} />
          </button>
        </div>
      </div>
      
      <div className="transactions-list">
        {transactions.map(transaction => (
          <div key={transaction.id} className="transaction-list-item">
            <div className="transaction-icon">
              {transaction.type === 'income' ? 
                <TrendingUp color="#10B981" size={20} /> : 
                <TrendingDown color="#EF4444" size={20} />
              }
            </div>
            <div className="transaction-info">
              <h3>{transaction.description}</h3>
              <p>{transaction.accountName} • {transaction.date}</p>
              {transaction.category && <span className="category">{transaction.category}</span>}
            </div>
            <div className="transaction-amount">
              <p className={`amount ${transaction.type === 'income' ? 'positive' : 'negative'}`}>
                {transaction.type === 'income' ? '+' : '-'}{formatCurrency(transaction.amount)}
              </p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );

  const renderModal = () => {
    if (!showModal) return null;
    
    return (
      <div className="modal-overlay" onClick={() => setShowModal(false)}>
        <div className="modal-content" onClick={(e) => e.stopPropagation()}>
          <div className="modal-header">
            <h2>
              {modalType === 'income' && 'ආදායම එකතු කරන්න'}
              {modalType === 'expense' && 'වියදම එකතු කරන්න'}
              {modalType === 'transfer' && 'මාරුවක් කරන්න'}
              {modalType === 'account' && 'නව ගිණුමක් එකතු කරන්න'}
            </h2>
            <button className="close-btn" onClick={() => setShowModal(false)}>×</button>
          </div>
          
          <div className="modal-body">
            <div className="form-group">
              <label>මුදල</label>
              <div className="input-group">
                <span className="currency-symbol">රු.</span>
                <input
                  type="number"
                  value={formData.amount}
                  onChange={(e) => setFormData({...formData, amount: e.target.value})}
                  placeholder="0.00"
                />
              </div>
            </div>
            
            <div className="form-group">
              <label>විස්තරය</label>
              <input
                type="text"
                value={formData.description}
                onChange={(e) => setFormData({...formData, description: e.target.value})}
                placeholder="විස්තරය ඇතුළත් කරන්න"
              />
            </div>
            
            <div className="form-group">
              <label>ගිණුම</label>
              <select 
                value={formData.accountId}
                onChange={(e) => setFormData({...formData, accountId: parseInt(e.target.value)})}
              >
                {accounts.map(account => (
                  <option key={account.id} value={account.id}>
                    {account.name} - {formatCurrency(account.balance)}
                  </option>
                ))}
              </select>
            </div>
            
            <div className="form-group">
              <label>දිනය</label>
              <input
                type="date"
                value={formData.date}
                onChange={(e) => setFormData({...formData, date: e.target.value})}
              />
            </div>
            
            <div className="form-group">
              <label>වර්ගය</label>
              <input
                type="text"
                value={formData.category}
                onChange={(e) => setFormData({...formData, category: e.target.value})}
                placeholder="උදා: ආහාර, ප්‍රවාහන, රක්ෂණ"
              />
            </div>
            
            <div className="form-group">
              <label>සටහන්</label>
              <textarea
                value={formData.notes}
                onChange={(e) => setFormData({...formData, notes: e.target.value})}
                placeholder="අමතර සටහන්..."
                rows="3"
              />
            </div>
          </div>
          
          <div className="modal-footer">
            <button className="cancel-btn" onClick={() => setShowModal(false)}>
              අවලංගු කරන්න
            </button>
            <button className="confirm-btn" onClick={handleTransaction}>
              තහවුරු කරන්න
            </button>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="enhanced-app">
      {/* Top Navigation */}
      <nav className="top-nav">
        <div className="nav-brand">
          <Wallet size={24} />
          <h1>ගිණුම් කළමනාකරණය</h1>
        </div>
        <div className="nav-actions">
          <button className="notification-btn">
            <Bell size={20} />
            <span className="notification-badge">3</span>
          </button>
          <button className="settings-btn">
            <Settings size={20} />
          </button>
        </div>
      </nav>

      {/* Main Content */}
      <main className="main-content">
        {activeTab === 'dashboard' && renderDashboard()}
        {activeTab === 'accounts' && renderAccounts()}
        {activeTab === 'transactions' && renderTransactions()}
      </main>
      
      {/* Bottom Navigation */}
      <nav className="bottom-nav">
        <button 
          className={`nav-item ${activeTab === 'dashboard' ? 'active' : ''}`}
          onClick={() => setActiveTab('dashboard')}
        >
          <BarChart3 size={24} />
          <span>Dashboard</span>
        </button>
        
        <button 
          className={`nav-item ${activeTab === 'accounts' ? 'active' : ''}`}
          onClick={() => setActiveTab('accounts')}
        >
          <CreditCard size={24} />
          <span>ගිණුම්</span>
        </button>
        
        <button 
          className={`nav-item ${activeTab === 'transactions' ? 'active' : ''}`}
          onClick={() => setActiveTab('transactions')}
        >
          <TrendingUp size={24} />
          <span>ගනුදෙනු</span>
        </button>
      </nav>
      
      {renderModal()}
      
      <style jsx>{`
        .enhanced-app {
          min-height: 100vh;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          font-family: 'Inter', system-ui, -apple-system, sans-serif;
          color: #1f2937;
        }

        .top-nav {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1rem 1.5rem;
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-bottom: 1px solid rgba(255, 255, 255, 0.2);
          position: sticky;
          top: 0;
          z-index: 100;
        }

        .nav-brand {
          display: flex;
          align-items: center;
          gap: 0.75rem;
        }

        .nav-brand h1 {
          font-size: 1.5rem;
          font-weight: 700;
          color: #1f2937;
          margin: 0;
        }

        .nav-actions {
          display: flex;
          gap: 1rem;
        }

        .notification-btn, .settings-btn {
          position: relative;
          background: none;
          border: none;
          padding: 0.5rem;
          border-radius: 0.5rem;
          cursor: pointer;
          color: #6b7280;
          transition: all 0.2s;
        }

        .notification-btn:hover, .settings-btn:hover {
          background: rgba(59, 130, 246, 0.1);
          color: #3b82f6;
        }

        .notification-badge {
          position: absolute;
          top: 0;
          right: 0;
          background: #ef4444;
          color: white;
          font-size: 0.75rem;
          padding: 0.125rem 0.375rem;
          border-radius: 9999px;
          min-width: 1.25rem;
        }

        .main-content {
          padding: 1.5rem;
          padding-bottom: 5rem;
        }

        .dashboard-container {
          max-width: 1200px;
          margin: 0 auto;
        }

        .stats-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 1.5rem;
          margin-bottom: 2rem;
        }

        .stat-card {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 1rem;
          padding: 1.5rem;
          display: flex;
          align-items: center;
          gap: 1rem;
          box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
          transition: transform 0.2s;
        }

        .stat-card:hover {
          transform: translateY(-2px);
        }

        .stat-icon {
          width: 3rem;
          height: 3rem;
          border-radius: 0.75rem;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .total-balance .stat-icon {
          background: linear-gradient(135deg, #3b82f6, #1d4ed8);
        }

        .accounts .stat-icon {
          background: linear-gradient(135deg, #10b981, #059669);
        }

        .monthly-income .stat-icon {
          background: linear-gradient(135deg, #f59e0b, #d97706);
        }

        .monthly-expenses .stat-icon {
          background: linear-gradient(135deg, #ef4444, #dc2626);
        }

        .stat-content h3 {
          margin: 0 0 0.5rem 0;
          font-size: 0.875rem;
          font-weight: 600;
          color: #6b7280;
        }

        .stat-amount {
          margin: 0;
          font-size: 1.5rem;
          font-weight: 700;
          color: #1f2937;
        }

        .accounts-section {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 1rem;
          padding: 1.5rem;
          margin-bottom: 2rem;
          box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .section-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 1.5rem;
        }

        .section-header h2 {
          margin: 0;
          font-size: 1.25rem;
          font-weight: 700;
          color: #1f2937;
        }

        .add-account-btn {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          background: linear-gradient(135deg, #3b82f6, #1d4ed8);
          color: white;
          border: none;
          padding: 0.75rem 1rem;
          border-radius: 0.5rem;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s;
        }

        .add-account-btn:hover {
          transform: translateY(-1px);
          box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }

        .accounts-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
          gap: 1rem;
        }

        .account-card {
          background: white;
          border-radius: 0.75rem;
          padding: 1.5rem;
          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
          transition: all 0.2s;
        }

        .account-card:hover {
          transform: translateY(-2px);
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .account-header {
          display: flex;
          align-items: center;
          gap: 1rem;
          margin-bottom: 1rem;
        }

        .account-icon {
          width: 3rem;
          height: 3rem;
          background: #f3f4f6;
          border-radius: 0.5rem;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .account-info h3 {
          margin: 0 0 0.25rem 0;
          font-size: 1.125rem;
          font-weight: 600;
          color: #1f2937;
        }

        .account-info p {
          margin: 0;
          font-size: 0.875rem;
          color: #6b7280;
        }

        .account-balance {
          text-align: right;
        }

        .balance-amount {
          margin: 0 0 0.25rem 0;
          font-size: 1.5rem;
          font-weight: 700;
          color: #1f2937;
        }

        .balance-currency {
          margin: 0;
          font-size: 0.875rem;
          color: #6b7280;
        }

        .quick-actions {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 1rem;
          padding: 1.5rem;
          margin-bottom: 2rem;
          box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .quick-actions h2 {
          margin: 0 0 1rem 0;
          font-size: 1.25rem;
          font-weight: 700;
          color: #1f2937;
        }

        .action-buttons {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
          gap: 1rem;
        }

        .action-btn {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 0.5rem;
          padding: 1.5rem;
          border: none;
          border-radius: 0.75rem;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s;
          color: white;
        }

        .income-btn {
          background: linear-gradient(135deg, #10b981, #059669);
        }

        .expense-btn {
          background: linear-gradient(135deg, #ef4444, #dc2626);
        }

        .transfer-btn {
          background: linear-gradient(135deg, #f59e0b, #d97706);
        }

        .action-btn:hover {
          transform: translateY(-2px);
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .recent-transactions {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 1rem;
          padding: 1.5rem;
          box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .view-all-btn {
          background: none;
          border: 1px solid #d1d5db;
          color: #6b7280;
          padding: 0.5rem 1rem;
          border-radius: 0.5rem;
          cursor: pointer;
          transition: all 0.2s;
        }

        .view-all-btn:hover {
          background: #f9fafb;
          border-color: #9ca3af;
        }

        .transactions-list {
          display: flex;
          flex-direction: column;
          gap: 0.75rem;
        }

        .transaction-item {
          display: flex;
          align-items: center;
          gap: 1rem;
          padding: 1rem;
          background: white;
          border-radius: 0.75rem;
          box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
          transition: transform 0.2s;
        }

        .transaction-item:hover {
          transform: translateX(4px);
        }

        .transaction-icon {
          width: 2.5rem;
          height: 2.5rem;
          background: #f3f4f6;
          border-radius: 0.5rem;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .transaction-details {
          flex: 1;
        }

        .transaction-description {
          margin: 0 0 0.25rem 0;
          font-weight: 600;
          color: #1f2937;
        }

        .transaction-account {
          margin: 0 0 0.25rem 0;
          font-size: 0.875rem;
          color: #6b7280;
        }

        .transaction-date {
          margin: 0;
          font-size: 0.75rem;
          color: #9ca3af;
        }

        .transaction-amount .amount {
          margin: 0;
          font-weight: 700;
          font-size: 1.125rem;
        }

        .positive {
          color: #10b981;
        }

        .negative {
          color: #ef4444;
        }

        .bottom-nav {
          position: fixed;
          bottom: 0;
          left: 0;
          right: 0;
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-top: 1px solid rgba(255, 255, 255, 0.2);
          padding: 0.75rem;
          display: flex;
          justify-content: space-around;
          z-index: 50;
        }

        .nav-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 0.25rem;
          background: none;
          border: none;
          padding: 0.5rem;
          border-radius: 0.5rem;
          cursor: pointer;
          transition: all 0.2s;
          color: #6b7280;
        }

        .nav-item:hover {
          background: rgba(59, 130, 246, 0.1);
          color: #3b82f6;
        }

        .nav-item.active {
          background: rgba(59, 130, 246, 0.1);
          color: #3b82f6;
        }

        .nav-item span {
          font-size: 0.75rem;
          font-weight: 500;
        }

        .modal-overlay {
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: rgba(0, 0, 0, 0.6);
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 1rem;
          z-index: 100;
          backdrop-filter: blur(4px);
        }

        .modal-content {
          background: white;
          border-radius: 1rem;
          width: 100%;
          max-width: 500px;
          max-height: 90vh;
          overflow-y: auto;
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
          animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
          from {
            opacity: 0;
            transform: translateY(20px);
          }
          to {
            opacity: 1;
            transform: translateY(0);
          }
        }

        .modal-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1.5rem;
          border-bottom: 1px solid #e5e7eb;
        }

        .modal-header h2 {
          margin: 0;
          font-size: 1.25rem;
          font-weight: 700;
          color: #1f2937;
        }

        .close-btn {
          background: none;
          border: none;
          font-size: 1.5rem;
          cursor: pointer;
          color: #6b7280;
          padding: 0.25rem;
          border-radius: 0.25rem;
        }

        .close-btn:hover {
          background: #f3f4f6;
        }

        .modal-body {
          padding: 1.5rem;
        }

        .form-group {
          margin-bottom: 1rem;
        }

        .form-group label {
          display: block;
          font-size: 0.875rem;
          font-weight: 600;
          color: #374151;
          margin-bottom: 0.5rem;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
          width: 100%;
          border: 2px solid #e5e7eb;
          border-radius: 0.5rem;
          padding: 0.75rem;
          font-size: 1rem;
          background: #f9fafb;
          transition: all 0.2s;
          box-sizing: border-box;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
          outline: none;
          border-color: #3b82f6;
          background: white;
        }

        .input-group {
          display: flex;
          align-items: center;
          border: 2px solid #e5e7eb;
          border-radius: 0.5rem;
          background: #f9fafb;
          overflow: hidden;
        }

        .currency-symbol {
          padding: 0.75rem;
          background: #e5e7eb;
          color: #6b7280;
          font-weight: 600;
        }

        .input-group input {
          border: none;
          background: none;
          flex: 1;
        }

        .modal-footer {
          display: flex;
          gap: 1rem;
          padding: 1.5rem;
          border-top: 1px solid #e5e7eb;
        }

        .cancel-btn,
        .confirm-btn {
          flex: 1;
          padding: 0.75rem;
          border-radius: 0.5rem;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s;
        }

        .cancel-btn {
          background: white;
          border: 2px solid #d1d5db;
          color: #6b7280;
        }

        .cancel-btn:hover {
          background: #f9fafb;
          border-color: #9ca3af;
        }

        .confirm-btn {
          background: linear-gradient(135deg, #3b82f6, #1d4ed8);
          border: none;
          color: white;
        }

        .confirm-btn:hover {
          transform: translateY(-1px);
          box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }

        @media (max-width: 768px) {
          .main-content {
            padding: 1rem;
          }
          
          .stats-grid {
            grid-template-columns: 1fr;
          }
          
          .accounts-grid {
            grid-template-columns: 1fr;
          }
          
          .action-buttons {
            grid-template-columns: 1fr;
          }
        }
      `}</style>
    </div>
  );
};

export default App;