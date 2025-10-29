import React, { useState, useEffect } from 'react';
import './App.css';

const FinanceApp = () => {
  const [bankBalance, setBankBalance] = useState(50000);
  const [cashBalance, setCashBalance] = useState(0);
  const [categories, setCategories] = useState([
    { id: 1, name: 'පෑන් මිලදී ගැනීම්', balance: 0, target: 10000, spent: 0, unitPrice: 100 },
    { id: 2, name: 'කෑම', balance: 0, target: 15000, spent: 0, unitPrice: 200 },
    { id: 3, name: 'ප්‍රවාහන', balance: 0, target: 8000, spent: 0, unitPrice: 50 }
  ]);
  const [transactions, setTransactions] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [categoryModalVisible, setCategoryModalVisible] = useState(false);
  const [detailsModalVisible, setDetailsModalVisible] = useState(false);
  const [currentModalType, setCurrentModalType] = useState('');
  const [editingCategory, setEditingCategory] = useState(null);
  const [viewingCategoryId, setViewingCategoryId] = useState(null);
  const [nextCategoryId, setNextCategoryId] = useState(4);

  // Form states
  const [amount, setAmount] = useState('');
  const [description, setDescription] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [categoryName, setCategoryName] = useState('');
  const [categoryTarget, setCategoryTarget] = useState('');
  const [categoryUnitPrice, setCategoryUnitPrice] = useState('');

  useEffect(() => {
    const savedData = localStorage.getItem('budgetTrackerWorkingV23');
    if (savedData) {
      const data = JSON.parse(savedData);
      setBankBalance(data.bankBalance || 50000);
      setCashBalance(data.cashBalance || 0);
      setCategories(data.categories || categories);
      setTransactions(data.transactions || []);
      setNextCategoryId(data.nextCategoryId || 4);
    }
  }, []);

  useEffect(() => {
    const data = {
      bankBalance,
      cashBalance,
      categories,
      transactions,
      nextCategoryId
    };
    localStorage.setItem('budgetTrackerWorkingV23', JSON.stringify(data));
  }, [bankBalance, cashBalance, categories, transactions, nextCategoryId]);

  const formatCurrency = (amount) => {
    return `රු ${amount.toLocaleString('si-LK')}`;
  };

  const openModal = (type) => {
    setCurrentModalType(type);
    if (type === 'add-category') {
      setCategoryModalVisible(true);
    } else {
      setModalVisible(true);
    }
  };

  const closeAllModals = () => {
    setModalVisible(false);
    setCategoryModalVisible(false);
    setDetailsModalVisible(false);
    setEditingCategory(null);
    setAmount('');
    setDescription('');
    setSelectedCategory(null);
    setCategoryName('');
    setCategoryTarget('');
    setCategoryUnitPrice('');
  };

  const showCategoryDetails = (categoryId) => {
    setViewingCategoryId(categoryId);
    setDetailsModalVisible(true);
  };

  const editCategory = (categoryId) => {
    const category = categories.find(cat => cat.id === categoryId);
    if (category) {
      setEditingCategory(category);
      setCategoryName(category.name);
      setCategoryTarget(category.target.toString());
      setCategoryUnitPrice(category.unitPrice.toString());
      setCategoryModalVisible(true);
    }
  };

  const confirmDeleteCategory = (categoryId) => {
    const category = categories.find(cat => cat.id === categoryId);
    if (!category) return;

    const categoryTransactions = transactions.filter(t => 
      t.category && t.category.id === categoryId
    );

    if (window.confirm(
      `"${category.name}" කාණ්ඩය මකන්න අවශ්‍යද?` + 
      (categoryTransactions.length > 0 ? 
        `\\n\\nසටහන: මෙම කාණ්ඩයට අදාළ ${categoryTransactions.length} ගනුදෙනු මකා දමනු ලැබේ.` : '')
    )) {
      deleteCategory(categoryId);
    }
  };

  const deleteCategory = (categoryId) => {
    const updatedCategories = categories.filter(cat => cat.id !== categoryId);
    setCategories(updatedCategories);
    
    const updatedTransactions = transactions.filter(t => 
      !t.category || t.category.id !== categoryId
    );
    setTransactions(updatedTransactions);
    
    alert('කාණ්ඩය සාර්ථකව මකා දමන ලදී');
  };

  const handleTransactionSubmit = (e) => {
    e.preventDefault();
    const amountNum = parseFloat(amount);
    
    if (isNaN(amountNum) || amountNum <= 0) {
      alert('වලංගු මුදලක් ඇතුළත් කරන්න');
      return;
    }
    
    if (currentModalType === 'income' && amountNum > bankBalance) {
      alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ' + formatCurrency(bankBalance));
      return;
    }
    
    if (currentModalType === 'expense' && amountNum > cashBalance) {
      alert('මුදල් ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ' + formatCurrency(cashBalance));
      return;
    }
    
    if (currentModalType === 'expense' && !selectedCategory) {
      alert('කාණ්ඩයක් තෝරන්න');
      return;
    }

    const now = new Date();
    const dateString = now.toLocaleString('si-LK');
    const timestamp = now.getTime();

    const transaction = {
      id: timestamp,
      type: currentModalType,
      amount: amountNum,
      category: selectedCategory ? {...selectedCategory} : null,
      description,
      date: dateString,
      timestamp
    };

    if (currentModalType === 'bank-deposit') {
      setBankBalance(prev => prev + amountNum);
    } else if (currentModalType === 'income') {
      setBankBalance(prev => prev - amountNum);
      setCashBalance(prev => prev + amountNum);
    } else if (currentModalType === 'expense') {
      setCashBalance(prev => prev - amountNum);
      
      if (selectedCategory) {
        const updatedCategories = categories.map(cat => {
          if (cat.id === selectedCategory.id) {
            return {
              ...cat,
              balance: cat.balance + amountNum,
              spent: cat.spent + amountNum
            };
          }
          return cat;
        });
        setCategories(updatedCategories);
      }
    }

    setTransactions(prev => [transaction, ...prev]);
    closeAllModals();
    alert('ගනුදෙනුව සාර්ථකව සටහන් කරන ලදී');
  };

  const handleCategorySubmit = (e) => {
    e.preventDefault();
    
    if (!categoryName.trim()) {
      alert('කාණ්ඩයේ නම ඇතුළත් කරන්න');
      return;
    }
    
    const targetNum = parseFloat(categoryTarget);
    const unitPriceNum = parseFloat(categoryUnitPrice);
    
    if (isNaN(targetNum) || targetNum <= 0) {
      alert('වලංගු ගෝලයක් ඇතුළත් කරන්න');
      return;
    }
    
    if (isNaN(unitPriceNum) || unitPriceNum <= 0) {
      alert('වලංගු ඒකක මිලක් ඇතුළත් කරන්න');
      return;
    }
    
    if (editingCategory) {
      const updatedCategories = categories.map(cat => 
        cat.id === editingCategory.id ? { ...cat, name: categoryName.trim(), target: targetNum, unitPrice: unitPriceNum } : cat
      );
      setCategories(updatedCategories);
      alert('කාණ්ඩය සාර්ථකව update කරන ලදී');
    } else {
      const newCategory = {
        id: nextCategoryId,
        name: categoryName.trim(),
        balance: 0,
        target: targetNum,
        spent: 0,
        unitPrice: unitPriceNum
      };
      setCategories(prev => [...prev, newCategory]);
      setNextCategoryId(prev => prev + 1);
      alert('නව කාණ්ඩය සාර්ථකව එකතු කරන ලදී');
    }
    
    closeAllModals();
  };

  const getModalTitle = () => {
    switch (currentModalType) {
      case 'bank-deposit': return 'බැංකුවට තැන්පත් කරන්න';
      case 'income': return 'මුදල් ලබාගැනීම';
      case 'expense': return 'වියදම් කරන්න';
      default: return 'ගනුදෙනුව';
    }
  };

  const getInfoText = () => {
    switch (currentModalType) {
      case 'bank-deposit': 
        return 'බැංකු ශේෂය වැඩි කරන්න සඳහා මුදල් තැන්පත් කරන්න. Salary, bonus, හෝ වෙනත් ආදායම් වලට භාවිතා කරන්න.';
      case 'income': 
        return `බැංකු ශේෂයෙන් cash වලට මුදල් transfer කරන්න. දැනට බැංකු ශේෂය: ${formatCurrency(bankBalance)}`;
      case 'expense': 
        return `Cash ශේෂයෙන් වියදම් කරන්න. දැනට cash ශේෂය: ${formatCurrency(cashBalance)}`;
      default: return '';
    }
  };

  return (
    <div className="app">
      <header className="header">
        <div>
          <h1 className="header-title">මුදල් කළමනාකරණ</h1>
          <p className="version">v2.3 - Working Version</p>
        </div>
        <span className="header-icon">💰</span>
      </header>
      
      <main className="content">
        <div className="balance-container">
          <div className={`balance-card ${bankBalance < 0 ? 'negative' : 'bank'}`}>
            <button className="deposit-btn" onClick={() => openModal('bank-deposit')}>+</button>
            <p className="balance-label">බැංකු ශේෂය</p>
            <p className="balance-amount">{formatCurrency(bankBalance)}</p>
          </div>
          <div className={`balance-card ${cashBalance < 0 ? 'negative' : 'cash'}`}>
            <p className="balance-label">මුදල් ශේෂය</p>
            <p className="balance-amount">{formatCurrency(cashBalance)}</p>
          </div>
        </div>
        
        <div className="action-buttons">
          <button className="action-button bank-deposit" onClick={() => openModal('bank-deposit')}>
            🏦 බැංකුවට තැන්පත් කරන්න
          </button>
          <button className="action-button income" onClick={() => openModal('income')}>
            ⬇️ මුදල් ලබාගැනීම
          </button>
          <button className="action-button expense" onClick={() => openModal('expense')}>
            ⬆️ වියදම් කරන්න
          </button>
          <button className="action-button category" onClick={() => openModal('add-category')}>
            ➕ කාණ්ඩ කළමනාකරණය
          </button>
        </div>
        
        <section className="section">
          <div className="section-header">
            <h2 className="section-title">
              වියදම් කාණ්ඩ <span className="click-hint">(Click කරන්න)</span>
            </h2>
            <button className="add-button" onClick={() => openModal('add-category')}>
              ➕ කාණ්ඩයක් එකතු කරන්න
            </button>
          </div>
          
          {categories.length === 0 ? (
            <div className="empty-state">
              <p>කාණ්ඩ නොමැත. "කාණ්ඩයක් එකතු කරන්න" click කරන්න.</p>
            </div>
          ) : (
            categories.map(category => {
              const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
              const remaining = Math.max(0, category.target - category.spent);
              
              return (
                <div key={category.id} className="category-card" onClick={() => showCategoryDetails(category.id)}>
                  <div className="click-hint-badge">CLICK</div>
                  
                  <div className="category-header">
                    <h3 className="category-name">{category.name}</h3>
                    <div className="category-actions">
                      <button onClick={(e) => { e.stopPropagation(); editCategory(category.id); }} className="edit-btn">
                        ✏️
                      </button>
                      <button onClick={(e) => { e.stopPropagation(); confirmDeleteCategory(category.id); }} className="delete-btn">
                        🗑️
                      </button>
                    </div>
                  </div>
                  
                  <div className="category-balance-row">
                    <span className="category-balance">{formatCurrency(category.balance)}</span>
                    <span className="category-target">ගෝලය: {formatCurrency(category.target)}</span>
                  </div>
                  
                  <p className="category-spent">
                    වියදම්: {formatCurrency(category.spent)} / {formatCurrency(category.target)}
                  </p>
                  
                  <div className="progress-bar">
                    <div 
                      className={`progress-fill ${progressPercentage > 100 ? 'overflow' : ''}`}
                      style={{ width: `${Math.min(progressPercentage, 100)}%` }}
                    />
                  </div>
                  
                  <div className="category-footer">
                    <span className="progress-text">{progressPercentage.toFixed(1)}%</span>
                    <span className="unit-price">ඒකක මිල: {formatCurrency(category.unitPrice)}</span>
                  </div>
                  
                  <p className="remaining-text">
                    ඉතිරි: {formatCurrency(remaining)}
                  </p>
                  
                  <p className="click-hint-bottom">
                    📊 විස්තර බැලීමට click කරන්න
                  </p>
                </div>
              );
            })
          )}
        </section>
        
        <section className="section">
          <h2 className="section-title">මෑත ගනුදෙනු</h2>
          
          {transactions.length === 0 ? (
            <div className="empty-state">
              <p>ගනුදෙනු නොමැත</p>
            </div>
          ) : (
            transactions.slice(0, 10).map(transaction => {
              let icon, amountClass, sign;
              
              if (transaction.type === 'bank-deposit') {
                icon = '🏦';
                amountClass = 'deposit-amount';
                sign = '+';
              } else if (transaction.type === 'income') {
                icon = '⬇️';
                amountClass = 'income-amount';
                sign = '+';
              } else {
                icon = '⬆️';
                amountClass = 'expense-amount';
                sign = '-';
              }
              
              let desc;
              if (transaction.type === 'bank-deposit') {
                desc = 'බැංකුවට තැන්පත් කිරීම';
              } else if (transaction.type === 'income') {
                desc = 'මුදල් ලබාගැනීම';
              } else {
                desc = transaction.category?.name || 'වියදම';
              }
              
              if (transaction.description) {
                desc = transaction.description;
              }
              
              return (
                <div key={transaction.id} className="transaction-item">
                  <div className="transaction-icon">{icon}</div>
                  <div className="transaction-details">
                    <p className="transaction-description">{desc}</p>
                    <p className="transaction-date">{transaction.date}</p>
                  </div>
                  <span className={`transaction-amount ${amountClass}`}>
                    {sign}{formatCurrency(transaction.amount)}
                  </span>
                </div>
              );
            })
          )}
        </section>
      </main>
      
      {/* Transaction Modal */}
      {modalVisible && (
        <div className="modal-overlay" onClick={closeAllModals}>
          <div className="modal-content" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <h3>{getModalTitle()}</h3>
              <button onClick={closeAllModals} className="close-btn">&times;</button>
            </div>
            
            <div className="info-box">{getInfoText()}</div>
            
            <form onSubmit={handleTransactionSubmit}>
              <label>
                මුදල (රු)
                <input
                  type="number"
                  placeholder="මුදල ඇතුළත් කරන්න"
                  value={amount}
                  onChange={(e) => setAmount(e.target.value)}
                  required
                />
              </label>
              
              <label>
                විස්තරය (අමතර)
                <input
                  type="text"
                  placeholder="විස්තරය ඇතුළත් කරන්න"
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                />
              </label>
              
              {currentModalType === 'expense' && (
                <div>
                  <label>කාණ්ඩය තෝරන්න:</label>
                  <div className="category-selector">
                    {categories.map(category => (
                      <div
                        key={category.id}
                        className={`category-option ${selectedCategory?.id === category.id ? 'selected' : ''}`}
                        onClick={() => setSelectedCategory(category)}
                      >
                        <div>
                          <p>{category.name}</p>
                          <p className="category-option-subtext">
                            ගෝලය: {formatCurrency(category.target)} | ඉතිරි: {formatCurrency(Math.max(0, category.target - category.spent))}
                          </p>
                        </div>
                        <p className="category-option-subtext">
                          {formatCurrency(category.spent)} / {formatCurrency(category.target)}
                        </p>
                      </div>
                    ))}
                  </div>
                </div>
              )}
              
              <button type="submit" className={`submit-button ${currentModalType === 'bank-deposit' ? 'deposit' : ''}`}>
                සේව් කරන්න
              </button>
            </form>
          </div>
        </div>
      )}
      
      {/* Category Modal */}
      {categoryModalVisible && (
        <div className="modal-overlay" onClick={closeAllModals}>
          <div className="modal-content" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <h3>{editingCategory ? 'කාණ්ඩය සංස්කරණය කරන්න' : 'නව කාණ්ඩයක් එකතු කරන්න'}</h3>
              <button onClick={closeAllModals} className="close-btn">&times;</button>
            </div>
            
            <form onSubmit={handleCategorySubmit}>
              <label>
                කාණ්ඩයේ නම
                <input
                  type="text"
                  placeholder="කාණ්ඩයේ නම ඇතුළත් කරන්න"
                  value={categoryName}
                  onChange={(e) => setCategoryName(e.target.value)}
                  required
                />
              </label>
              
              <label>
                ගෝලය (රු)
                <input
                  type="number"
                  placeholder="ගෝලය ඇතුළත් කරන්න"
                  value={categoryTarget}
                  onChange={(e) => setCategoryTarget(e.target.value)}
                  required
                />
              </label>
              
              <label>
                ඒකක මිල (රු)
                <input
                  type="number"
                  placeholder="ඒකක මිල ඇතුළත් කරන්න"
                  value={categoryUnitPrice}
                  onChange={(e) => setCategoryUnitPrice(e.target.value)}
                  required
                />
              </label>
              
              <button type="submit" className="submit-button">
                {editingCategory ? 'Update කරන්න' : 'එකතු කරන්න'}
              </button>
            </form>
          </div>
        </div>
      )}
      
      {/* Category Details Modal */}
      {detailsModalVisible && (
        <div className="modal-overlay" onClick={closeAllModals}>
          <div className="modal-content" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <h3>{categories.find(cat => cat.id === viewingCategoryId)?.name}</h3>
              <button onClick={closeAllModals} className="close-btn">&times;</button>
            </div>
            
            {(() => {
              const category = categories.find(cat => cat.id === viewingCategoryId);
              if (!category) return null;
              
              const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
              const remaining = Math.max(0, category.target - category.spent);
              const categoryTransactions = transactions.filter(t => 
                t.category && t.category.id === viewingCategoryId
              );
              
              return (
                <div>
                  <div className="category-card">
                    <div className="category-balance-row">
                      <span className="category-balance">{formatCurrency(category.balance)}</span>
                      <span className="category-target">ගෝලය: {formatCurrency(category.target)}</span>
                    </div>
                    
                    <p className="category-spent">
                      වියදම්: {formatCurrency(category.spent)} / {formatCurrency(category.target)}
                    </p>
                    
                    <div className="progress-bar">
                      <div 
                        className={`progress-fill ${progressPercentage > 100 ? 'overflow' : ''}`}
                        style={{ width: `${Math.min(progressPercentage, 100)}%` }}
                      />
                    </div>
                    
                    <div className="category-footer">
                      <span className="progress-text">{progressPercentage.toFixed(1)}%</span>
                      <span className="unit-price">ඒකක මිල: {formatCurrency(category.unitPrice)}</span>
                    </div>
                    
                    <p className="remaining-text">
                      ඉතිරි: {formatCurrency(remaining)}
                    </p>
                  </div>
                  
                  <h4>ගනුදෙනු ඉතිහාසය</h4>
                  
                  <div className="transaction-history">
                    {categoryTransactions.length === 0 ? (
                      <div className="empty-state">
                        <p>මෙම කාණ්ඩයට ගනුදෙනු නොමැත</p>
                      </div>
                    ) : (
                      categoryTransactions.map(transaction => (
                        <div key={transaction.id} className="transaction-item">
                          <div className="transaction-icon">⬆️</div>
                          <div className="transaction-details">
                            <p className="transaction-description">{transaction.description || transaction.category?.name}</p>
                            <p className="transaction-date">{transaction.date}</p>
                          </div>
                          <span className="transaction-amount expense-amount">
                            -{formatCurrency(transaction.amount)}
                          </span>
                        </div>
                      ))
                    )}
                  </div>
                </div>
              );
            })()}
          </div>
        </div>
      )}
    </div>
  );
};

export default FinanceApp;