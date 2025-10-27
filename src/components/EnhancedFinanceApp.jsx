import React, { useState, useEffect } from 'react';
import { 
  Wallet, CreditCard, Plus, Minus, TrendingUp, TrendingDown, 
  Calendar, DollarSign, PieChart, BarChart3, Settings, 
  Home, Receipt, Target, Filter, Download, Search,
  ShoppingCart, Car, Home as HomeIcon, Utensils, 
  Briefcase, Heart, GraduationCap, Gamepad2
} from 'lucide-react';
import { PieChart as RechartsPieChart, Cell, BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, LineChart, Line } from 'recharts';
import { format, startOfMonth, endOfMonth, subMonths, isWithinInterval } from 'date-fns';

const EnhancedFinanceApp = () => {
  const [activeTab, setActiveTab] = useState('home');
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const [filterCategory, setFilterCategory] = useState('all');
  const [dateRange, setDateRange] = useState('thisMonth');
  
  // Database states
  const [bankBalance, setBankBalance] = useState(125000);
  const [cashBalance, setCashBalance] = useState(25000);
  const [transactions, setTransactions] = useState([]);
  const [expenses, setExpenses] = useState([]);
  const [income, setIncome] = useState([]);
  const [budget, setBudget] = useState({});
  
  // Form states
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [date, setDate] = useState(new Date().toISOString().split('T')[0]);
  const [transactionType, setTransactionType] = useState('bank');
  const [category, setCategory] = useState('general');

  // Categories
  const expenseCategories = [
    { id: 'food', name: 'ආහාර', icon: Utensils, color: '#EF4444' },
    { id: 'transport', name: 'ප්‍රවාහනය', icon: Car, color: '#F59E0B' },
    { id: 'housing', name: 'නිවාස', icon: HomeIcon, color: '#8B5CF6' },
    { id: 'healthcare', name: 'සෞඛ්‍ය', icon: Heart, color: '#EC4899' },
    { id: 'education', name: 'අධ්‍යාපනය', icon: GraduationCap, color: '#06B6D4' },
    { id: 'entertainment', name: 'විනෝදාස්වාදය', icon: Gamepad2, color: '#10B981' },
    { id: 'shopping', name: 'සාප්පු සවාරි', icon: ShoppingCart, color: '#F97316' },
    { id: 'general', name: 'සාමාන්‍ය', icon: Receipt, color: '#6B7280' }
  ];

  const incomeCategories = [
    { id: 'salary', name: 'වැටුප', icon: Briefcase, color: '#10B981' },
    { id: 'business', name: 'ව්‍යාපාරය', icon: DollarSign, color: '#3B82F6' },
    { id: 'investment', name: 'ආයෝජන', icon: TrendingUp, color: '#8B5CF6' },
    { id: 'freelance', name: 'ස්වාධීන', icon: Target, color: '#F59E0B' },
    { id: 'other', name: 'වෙනත්', icon: Plus, color: '#6B7280' }
  ];

  // Load data from localStorage on component mount
  useEffect(() => {
    const savedData = localStorage.getItem('financeAppData');
    if (savedData) {
      const data = JSON.parse(savedData);
      setBankBalance(data.bankBalance || 125000);
      setCashBalance(data.cashBalance || 25000);
      setTransactions(data.transactions || []);
      setExpenses(data.expenses || []);
      setIncome(data.income || []);
      setBudget(data.budget || {});
    }
  }, []);

  // Save data to localStorage whenever state changes
  useEffect(() => {
    const dataToSave = {
      bankBalance,
      cashBalance,
      transactions,
      expenses,
      income,
      budget
    };
    localStorage.setItem('financeAppData', JSON.stringify(dataToSave));
  }, [bankBalance, cashBalance, transactions, expenses, income, budget]);

  const formatCurrency = (amount) => {
    return `රු. ${amount.toLocaleString()}.00`;
  };

  const getCategoryInfo = (categoryId, type = 'expense') => {
    const categories = type === 'expense' ? expenseCategories : incomeCategories;
    return categories.find(cat => cat.id === categoryId) || categories[categories.length - 1];
  };

  const getTotalIncome = () => income.reduce((sum, item) => sum + item.amount, 0);
  const getTotalExpenses = () => expenses.reduce((sum, item) => sum + item.amount, 0);
  const getTotalBalance = () => bankBalance + cashBalance;
  const getNetIncome = () => getTotalIncome() - getTotalExpenses();

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
      accountType: transactionType,
      category: 'transfer'
    };

    if (transactionType === 'bank') {
      setBankBalance(prev => prev + depositAmount);
    } else {
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
      accountType: 'bank',
      category: 'transfer'
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

    if (transactionType === 'cash' && cashBalance < expenseAmount) {
      alert('ප්‍රමාණවත් මුදල් නැත');
      return;
    }

    if (transactionType === 'bank' && bankBalance < expenseAmount) {
      alert('ප්‍රමාණවත් බැංකු ශේෂයක් නැත');
      return;
    }

    const newExpense = {
      id: Date.now(),
      amount: expenseAmount,
      description: description || 'වියදම',
      date: date,
      category: category,
      accountType: transactionType
    };

    if (transactionType === 'cash') {
      setCashBalance(prev => prev - expenseAmount);
    } else {
      setBankBalance(prev => prev - expenseAmount);
    }

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
      accountType: transactionType,
      category: category
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
    setCategory('general');
  };

  const openModal = (type) => {
    setModalType(type);
    setShowModal(true);
    resetForm();
  };

  const getExpensesByCategory = () => {
    const categoryTotals = {};
    expenses.forEach(expense => {
      const cat = expense.category || 'general';
      categoryTotals[cat] = (categoryTotals[cat] || 0) + expense.amount;
    });
    
    return Object.entries(categoryTotals).map(([categoryId, amount]) => {
      const categoryInfo = getCategoryInfo(categoryId, 'expense');
      return {
        name: categoryInfo.name,
        value: amount,
        color: categoryInfo.color
      };
    });
  };

  const getMonthlyData = () => {
    const monthlyData = {};
    
    [...expenses, ...income].forEach(item => {
      const month = format(new Date(item.date), 'yyyy-MM');
      if (!monthlyData[month]) {
        monthlyData[month] = { month, income: 0, expenses: 0 };
      }
      
      if (expenses.includes(item)) {
        monthlyData[month].expenses += item.amount;
      } else {
        monthlyData[month].income += item.amount;
      }
    });
    
    return Object.values(monthlyData).sort((a, b) => a.month.localeCompare(b.month));
  };

  const renderDashboard = () => {
    const expenseData = getExpensesByCategory();
    const monthlyData = getMonthlyData();
    const totalBalance = getTotalBalance();
    const netIncome = getNetIncome();
    
    return (
      <div className="container">
        {/* Financial Summary Cards */}
        <div className="summary-grid">
          <div className="summary-card total-balance">
            <div className="summary-header">
              <Wallet size={24} />
              <h3>සම්පූර්ණ ශේෂය</h3>
            </div>
            <p className="summary-amount">{formatCurrency(totalBalance)}</p>
            <span className="summary-subtitle">බැංකු + මාර්ගස්ථ</span>
          </div>
          
          <div className="summary-card net-income">
            <div className="summary-header">
              <TrendingUp size={24} />
              <h3>මාසික ශුද්ධ ආදායම</h3>
            </div>
            <p className={`summary-amount ${netIncome >= 0 ? 'positive' : 'negative'}`}>
              {formatCurrency(Math.abs(netIncome))}
            </p>
            <span className="summary-subtitle">
              {netIncome >= 0 ? 'ලාභය' : 'පාඩුව'}
            </span>
          </div>
          
          <div className="summary-card monthly-income">
            <div className="summary-header">
              <DollarSign size={24} />
              <h3>මාසික ආදායම</h3>
            </div>
            <p className="summary-amount positive">{formatCurrency(getTotalIncome())}</p>
            <span className="summary-subtitle">මෙම මාසයේ</span>
          </div>
          
          <div className="summary-card monthly-expenses">
            <div className="summary-header">
              <Receipt size={24} />
              <h3>මාසික වියදම්</h3>
            </div>
            <p className="summary-amount negative">{formatCurrency(getTotalExpenses())}</p>
            <span className="summary-subtitle">මෙම මාසයේ</span>
          </div>
        </div>

        {/* Account Balance Cards */}
        <div className="balance-container">
          <div className="balance-card bank-card">
            <div className="balance-header">
              <CreditCard color="#fff" size={28} />
              <div>
                <h3 className="balance-title">බැංකු ගිණුම</h3>
                <p className="balance-subtitle">ප්‍රධාන ගිණුම</p>
              </div>
            </div>
            <p className="balance-amount">{formatCurrency(bankBalance)}</p>
            <div className="balance-actions">
              <button className="mini-action-btn" onClick={() => openModal('deposit')}>
                <Plus size={16} />
              </button>
              <button className="mini-action-btn" onClick={() => openModal('withdrawal')}>
                <Minus size={16} />
              </button>
            </div>
          </div>
          
          <div className="balance-card cash-card">
            <div className="balance-header">
              <Wallet color="#fff" size={28} />
              <div>
                <h3 className="balance-title">මාර්ගස්ථ මුදල්</h3>
                <p className="balance-subtitle">අතේ ඇති මුදල්</p>
              </div>
            </div>
            <p className="balance-amount">{formatCurrency(cashBalance)}</p>
            <div className="balance-actions">
              <button className="mini-action-btn" onClick={() => openModal('income')}>
                <Plus size={16} />
              </button>
              <button className="mini-action-btn" onClick={() => openModal('expense')}>
                <Minus size={16} />
              </button>
            </div>
          </div>
        </div>

        {/* Charts Section */}
        <div className="charts-container">
          <div className="chart-card">
            <h3 className="chart-title">වියදම් කාණ්ඩ අනුව</h3>
            <div className="chart-wrapper">
              {expenseData.length > 0 ? (
                <ResponsiveContainer width="100%" height={200}>
                  <RechartsPieChart>
                    <PieChart data={expenseData} cx="50%" cy="50%" innerRadius={40} outerRadius={80}>
                      {expenseData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={entry.color} />
                      ))}
                    </PieChart>
                    <Tooltip formatter={(value) => formatCurrency(value)} />
                  </RechartsPieChart>
                </ResponsiveContainer>
              ) : (
                <div className="no-data">වියදම් දත්ත නැත</div>
              )}
            </div>
          </div>
          
          <div className="chart-card">
            <h3 className="chart-title">මාසික ප්‍රවණතා</h3>
            <div className="chart-wrapper">
              {monthlyData.length > 0 ? (
                <ResponsiveContainer width="100%" height={200}>
                  <BarChart data={monthlyData}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="month" />
                    <YAxis />
                    <Tooltip formatter={(value) => formatCurrency(value)} />
                    <Bar dataKey="income" fill="#10B981" name="ආදායම" />
                    <Bar dataKey="expenses" fill="#EF4444" name="වියදම්" />
                  </BarChart>
                </ResponsiveContainer>
              ) : (
                <div className="no-data">මාසික දත්ත නැත</div>
              )}
            </div>
          </div>
        </div>

        {/* Quick Actions */}
        <div className="actions-container">
          <h2 className="section-title">ක්‍රියාවන්</h2>
          <div className="action-buttons">
            <button className="action-button deposit-button" onClick={() => openModal('deposit')}>
              <Plus size={20} />
              <span>Deposit</span>
            </button>
            <button className="action-button withdraw-button" onClick={() => openModal('withdrawal')}>
              <Minus size={20} />
              <span>Withdraw</span>
            </button>
            <button className="action-button income-button" onClick={() => openModal('income')}>
              <TrendingUp size={20} />
              <span>ආදායම</span>
            </button>
            <button className="action-button expense-button" onClick={() => openModal('expense')}>
              <TrendingDown size={20} />
              <span>වියදම</span>
            </button>
          </div>
        </div>

        {/* Recent Transactions */}
        <div className="recent-container">
          <div className="recent-header">
            <h2 className="section-title">මෑත ගනුදෙනු</h2>
            <button className="view-all-btn" onClick={() => setActiveTab('transactions')}>
              සියල්ල බලන්න
            </button>
          </div>
          <div className="transactions-list">
            {[...transactions, ...expenses.map(e => ({...e, type: 'expense'})), ...income.map(i => ({...i, type: 'income'}))]
              .sort((a, b) => new Date(b.date) - new Date(a.date))
              .slice(0, 5)
              .map(transaction => {
                const isPositive = transaction.type === 'deposit' || transaction.type === 'income';
                const categoryInfo = transaction.category ? getCategoryInfo(transaction.category, transaction.type === 'income' ? 'income' : 'expense') : null;
                
                return (
                  <div key={transaction.id} className="transaction-item">
                    <div className="transaction-icon" style={{ backgroundColor: categoryInfo?.color || '#F3F4F6' }}>
                      {categoryInfo ? 
                        React.createElement(categoryInfo.icon, { size: 20, color: '#fff' }) :
                        (isPositive ? <TrendingUp color="#10B981" size={20} /> : <TrendingDown color="#EF4444" size={20} />)
                      }
                    </div>
                    <div className="transaction-details">
                      <p className="transaction-description">{transaction.description}</p>
                      <p className="transaction-date">
                        {transaction.date} • {transaction.accountType === 'bank' ? 'බැංකුව' : 'මාර්ගස්ථ'}
                        {categoryInfo && ` • ${categoryInfo.name}`}
                      </p>
                    </div>
                    <p className={`transaction-amount ${isPositive ? 'positive' : 'negative'}`}>
                      {isPositive ? '+' : '-'}{formatCurrency(transaction.amount)}
                    </p>
                  </div>
                );
              })}
          </div>
        </div>
      </div>
    );
  };

  const renderExpensesTab = () => {
    const filteredExpenses = expenses.filter(expense => {
      const matchesSearch = expense.description.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesCategory = filterCategory === 'all' || expense.category === filterCategory;
      return matchesSearch && matchesCategory;
    });

    return (
      <div className="container">
        <div className="tab-header">
          <h1 className="tab-title">වියදම් කළමනාකරණය</h1>
          <button className="add-button" onClick={() => openModal('expense')}>
            <Plus size={20} />
          </button>
        </div>
        
        {/* Filters */}
        <div className="filters-container">
          <div className="search-container">
            <Search size={20} />
            <input
              type="text"
              placeholder="වියදම් සොයන්න..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="search-input"
            />
          </div>
          
          <select 
            value={filterCategory} 
            onChange={(e) => setFilterCategory(e.target.value)}
            className="filter-select"
          >
            <option value="all">සියලු කාණ්ඩ</option>
            {expenseCategories.map(cat => (
              <option key={cat.id} value={cat.id}>{cat.name}</option>
            ))}
          </select>
        </div>

        {/* Expense Summary */}
        <div className="expense-summary">
          <div className="summary-item">
            <span>මෙම මාසයේ වියදම්:</span>
            <span className="summary-value negative">{formatCurrency(getTotalExpenses())}</span>
          </div>
        </div>
        
        <div className="list-container">
          {filteredExpenses.map(item => {
            const categoryInfo = getCategoryInfo(item.category, 'expense');
            return (
              <div key={item.id} className="list-item">
                <div className="list-item-icon" style={{ backgroundColor: categoryInfo.color }}>
                  {React.createElement(categoryInfo.icon, { size: 20, color: '#fff' })}
                </div>
                <div className="list-item-details">
                  <p className="list-item-description">{item.description}</p>
                  <p className="list-item-date">
                    {item.date} • {categoryInfo.name} • {item.accountType === 'bank' ? 'බැංකුව' : 'මාර්ගස්ථ'}
                  </p>
                </div>
                <p className="list-item-amount negative">
                  -{formatCurrency(item.amount)}
                </p>
              </div>
            );
          })}
          {filteredExpenses.length === 0 && (
            <div className="no-data">වියදම් සොයා ගත නොහැක</div>
          )}
        </div>
      </div>
    );
  };

  const renderIncomeTab = () => {
    const filteredIncome = income.filter(incomeItem => {
      const matchesSearch = incomeItem.description.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesCategory = filterCategory === 'all' || incomeItem.category === filterCategory;
      return matchesSearch && matchesCategory;
    });

    return (
      <div className="container">
        <div className="tab-header">
          <h1 className="tab-title">ආදායම් කළමනාකරණය</h1>
          <button className="add-button" onClick={() => openModal('income')}>
            <Plus size={20} />
          </button>
        </div>
        
        {/* Filters */}
        <div className="filters-container">
          <div className="search-container">
            <Search size={20} />
            <input
              type="text"
              placeholder="ආදායම් සොයන්න..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="search-input"
            />
          </div>
          
          <select 
            value={filterCategory} 
            onChange={(e) => setFilterCategory(e.target.value)}
            className="filter-select"
          >
            <option value="all">සියලු කාණ්ඩ</option>
            {incomeCategories.map(cat => (
              <option key={cat.id} value={cat.id}>{cat.name}</option>
            ))}
          </select>
        </div>

        {/* Income Summary */}
        <div className="income-summary">
          <div className="summary-item">
            <span>මෙම මාසයේ ආදායම්:</span>
            <span className="summary-value positive">{formatCurrency(getTotalIncome())}</span>
          </div>
        </div>
        
        <div className="list-container">
          {filteredIncome.map(item => {
            const categoryInfo = getCategoryInfo(item.category, 'income');
            return (
              <div key={item.id} className="list-item">
                <div className="list-item-icon" style={{ backgroundColor: categoryInfo.color }}>
                  {React.createElement(categoryInfo.icon, { size: 20, color: '#fff' })}
                </div>
                <div className="list-item-details">
                  <p className="list-item-description">{item.description}</p>
                  <p className="list-item-date">
                    {item.date} • {categoryInfo.name} • {item.accountType === 'bank' ? 'බැංකුව' : 'මාර්ගස්ථ'}
                  </p>
                </div>
                <p className="list-item-amount positive">
                  +{formatCurrency(item.amount)}
                </p>
              </div>
            );
          })}
          {filteredIncome.length === 0 && (
            <div className="no-data">ආදායම් සොයා ගත නොහැක</div>
          )}
        </div>
      </div>
    );
  };

  const renderAnalyticsTab = () => {
    const expenseData = getExpensesByCategory();
    const monthlyData = getMonthlyData();
    
    return (
      <div className="container">
        <div className="tab-header">
          <h1 className="tab-title">විශ්ලේෂණ සහ වාර්තා</h1>
          <button className="export-button">
            <Download size={20} />
            <span>Export</span>
          </button>
        </div>

        {/* Analytics Summary */}
        <div className="analytics-summary">
          <div className="analytics-card">
            <h3>මාසික සාරාංශය</h3>
            <div className="analytics-metrics">
              <div className="metric">
                <span className="metric-label">ආදායම්:</span>
                <span className="metric-value positive">{formatCurrency(getTotalIncome())}</span>
              </div>
              <div className="metric">
                <span className="metric-label">වියදම්:</span>
                <span className="metric-value negative">{formatCurrency(getTotalExpenses())}</span>
              </div>
              <div className="metric">
                <span className="metric-label">ශුද්ධ:</span>
                <span className={`metric-value ${getNetIncome() >= 0 ? 'positive' : 'negative'}`}>
                  {formatCurrency(Math.abs(getNetIncome()))}
                </span>
              </div>
            </div>
          </div>
        </div>

        {/* Charts */}
        <div className="analytics-charts">
          <div className="chart-card full-width">
            <h3 className="chart-title">මාසික ආදායම් සහ වියදම්</h3>
            <div className="chart-wrapper">
              {monthlyData.length > 0 ? (
                <ResponsiveContainer width="100%" height={300}>
                  <BarChart data={monthlyData}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="month" />
                    <YAxis />
                    <Tooltip formatter={(value) => formatCurrency(value)} />
                    <Bar dataKey="income" fill="#10B981" name="ආදායම" />
                    <Bar dataKey="expenses" fill="#EF4444" name="වියදම්" />
                  </BarChart>
                </ResponsiveContainer>
              ) : (
                <div className="no-data">මාසික දත්ත නැත</div>
              )}
            </div>
          </div>

          <div className="chart-card">
            <h3 className="chart-title">වියදම් කාණ්ඩ</h3>
            <div className="chart-wrapper">
              {expenseData.length > 0 ? (
                <ResponsiveContainer width="100%" height={250}>
                  <RechartsPieChart>
                    <PieChart data={expenseData} cx="50%" cy="50%" outerRadius={80}>
                      {expenseData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={entry.color} />
                      ))}
                    </PieChart>
                    <Tooltip formatter={(value) => formatCurrency(value)} />
                  </RechartsPieChart>
                </ResponsiveContainer>
              ) : (
                <div className="no-data">වියදම් දත්ත නැත</div>
              )}
            </div>
            
            {/* Legend */}
            <div className="chart-legend">
              {expenseData.map((item, index) => (
                <div key={index} className="legend-item">
                  <div className="legend-color" style={{ backgroundColor: item.color }}></div>
                  <span className="legend-label">{item.name}</span>
                  <span className="legend-value">{formatCurrency(item.value)}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  };

  const renderTransactionsTab = () => {
    const allTransactions = [
      ...transactions.map(t => ({...t, category: 'transfer'})),
      ...expenses.map(e => ({...e, type: 'expense'})),
      ...income.map(i => ({...i, type: 'income'}))
    ].sort((a, b) => new Date(b.date) - new Date(a.date));

    const filteredTransactions = allTransactions.filter(transaction => {
      const matchesSearch = transaction.description.toLowerCase().includes(searchTerm.toLowerCase());
      return matchesSearch;
    });

    return (
      <div className="container">
        <div className="tab-header">
          <h1 className="tab-title">සියලු ගනුදෙනු</h1>
          <button className="export-button">
            <Download size={20} />
          </button>
        </div>
        
        {/* Search */}
        <div className="filters-container">
          <div className="search-container">
            <Search size={20} />
            <input
              type="text"
              placeholder="ගනුදෙනු සොයන්න..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="search-input"
            />
          </div>
        </div>
        
        <div className="list-container">
          {filteredTransactions.map(transaction => {
            const isPositive = transaction.type === 'deposit' || transaction.type === 'income';
            const categoryInfo = transaction.category && transaction.category !== 'transfer' ? 
              getCategoryInfo(transaction.category, transaction.type === 'income' ? 'income' : 'expense') : null;
            
            return (
              <div key={transaction.id} className="list-item">
                <div className="list-item-icon" style={{ backgroundColor: categoryInfo?.color || (isPositive ? '#10B981' : '#EF4444') }}>
                  {categoryInfo ? 
                    React.createElement(categoryInfo.icon, { size: 20, color: '#fff' }) :
                    (isPositive ? <TrendingUp color="#fff" size={20} /> : <TrendingDown color="#fff" size={20} />)
                  }
                </div>
                <div className="list-item-details">
                  <p className="list-item-description">{transaction.description}</p>
                  <p className="list-item-date">
                    {transaction.date} • {transaction.accountType === 'bank' ? 'බැංකුව' : 'මාර්ගස්ථ'}
                    {categoryInfo && ` • ${categoryInfo.name}`}
                  </p>
                </div>
                <p className={`list-item-amount ${isPositive ? 'positive' : 'negative'}`}>
                  {isPositive ? '+' : '-'}{formatCurrency(transaction.amount)}
                </p>
              </div>
            );
          })}
          {filteredTransactions.length === 0 && (
            <div className="no-data">ගනුදෙනු සොයා ගත නොහැක</div>
          )}
        </div>
      </div>
    );
  };

  const renderModal = () => {
    if (!showModal) return null;
    
    const categories = modalType === 'income' ? incomeCategories : expenseCategories;
    
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
          
          {(modalType === 'expense' || modalType === 'income') && (
            <div className="form-group">
              <label className="label">කාණ්ඩය</label>
              <div className="category-grid">
                {categories.map(cat => (
                  <button
                    key={cat.id}
                    className={`category-button ${category === cat.id ? 'category-active' : ''}`}
                    onClick={() => setCategory(cat.id)}
                    style={{ borderColor: cat.color }}
                  >
                    {React.createElement(cat.icon, { size: 18, color: category === cat.id ? '#fff' : cat.color })}
                    <span>{cat.name}</span>
                  </button>
                ))}
              </div>
            </div>
          )}
          
          {(modalType === 'deposit' || modalType === 'income' || modalType === 'expense') && (
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
            <button className="cancel-button" onClick={() => setShowModal(false)}>
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
      {/* Beautiful Animated Header */}
      <header className="app-header">
        <div className="header-content">
          <div className="header-title">
            <div className="logo-container">
              <Wallet size={32} color="#fff" className="logo-icon" />
              <div className="logo-glow"></div>
            </div>
            <div className="title-container">
              <h1>💰 මුදල් කළමනාකරණය</h1>
              <p className="subtitle">ඔබේ මුදල් ස්මාර්ට් ලෙස කළමනාකරණය කරන්න</p>
            </div>
          </div>
          <div className="header-balance">
            <div className="balance-indicator">
              <span className="header-balance-label">සම්පූර්ණ ශේෂය</span>
              <span className="header-balance-amount">{formatCurrency(getTotalBalance())}</span>
              <div className="balance-trend">
                {getNetIncome() >= 0 ? (
                  <><TrendingUp size={16} color="#10B981" /> <span className="trend-positive">වර්ධනය</span></>
                ) : (
                  <><TrendingDown size={16} color="#EF4444" /> <span className="trend-negative">අඩුවීම</span></>
                )}
              </div>
            </div>
          </div>
        </div>
        <div className="header-wave"></div>
      </header>
      
      {/* Tab Content */}
      <main className="main-content">
        {activeTab === 'home' && renderDashboard()}
        {activeTab === 'expenses' && renderExpensesTab()}
        {activeTab === 'income' && renderIncomeTab()}
        {activeTab === 'analytics' && renderAnalyticsTab()}
        {activeTab === 'transactions' && renderTransactionsTab()}
      </main>
      
      {/* Bottom Navigation */}
      <nav className="bottom-nav">
        <button 
          className={`nav-item ${activeTab === 'home' ? 'nav-item-active' : ''}`}
          onClick={() => setActiveTab('home')}
        >
          <Home color={activeTab === 'home' ? '#3B82F6' : '#9CA3AF'} size={24} />
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

        <button 
          className={`nav-item ${activeTab === 'analytics' ? 'nav-item-active' : ''}`}
          onClick={() => setActiveTab('analytics')}
        >
          <BarChart3 color={activeTab === 'analytics' ? '#3B82F6' : '#9CA3AF'} size={24} />
          <span className={`nav-text ${activeTab === 'analytics' ? 'nav-text-active' : ''}`}>
            විශ්ලේෂණ
          </span>
        </button>

        <button 
          className={`nav-item ${activeTab === 'transactions' ? 'nav-item-active' : ''}`}
          onClick={() => setActiveTab('transactions')}
        >
          <Receipt color={activeTab === 'transactions' ? '#3B82F6' : '#9CA3AF'} size={24} />
          <span className={`nav-text ${activeTab === 'transactions' ? 'nav-text-active' : ''}`}>
            ගනුදෙනු
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
          font-family: 'Inter', 'Noto Sans Sinhala', system-ui, -apple-system, sans-serif;
        }

        .app-header {
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(20px);
          border-bottom: 1px solid rgba(255, 255, 255, 0.2);
          padding: 16px 20px;
          position: sticky;
          top: 0;
          z-index: 40;
        }

        .header-content {
          max-width: 800px;
          margin: 0 auto;
          display: flex;
          justify-content: space-between;
          align-items: center;
        }

        .header-title {
          display: flex;
          align-items: center;
          gap: 12px;
        }

        .header-title h1 {
          margin: 0;
          color: white;
          font-size: 24px;
          font-weight: 700;
          text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header-balance {
          text-align: right;
        }

        .header-balance-label {
          display: block;
          color: rgba(255, 255, 255, 0.8);
          font-size: 12px;
          margin-bottom: 4px;
        }

        .header-balance-amount {
          color: white;
          font-size: 18px;
          font-weight: 700;
          text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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

        .summary-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 16px;
          margin-bottom: 32px;
        }

        .summary-card {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 16px;
          padding: 20px;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
          transition: transform 0.2s ease;
        }

        .summary-card:hover {
          transform: translateY(-4px);
        }

        .summary-header {
          display: flex;
          align-items: center;
          gap: 12px;
          margin-bottom: 12px;
        }

        .summary-header h3 {
          margin: 0;
          font-size: 14px;
          font-weight: 600;
          color: #6B7280;
        }

        .summary-amount {
          margin: 0 0 8px 0;
          font-size: 28px;
          font-weight: 800;
          color: #1F2937;
        }

        .summary-subtitle {
          font-size: 12px;
          color: #9CA3AF;
        }

        .total-balance .summary-header svg { color: #3B82F6; }
        .net-income .summary-header svg { color: #10B981; }
        .monthly-income .summary-header svg { color: #10B981; }
        .monthly-expenses .summary-header svg { color: #EF4444; }

        .balance-container {
          display: grid;
          grid-template-columns: 1fr;
          gap: 20px;
          margin-bottom: 32px;
        }

        @media (min-width: 640px) {
          .balance-container {
            grid-template-columns: 1fr 1fr;
          }
        }

        .balance-card {
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(20px);
          border: 1px solid rgba(255, 255, 255, 0.2);
          padding: 28px;
          border-radius: 20px;
          color: white;
          box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
          transition: all 0.3s ease;
          position: relative;
          overflow: hidden;
        }

        .balance-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: linear-gradient(135deg, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0.05) 100%);
          z-index: 1;
        }

        .balance-card > * {
          position: relative;
          z-index: 2;
        }

        .balance-card:hover {
          transform: translateY(-6px);
          box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
        }

        .bank-card {
          background: linear-gradient(135deg, #3B82F6 0%, #1E40AF 100%);
        }

        .cash-card {
          background: linear-gradient(135deg, #10B981 0%, #047857 100%);
        }

        .balance-header {
          display: flex;
          align-items: flex-start;
          justify-content: space-between;
          margin-bottom: 20px;
        }

        .balance-header > div h3 {
          margin: 0;
          font-size: 18px;
          font-weight: 700;
        }

        .balance-subtitle {
          margin: 4px 0 0 0;
          font-size: 12px;
          opacity: 0.8;
        }

        .balance-amount {
          margin: 0 0 20px 0;
          font-size: 36px;
          font-weight: 900;
          background: linear-gradient(45deg, #fff, #f0f0f0);
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          background-clip: text;
          text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .balance-actions {
          display: flex;
          gap: 8px;
        }

        .mini-action-btn {
          background: rgba(255, 255, 255, 0.2);
          border: none;
          border-radius: 8px;
          padding: 8px;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .mini-action-btn:hover {
          background: rgba(255, 255, 255, 0.3);
          transform: scale(1.1);
        }

        .charts-container {
          display: grid;
          grid-template-columns: 1fr;
          gap: 20px;
          margin-bottom: 32px;
        }

        @media (min-width: 768px) {
          .charts-container {
            grid-template-columns: 1fr 1fr;
          }
        }

        .chart-card {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 16px;
          padding: 24px;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .chart-card.full-width {
          grid-column: 1 / -1;
        }

        .chart-title {
          margin: 0 0 20px 0;
          font-size: 18px;
          font-weight: 700;
          color: #1F2937;
        }

        .chart-wrapper {
          width: 100%;
          height: 200px;
        }

        .no-data {
          display: flex;
          align-items: center;
          justify-content: center;
          height: 200px;
          color: #9CA3AF;
          font-style: italic;
        }

        .chart-legend {
          margin-top: 16px;
          display: flex;
          flex-direction: column;
          gap: 8px;
        }

        .legend-item {
          display: flex;
          align-items: center;
          gap: 8px;
          font-size: 14px;
        }

        .legend-color {
          width: 12px;
          height: 12px;
          border-radius: 2px;
        }

        .legend-label {
          flex: 1;
          color: #374151;
        }

        .legend-value {
          font-weight: 600;
          color: #1F2937;
        }

        .actions-container {
          margin-bottom: 32px;
        }

        .section-title {
          font-size: 24px;
          font-weight: 800;
          color: white;
          margin-bottom: 20px;
          text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .action-buttons {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
          gap: 16px;
        }

        .action-button {
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 12px;
          padding: 18px 16px;
          border: none;
          border-radius: 16px;
          font-size: 16px;
          font-weight: 700;
          color: white;
          cursor: pointer;
          transition: all 0.3s ease;
          box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
          position: relative;
          overflow: hidden;
        }

        .action-button::before {
          content: '';
          position: absolute;
          top: 0;
          left: -100%;
          width: 100%;
          height: 100%;
          background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
          transition: left 0.5s ease;
        }

        .action-button:hover::before {
          left: 100%;
        }

        .action-button:hover {
          transform: translateY(-4px);
          box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        }

        .deposit-button {
          background: linear-gradient(135deg, #10B981, #059669);
        }

        .withdraw-button {
          background: linear-gradient(135deg, #EF4444, #DC2626);
        }

        .income-button {
          background: linear-gradient(135deg, #3B82F6, #1D4ED8);
        }

        .expense-button {
          background: linear-gradient(135deg, #F59E0B, #D97706);
        }

        .recent-container {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 20px;
          padding: 28px;
          box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
        }

        .recent-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 20px;
        }

        .view-all-btn {
          background: linear-gradient(135deg, #3B82F6, #1D4ED8);
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 8px;
          font-size: 14px;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .view-all-btn:hover {
          transform: translateY(-2px);
          box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        .recent-container .section-title {
          color: #1F2937;
          text-shadow: none;
          margin-bottom: 0;
        }

        .filters-container {
          display: flex;
          gap: 16px;
          margin-bottom: 24px;
          flex-wrap: wrap;
        }

        .search-container {
          flex: 1;
          position: relative;
          min-width: 200px;
        }

        .search-container svg {
          position: absolute;
          left: 12px;
          top: 50%;
          transform: translateY(-50%);
          color: #9CA3AF;
        }

        .search-input {
          width: 100%;
          padding: 12px 12px 12px 44px;
          border: 2px solid rgba(255, 255, 255, 0.2);
          border-radius: 12px;
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(10px);
          color: white;
          font-size: 16px;
          box-sizing: border-box;
        }

        .search-input::placeholder {
          color: rgba(255, 255, 255, 0.7);
        }

        .search-input:focus {
          outline: none;
          border-color: rgba(255, 255, 255, 0.4);
          background: rgba(255, 255, 255, 0.2);
        }

        .filter-select {
          padding: 12px 16px;
          border: 2px solid rgba(255, 255, 255, 0.2);
          border-radius: 12px;
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(10px);
          color: white;
          font-size: 16px;
          cursor: pointer;
        }

        .filter-select option {
          background: #1F2937;
          color: white;
        }

        .expense-summary, .income-summary {
          background: rgba(255, 255, 255, 0.1);
          backdrop-filter: blur(10px);
          border-radius: 12px;
          padding: 16px 20px;
          margin-bottom: 20px;
        }

        .summary-item {
          display: flex;
          justify-content: space-between;
          align-items: center;
          color: white;
          font-weight: 600;
        }

        .summary-value {
          font-size: 18px;
          font-weight: 800;
        }

        .analytics-summary {
          margin-bottom: 32px;
        }

        .analytics-card {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 16px;
          padding: 24px;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .analytics-card h3 {
          margin: 0 0 20px 0;
          font-size: 20px;
          font-weight: 700;
          color: #1F2937;
        }

        .analytics-metrics {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
          gap: 20px;
        }

        .metric {
          display: flex;
          flex-direction: column;
          gap: 8px;
        }

        .metric-label {
          font-size: 14px;
          color: #6B7280;
          font-weight: 600;
        }

        .metric-value {
          font-size: 24px;
          font-weight: 800;
        }

        .analytics-charts {
          display: grid;
          grid-template-columns: 1fr;
          gap: 20px;
        }

        @media (min-width: 768px) {
          .analytics-charts {
            grid-template-columns: 2fr 1fr;
          }
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
          padding: 18px;
          border-radius: 16px;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
          transition: all 0.3s ease;
          border-left: 4px solid transparent;
        }

        .transaction-item:hover {
          transform: translateX(8px);
          box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .transaction-icon {
          margin-right: 16px;
          padding: 12px;
          border-radius: 12px;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .transaction-details {
          flex: 1;
        }

        .transaction-description {
          margin: 0 0 6px 0;
          font-size: 16px;
          font-weight: 700;
          color: #1F2937;
        }

        .transaction-date {
          margin: 0;
          font-size: 13px;
          color: #6B7280;
          font-weight: 500;
        }

        .transaction-amount {
          margin: 0;
          font-size: 18px;
          font-weight: 800;
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
          margin-bottom: 28px;
        }

        .tab-title {
          font-size: 32px;
          font-weight: 900;
          color: white;
          margin: 0;
          text-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .add-button, .export-button {
          background: linear-gradient(135deg, #3B82F6, #1D4ED8);
          border: none;
          padding: 14px 18px;
          border-radius: 16px;
          cursor: pointer;
          box-shadow: 0 6px 20px rgba(59, 130, 246, 0.3);
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 8px;
          color: white;
          font-weight: 600;
        }

        .add-button:hover, .export-button:hover {
          transform: translateY(-3px);
          box-shadow: 0 10px 30px rgba(59, 130, 246, 0.4);
        }

        .list-container {
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          border-radius: 20px;
          padding: 24px;
          box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
        }

        .list-item {
          display: flex;
          align-items: center;
          background: white;
          padding: 18px;
          border-radius: 16px;
          margin-bottom: 12px;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
          transition: all 0.3s ease;
          border-left: 4px solid #E5E7EB;
        }

        .list-item:hover {
          transform: translateX(8px);
          box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
          border-left-color: #3B82F6;
        }

        .list-item-icon {
          margin-right: 16px;
          padding: 12px;
          border-radius: 12px;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .list-item-details {
          flex: 1;
        }

        .list-item-description {
          margin: 0 0 6px 0;
          font-size: 16px;
          font-weight: 700;
          color: #1F2937;
        }

        .list-item-date {
          margin: 0;
          font-size: 13px;
          color: #6B7280;
          font-weight: 500;
        }

        .list-item-amount {
          margin: 0;
          font-size: 18px;
          font-weight: 800;
        }

        .bottom-nav {
          display: flex;
          background: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(20px);
          border-top: 1px solid rgba(255, 255, 255, 0.2);
          padding: 12px 16px;
          position: fixed;
          bottom: 0;
          left: 0;
          right: 0;
          z-index: 50;
          box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.1);
        }

        .nav-item {
          flex: 1;
          display: flex;
          flex-direction: column;
          align-items: center;
          padding: 12px 8px;
          background: none;
          border: none;
          cursor: pointer;
          transition: all 0.3s ease;
          border-radius: 12px;
          position: relative;
        }

        .nav-item:hover {
          background: rgba(59, 130, 246, 0.1);
          transform: translateY(-2px);
        }

        .nav-item-active {
          background: rgba(59, 130, 246, 0.15);
        }

        .nav-item-active::before {
          content: '';
          position: absolute;
          top: 0;
          left: 50%;
          transform: translateX(-50%);
          width: 24px;
          height: 3px;
          background: #3B82F6;
          border-radius: 0 0 3px 3px;
        }

        .nav-text {
          font-size: 11px;
          color: #9CA3AF;
          margin-top: 6px;
          font-weight: 600;
        }

        .nav-text-active {
          color: #3B82F6;
          font-weight: 700;
        }

        .modal-overlay {
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: rgba(0, 0, 0, 0.7);
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 16px;
          z-index: 100;
          backdrop-filter: blur(8px);
        }

        .modal-content {
          background: white;
          border-radius: 24px;
          padding: 32px;
          width: 100%;
          max-width: 480px;
          box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
          animation: modalSlideIn 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
          max-height: 90vh;
          overflow-y: auto;
        }

        @keyframes modalSlideIn {
          from {
            opacity: 0;
            transform: translateY(30px) scale(0.9);
          }
          to {
            opacity: 1;
            transform: translateY(0) scale(1);
          }
        }

        .modal-title {
          font-size: 24px;
          font-weight: 800;
          color: #1F2937;
          margin: 0 0 28px 0;
          text-align: center;
        }

        .form-group {
          margin-bottom: 20px;
        }

        .label {
          display: block;
          font-size: 15px;
          font-weight: 700;
          color: #374151;
          margin-bottom: 10px;
        }

        .input {
          width: 100%;
          border: 2px solid #E5E7EB;
          border-radius: 12px;
          padding: 14px 16px;
          font-size: 16px;
          background: #F9FAFB;
          transition: all 0.2s ease;
          box-sizing: border-box;
          font-weight: 500;
        }

        .input:focus {
          outline: none;
          border-color: #3B82F6;
          background: white;
          box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .category-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
          gap: 12px;
        }

        .category-button {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 8px;
          padding: 16px 12px;
          border: 2px solid #E5E7EB;
          border-radius: 12px;
          background: #F9FAFB;
          cursor: pointer;
          transition: all 0.2s ease;
          font-size: 13px;
          font-weight: 600;
        }

        .category-button:hover {
          transform: translateY(-2px);
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .category-active {
          background: #3B82F6;
          border-color: #3B82F6;
          color: white;
          transform: scale(1.05);
        }

        .toggle-container {
          display: flex;
          background: #F3F4F6;
          border-radius: 12px;
          padding: 6px;
        }

        .toggle-button {
          flex: 1;
          padding: 12px 16px;
          border: none;
          border-radius: 8px;
          background: none;
          cursor: pointer;
          font-size: 15px;
          color: #6B7280;
          transition: all 0.2s ease;
          font-weight: 600;
        }

        .toggle-active {
          background: #3B82F6;
          color: white;
          box-shadow: 0 2px 8px rgba(59, 130, 246, 0.3);
        }

        .modal-buttons {
          display: flex;
          gap: 16px;
          margin-top: 32px;
        }

        .cancel-button {
          flex: 1;
          padding: 14px;
          border: 2px solid #D1D5DB;
          border-radius: 12px;
          background: white;
          color: #6B7280;
          font-size: 16px;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .cancel-button:hover {
          background: #F9FAFB;
          border-color: #9CA3AF;
          transform: translateY(-1px);
        }

        .confirm-button {
          flex: 1;
          padding: 14px;
          border: none;
          border-radius: 12px;
          background: linear-gradient(135deg, #3B82F6, #1D4ED8);
          color: white;
          font-size: 16px;
          font-weight: 700;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .confirm-button:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
        }

        @media (max-width: 640px) {
          .container {
            padding: 16px;
          }
          
          .summary-grid {
            grid-template-columns: 1fr;
          }
          
          .balance-amount {
            font-size: 28px;
          }
          
          .section-title {
            font-size: 20px;
          }
          
          .tab-title {
            font-size: 24px;
          }

          .header-title h1 {
            font-size: 20px;
          }

          .header-balance-amount {
            font-size: 16px;
          }

          .action-buttons {
            grid-template-columns: 1fr 1fr;
          }

          .charts-container {
            grid-template-columns: 1fr;
          }

          .analytics-charts {
            grid-template-columns: 1fr;
          }

          .filters-container {
            flex-direction: column;
          }

          .search-container {
            min-width: auto;
          }
        }
      `}</style>
    </div>
  );
};

export default EnhancedFinanceApp;