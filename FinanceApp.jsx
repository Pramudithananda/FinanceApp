import React, { useState, useEffect } from 'react';
import { Wallet, CreditCard, Plus, Minus, TrendingUp, TrendingDown, Calendar, DollarSign } from 'lucide-react';

const FinanceApp = () => {
  const [activeTab, setActiveTab] = useState('home');
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  
  // Database states
  const [bankBalance, setBankBalance] = useState(50000);
  const [cashBalance, setCashBalance] = useState(10000);
  const [transactions, setTransactions] = useState([]);
  const [expenses, setExpenses] = useState([]);
  const [income, setIncome] = useState([]);
  
  // Form states
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [date, setDate] = useState(new Date().toISOString().split('T')[0]);
  const [transactionType, setTransactionType] = useState('bank'); // bank or cash

  const formatCurrency = (amount) => {
    return `රු. ${amount.toLocaleString()}.00`;
  };

  const handleDeposit = () => {
    const depositAmount = parseFloat(amount);
    if (!depositAmount || depositAmount <= 0) {
      alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const newTransaction = {
      id: Date.now(),
      type: 'deposit',
      amount: depositAmount,
      description: description || 'Bank Deposit',
      date: date,
      accountType: transactionType
    };

    if (transactionType === 'bank') {
      setBankBalance(prev => prev + depositAmount);
    } else {
      // Cash to bank deposit - cash reduces, bank increases
      if (cashBalance >= depositAmount) {
        setCashBalance(prev => prev - depositAmount);
        setBankBalance(prev => prev + depositAmount);
      } else {
        alert('ප්‍රමාණවත් මුදල් නැත');
        return;
      }
    }

    setTransactions(prev => [newTransaction, ...prev]);
    resetForm();
    setShowModal(false);
  };

  const handleWithdrawal = () => {
    const withdrawAmount = parseFloat(amount);
    if (!withdrawAmount || withdrawAmount <= 0) {
      alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    if (bankBalance < withdrawAmount) {
      alert('ප්‍රමාණවත් බැංකු ශේෂයක් නැත');
      return;
    }

    const newTransaction = {
      id: Date.now(),
      type: 'withdrawal',
      amount: withdrawAmount,
      description: description || 'Bank Withdrawal',
      date: date,
      accountType: 'bank'
    };

    setBankBalance(prev => prev - withdrawAmount);
    setCashBalance(prev => prev + withdrawAmount);
    setTransactions(prev => [newTransaction, ...prev]);
    resetForm();
    setShowModal(false);
  };

  const handleExpense = () => {
    const expenseAmount = parseFloat(amount);
    if (!expenseAmount || expenseAmount <= 0) {
      alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    if (cashBalance < expenseAmount) {
      alert('ප්‍රමාණවත් මුදල් නැත');
      return;
    }

    const newExpense = {
      id: Date.now(),
      amount: expenseAmount,
      description: description || 'වියදම',
      date: date
    };

    setCashBalance(prev => prev - expenseAmount);
    setExpenses(prev => [newExpense, ...prev]);
    resetForm();
    setShowModal(false);
  };

  const handleIncome = () => {
    const incomeAmount = parseFloat(amount);
    if (!incomeAmount || incomeAmount <= 0) {
      alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }

    const newIncome = {
      id: Date.now(),
      amount: incomeAmount,
      description: description || 'ආදායම',
      date: date,
      accountType: transactionType
    };

    if (transactionType === 'bank') {
      setBankBalance(prev => prev + incomeAmount);
    } else {
      setCashBalance(prev => prev + incomeAmount);
    }

    setIncome(prev => [newIncome, ...prev]);
    resetForm();
    setShowModal(false);
  };

  const resetForm = () => {
    setAmount('');
    setDescription('');
    setDate(new Date().toISOString().split('T')[0]);
    setTransactionType('bank');
  };

  const openModal = (type) => {
    setModalType(type);
    setShowModal(true);
    resetForm();
  };

  const renderHomeTab = () => (
    <div className="container">
      {/* Balance Cards */}
      <div className="balance-container">
        <div className="balance-card bank-card">
          <div className="balance-header">
            <CreditCard color="#fff" size={24} />
            <h3 className="balance-title">බැංකු ශේෂය</h3>
          </div>
          <p className="balance-amount">{formatCurrency(bankBalance)}</p>
        </div>
        
        <div className="balance-card cash-card">
          <div className="balance-header">
            <Wallet color="#fff" size={24} />
            <h3 className="balance-title">මාර්ගස්ථ මුදල්</h3>
          </div>
          <p className="balance-amount">{formatCurrency(cashBalance)}</p>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="actions-container">
        <h2 className="section-title">ක්‍රියාවන්</h2>
        <div className="action-buttons">
          <button 
            className="action-button deposit-button" 
            onClick={() => openModal('deposit')}
          >
            <Plus color="#fff" size={20} />
            <span>Deposit</span>
          </button>
          
          <button 
            className="action-button withdraw-button" 
            onClick={() => openModal('withdrawal')}
          >
            <Minus color="#fff" size={20} />
            <span>Withdraw</span>
          </button>
        </div>
      </div>

      {/* Recent Transactions */}
      <div className="recent-container">
        <h2 className="section-title">මෑත ගනුදෙනු</h2>
        <div className="transactions-list">
          {transactions.slice(0, 5).map(transaction => (
            <div key={transaction.id} className="transaction-item">
              <div className="transaction-icon">
                {transaction.type === 'deposit' ? 
                  <TrendingUp color="#10B981" size={20} /> : 
                  <TrendingDown color="#EF4444" size={20} />
                }
              </div>
              <div className="transaction-details">
                <p className="transaction-description">{transaction.description}</p>
                <p className="transaction-date">{transaction.date}</p>
              </div>
              <p className={`transaction-amount ${transaction.type === 'deposit' ? 'positive' : 'negative'}`}>
                {transaction.type === 'deposit' ? '+' : '-'}{formatCurrency(transaction.amount)}
              </p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderExpensesTab = () => (
    <div className="container">
      <div className="tab-header">
        <h1 className="tab-title">වියදම්</h1>
        <button 
          className="add-button" 
          onClick={() => openModal('expense')}
        >
          <Plus color="#fff" size={20} />
        </button>
      </div>
      
      <div className="list-container">
        {expenses.map(item => (
          <div key={item.id} className="list-item">
            <div className="list-item-icon">
              <Minus color="#EF4444" size={20} />
            </div>
            <div className="list-item-details">
              <p className="list-item-description">{item.description}</p>
              <p className="list-item-date">{item.date}</p>
            </div>
            <p className="list-item-amount negative">
              -{formatCurrency(item.amount)}
            </p>
          </div>
        ))}
      </div>
    </div>
  );

  const renderIncomeTab = () => (
    <div className="container">
      <div className="tab-header">
        <h1 className="tab-title">ආදායම්</h1>
        <button 
          className="add-button" 
          onClick={() => openModal('income')}
        >
          <Plus color="#fff" size={20} />
        </button>
      </div>
      
      <div className="list-container">
        {income.map(item => (
          <div key={item.id} className="list-item">
            <div className="list-item-icon">
              <Plus color="#10B981" size={20} />
            </div>
            <div className="list-item-details">
              <p className="list-item-description">{item.description}</p>
              <p className="list-item-date">{item.date} • {item.accountType === 'bank' ? 'බැංකුව' : 'මාර්ගස්ථ'}</p>
            </div>
            <p className="list-item-amount positive">
              +{formatCurrency(item.amount)}
            </p>
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
          <h2 className="modal-title">
            {modalType === 'deposit' && 'Deposit කරන්න'}
            {modalType === 'withdrawal' && 'Withdraw කරන්න'}
            {modalType === 'expense' && 'වියදම එකතු කරන්න'}
            {modalType === 'income' && 'ආදායම එකතු කරන්න'}
          </h2>
          
          <div className="form-group">
            <label className="label">මුදල</label>
            <input
              type="number"
              className="input"
              value={amount}
              onChange={(e) => setAmount(e.target.value)}
              placeholder="0.00"
            />
          </div>
          
          <div className="form-group">
            <label className="label">විස්තරය</label>
            <input
              type="text"
              className="input"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="විස්තරය ඇතුළත් කරන්න"
            />
          </div>
          
          <div className="form-group">
            <label className="label">දිනය</label>
            <input
              type="date"
              className="input"
              value={date}
              onChange={(e) => setDate(e.target.value)}
            />
          </div>
          
          {(modalType === 'deposit' || modalType === 'income') && (
            <div className="form-group">
              <label className="label">ගිණුම් වර්ගය</label>
              <div className="toggle-container">
                <button
                  className={`toggle-button ${transactionType === 'bank' ? 'toggle-active' : ''}`}
                  onClick={() => setTransactionType('bank')}
                >
                  බැංකුව
                </button>
                <button
                  className={`toggle-button ${transactionType === 'cash' ? 'toggle-active' : ''}`}
                  onClick={() => setTransactionType('cash')}
                >
                  මාර්ගස්ථ
                </button>
              </div>
            </div>
          )}
          
          <div className="modal-buttons">
            <button 
              className="cancel-button" 
              onClick={() => setShowModal(false)}
            >
              අවලංගු කරන්න
            </button>
            
            <button 
              className="confirm-button" 
              onClick={() => {
                if (modalType === 'deposit') handleDeposit();
                else if (modalType === 'withdrawal') handleWithdrawal();
                else if (modalType === 'expense') handleExpense();
                else if (modalType === 'income') handleIncome();
              }}
            >
              තහවුරු කරන්න
            </button>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="app">
      {/* Tab Content */}
      <main className="main-content">
        {activeTab === 'home' && renderHomeTab()}
        {activeTab === 'expenses' && renderExpensesTab()}
        {activeTab === 'income' && renderIncomeTab()}
      </main>
      
      {/* Bottom Navigation */}
      <nav className="bottom-nav">
        <button 
          className={`nav-item ${activeTab === 'home' ? 'nav-item-active' : ''}`}
          onClick={() => setActiveTab('home')}
        >
          <Wallet color={activeTab === 'home' ? '#3B82F6' : '#9CA3AF'} size={24} />
          <span className={`nav-text ${activeTab === 'home' ? 'nav-text-active' : ''}`}>
            මුල් පිටුව
          </span>
        </button>
        
        <button 
          className={`nav-item ${activeTab === 'expenses' ? 'nav-item-active' : ''}`}
          onClick={() => setActiveTab('expenses')}
        >
          <TrendingDown color={activeTab === 'expenses' ? '#3B82F6' : '#9CA3AF'} size={24} />
          <span className={`nav-text ${activeTab === 'expenses' ? 'nav-text-active' : ''}`}>
            වියදම්
          </span>
        </button>
        
        <button 
          className={`nav-item ${activeTab === 'income' ? 'nav-item-active' : ''}`}
          onClick={() => setActiveTab('income')}
        >
          <TrendingUp color={activeTab === 'income' ? '#3B82F6' : '#9CA3AF'} size={24} />
          <span className={`nav-text ${activeTab === 'income' ? 'nav-text-active' : ''}`}>
            ආදායම්
          </span>
        </button>
      </nav>
      
      {renderModal()}
      
      <style jsx>{`
        .app {
          display: flex;
          flex-direction: column;
          min-height: 100vh;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          font-family: 'Inter', system-ui, -apple-system, sans-serif;
        }

        .main-content {
          flex: 1;
          overflow-y: auto;
          padding-bottom: 80px;
        }

        .container {
          padding: 20px;
          max-width: 800px;
          margin: 0 auto;
        }

        .balance-container {
          display: grid;
          grid-template-columns: 1fr;
          gap: 16px;
          margin-bottom: 32px;
        }

        @media (min-width: 640px) {
          .balance-container {
            grid-template-columns: 1fr 1fr;
          }
        }

        .balance-card {
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(10px);
          border: 1px solid rgba(255, 255, 255, 0.2);
          padding: 24px;
          border-radius: 16px;
          color: white;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
          transition: transform 0.2s ease;
        }

        .balance-card:hover {
          transform: translateY(-4px);
        }

        .bank-card {
          background: linear-gradient(135deg, #3B82F6, #1E40AF);
        }

        .cash-card {
          background: linear-gradient(135deg, #10B981, #047857);
        }

        .balance-header {
          display: flex;
          align-items: center;
          margin-bottom: 12px;
        }

        .balance-title {
          margin: 0 0 0 12px;
          font-size: 16px;
          font-weight: 600;
        }

        .balance-amount {
          margin: 0;
          font-size: 32px;
          font-weight: bold;
          background: linear-gradient(45deg, #fff, #f0f0f0);
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          background-clip: text;
        }

        .actions-container {
          margin-bottom: 32px;
        }

        .section-title {
          font-size: 24px;
          font-weight: bold;
          color: white;
          margin-bottom: 20px;
          text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .action-buttons {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 16px;
        }

        .action-button {
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 12px;
          padding: 16px;
          border: none;
          border-radius: 12px;
          font-size: 16px;
          font-weight: 600;
          color: white;
          cursor: pointer;
          transition: all 0.2s ease;
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .action-button:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .deposit-button {
          background: linear-gradient(135deg, #10B981, #059669);
        }

        .withdraw-button {
          background: linear-gradient(135deg, #EF4444, #DC2626);
        }

        .recent-container {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 16px;
          padding: 24px;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .recent-container .section-title {
          color: #1F2937;
          text-shadow: none;
        }

        .transactions-list {
          display: flex;
          flex-direction: column;
          gap: 12px;
        }

        .transaction-item {
          display: flex;
          align-items: center;
          background: white;
          padding: 16px;
          border-radius: 12px;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
          transition: transform 0.2s ease;
        }

        .transaction-item:hover {
          transform: translateX(4px);
        }

        .transaction-icon {
          margin-right: 16px;
          padding: 8px;
          border-radius: 8px;
          background: #F9FAFB;
        }

        .transaction-details {
          flex: 1;
        }

        .transaction-description {
          margin: 0 0 4px 0;
          font-size: 16px;
          font-weight: 600;
          color: #1F2937;
        }

        .transaction-date {
          margin: 0;
          font-size: 14px;
          color: #6B7280;
        }

        .transaction-amount {
          margin: 0;
          font-size: 16px;
          font-weight: bold;
        }

        .positive {
          color: #10B981;
        }

        .negative {
          color: #EF4444;
        }

        .tab-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 24px;
        }

        .tab-title {
          font-size: 32px;
          font-weight: bold;
          color: white;
          margin: 0;
          text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .add-button {
          background: linear-gradient(135deg, #3B82F6, #1D4ED8);
          border: none;
          padding: 12px;
          border-radius: 12px;
          cursor: pointer;
          box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
          transition: all 0.2s ease;
        }

        .add-button:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
        }

        .list-container {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 16px;
          padding: 20px;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .list-item {
          display: flex;
          align-items: center;
          background: white;
          padding: 16px;
          border-radius: 12px;
          margin-bottom: 12px;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
          transition: transform 0.2s ease;
        }

        .list-item:hover {
          transform: translateX(4px);
        }

        .list-item-icon {
          margin-right: 16px;
          padding: 8px;
          border-radius: 8px;
          background: #F9FAFB;
        }

        .list-item-details {
          flex: 1;
        }

        .list-item-description {
          margin: 0 0 4px 0;
          font-size: 16px;
          font-weight: 600;
          color: #1F2937;
        }

        .list-item-date {
          margin: 0;
          font-size: 14px;
          color: #6B7280;
        }

        .list-item-amount {
          margin: 0;
          font-size: 16px;
          font-weight: bold;
        }

        .bottom-nav {
          display: flex;
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-top: 1px solid rgba(255, 255, 255, 0.2);
          padding: 12px 16px;
          position: fixed;
          bottom: 0;
          left: 0;
          right: 0;
          z-index: 50;
        }

        .nav-item {
          flex: 1;
          display: flex;
          flex-direction: column;
          align-items: center;
          padding: 8px;
          background: none;
          border: none;
          cursor: pointer;
          transition: all 0.2s ease;
          border-radius: 8px;
        }

        .nav-item:hover {
          background: rgba(59, 130, 246, 0.1);
        }

        .nav-item-active {
          background: rgba(59, 130, 246, 0.1);
        }

        .nav-text {
          font-size: 12px;
          color: #9CA3AF;
          margin-top: 4px;
        }

        .nav-text-active {
          color: #3B82F6;
          font-weight: 600;
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
          padding: 16px;
          z-index: 100;
          backdrop-filter: blur(4px);
        }

        .modal-content {
          background: white;
          border-radius: 16px;
          padding: 24px;
          width: 100%;
          max-width: 400px;
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

        .modal-title {
          font-size: 20px;
          font-weight: bold;
          color: #1F2937;
          margin: 0 0 24px 0;
          text-align: center;
        }

        .form-group {
          margin-bottom: 16px;
        }

        .label {
          display: block;
          font-size: 14px;
          font-weight: 600;
          color: #374151;
          margin-bottom: 8px;
        }

        .input {
          width: 100%;
          border: 2px solid #E5E7EB;
          border-radius: 8px;
          padding: 12px;
          font-size: 16px;
          background: #F9FAFB;
          transition: border-color 0.2s ease;
          box-sizing: border-box;
        }

        .input:focus {
          outline: none;
          border-color: #3B82F6;
          background: white;
        }

        .toggle-container {
          display: flex;
          background: #F3F4F6;
          border-radius: 8px;
          padding: 4px;
        }

        .toggle-button {
          flex: 1;
          padding: 8px 16px;
          border: none;
          border-radius: 6px;
          background: none;
          cursor: pointer;
          font-size: 14px;
          color: #6B7280;
          transition: all 0.2s ease;
        }

        .toggle-active {
          background: #3B82F6;
          color: white;
          font-weight: 600;
        }

        .modal-buttons {
          display: flex;
          gap: 12px;
          margin-top: 24px;
        }

        .cancel-button {
          flex: 1;
          padding: 12px;
          border: 2px solid #D1D5DB;
          border-radius: 8px;
          background: white;
          color: #6B7280;
          font-size: 16px;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .cancel-button:hover {
          background: #F9FAFB;
          border-color: #9CA3AF;
        }

        .confirm-button {
          flex: 1;
          padding: 12px;
          border: none;
          border-radius: 8px;
          background: linear-gradient(135deg, #3B82F6, #1D4ED8);
          color: white;
          font-size: 16px;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .confirm-button:hover {
          transform: translateY(-1px);
          box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        @media (max-width: 640px) {
          .container {
            padding: 16px;
          }
          
          .balance-amount {
            font-size: 24px;
          }
          
          .section-title {
            font-size: 20px;
          }
          
          .tab-title {
            font-size: 24px;
          }
        }
      `}</style>
    </div>
  );
};

export default FinanceApp;