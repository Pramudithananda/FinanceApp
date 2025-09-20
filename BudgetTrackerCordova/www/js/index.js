// App State
let appState = {
    bankBalance: 50000,
    cashBalance: 0,
    categories: [
        { id: 1, name: 'පෑන් මිලදී ගැනීම්', balance: 0, target: 10000, spent: 0, unitPrice: 100 },
        { id: 2, name: 'කෑම', balance: 0, target: 15000, spent: 0, unitPrice: 200 },
        { id: 3, name: 'ප්‍රවාහන', balance: 0, target: 8000, spent: 0, unitPrice: 50 }
    ],
    transactions: [],
    nextCategoryId: 4,
    currentModalType: '',
    selectedCategory: null,
    editingCategory: null
};

// Initialize app
document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
    console.log('Device is ready');
    loadData();
    renderApp();
}

// Load data from localStorage
function loadData() {
    const savedData = localStorage.getItem('budgetTrackerData');
    if (savedData) {
        const data = JSON.parse(savedData);
        appState = { ...appState, ...data };
    }
}

// Save data to localStorage
function saveData() {
    localStorage.setItem('budgetTrackerData', JSON.stringify(appState));
}

// Format currency
function formatCurrency(amount) {
    return `රු ${amount.toLocaleString('si-LK')}`;
}

// Render the entire app
function renderApp() {
    updateBalances();
    renderCategories();
    renderTransactions();
}

// Update balance displays
function updateBalances() {
    document.getElementById('bankBalance').textContent = formatCurrency(appState.bankBalance);
    document.getElementById('cashBalance').textContent = formatCurrency(appState.cashBalance);
}

// Render categories
function renderCategories() {
    const categoriesList = document.getElementById('categoriesList');
    
    if (appState.categories.length === 0) {
        categoriesList.innerHTML = `
            <div class="empty-state">
                <p>කාණ්ඩ නොමැත. "කාණ්ඩයක් එකතු කරන්න" tap කරන්න.</p>
            </div>
        `;
        return;
    }
    
    categoriesList.innerHTML = appState.categories.map(category => {
        const progressPercentage = category.target > 0 ? (category.spent / category.target) * 100 : 0;
        const remaining = Math.max(0, category.target - category.spent);
        
        return `
            <div class="category-card" onclick="showCategoryDetails(${category.id})">
                <div class="category-header">
                    <div class="category-name">${category.name}</div>
                    <div class="category-actions">
                        <span class="edit-btn" onclick="event.stopPropagation(); editCategory(${category.id})">✏️</span>
                        <span class="delete-btn" onclick="event.stopPropagation(); deleteCategory(${category.id})">🗑️</span>
                    </div>
                </div>
                <div class="category-balance-row">
                    <div class="category-balance">${formatCurrency(category.balance)}</div>
                    <div class="category-target">ගෝලය: ${formatCurrency(category.target)}</div>
                </div>
                <div class="category-spent">
                    වියදම්: ${formatCurrency(category.spent)} / ${formatCurrency(category.target)}
                </div>
                <div class="progress-bar">
                    <div class="progress-fill ${progressPercentage > 100 ? 'progress-overflow' : ''}" 
                         style="width: ${Math.min(progressPercentage, 100)}%"></div>
                </div>
                <div class="category-footer">
                    <div class="progress-text">${progressPercentage.toFixed(1)}%</div>
                    <div class="unit-price">ඒකක මිල: ${formatCurrency(category.unitPrice)}</div>
                </div>
                <div class="remaining-text">ඉතිරි: ${formatCurrency(remaining)}</div>
            </div>
        `;
    }).join('');
}

// Render transactions
function renderTransactions() {
    const transactionsList = document.getElementById('transactionsList');
    
    if (appState.transactions.length === 0) {
        transactionsList.innerHTML = `
            <div class="empty-state">
                <p>ගනුදෙනු නොමැත</p>
            </div>
        `;
        return;
    }
    
    transactionsList.innerHTML = appState.transactions.slice(0, 10).map(transaction => {
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
        
        let description;
        if (transaction.type === 'bank-deposit') {
            description = 'බැංකුවට තැන්පත් කිරීම';
        } else if (transaction.type === 'income') {
            description = 'මුදල් ලබාගැනීම';
        } else {
            description = transaction.category?.name || 'වියදම';
        }
        
        if (transaction.description) {
            description = transaction.description;
        }
        
        return `
            <div class="transaction-item">
                <div class="transaction-icon">${icon}</div>
                <div class="transaction-details">
                    <div class="transaction-description">${description}</div>
                    <div class="transaction-date">${transaction.date}</div>
                </div>
                <div class="transaction-amount ${amountClass}">
                    ${sign}${formatCurrency(transaction.amount)}
                </div>
            </div>
        `;
    }).join('');
}

// Open modal
function openModal(type) {
    appState.currentModalType = type;
    
    if (type === 'add-category') {
        document.getElementById('categoryModalTitle').textContent = 'නව කාණ්ඩය එකතු කරන්න';
        document.getElementById('categoryModal').style.display = 'flex';
    } else {
        const modal = document.getElementById('transactionModal');
        const title = document.getElementById('modalTitle');
        const infoBox = document.getElementById('infoBox');
        const categorySelector = document.getElementById('categorySelector');
        
        // Set title and info
        switch (type) {
            case 'bank-deposit':
                title.textContent = 'බැංකුවට තැන්පත් කරන්න';
                infoBox.textContent = 'බැංකු ශේෂය වැඩි කරන්න සඳහා මුදල් තැන්පත් කරන්න. Salary, bonus, හෝ වෙනත් ආදායම් වලට භාවිතා කරන්න.';
                break;
            case 'income':
                title.textContent = 'මුදල් ලබාගැනීම';
                infoBox.textContent = `බැංකු ශේෂයෙන් cash වලට මුදල් transfer කරන්න. දැනට බැංකු ශේෂය: ${formatCurrency(appState.bankBalance)}`;
                break;
            case 'expense':
                title.textContent = 'වියදම් කරන්න';
                infoBox.textContent = `Cash ශේෂයෙන් වියදම් කරන්න. දැනට cash ශේෂය: ${formatCurrency(appState.cashBalance)}`;
                break;
        }
        
        // Show/hide category selector
        if (type === 'expense') {
            categorySelector.style.display = 'block';
            renderCategoryOptions();
        } else {
            categorySelector.style.display = 'none';
        }
        
        modal.style.display = 'flex';
    }
    
    // Clear inputs
    clearInputs();
}

// Close modal
function closeModal() {
    document.getElementById('transactionModal').style.display = 'none';
    document.getElementById('categoryModal').style.display = 'none';
    appState.selectedCategory = null;
    appState.editingCategory = null;
    clearInputs();
}

// Clear input fields
function clearInputs() {
    document.getElementById('amountInput').value = '';
    document.getElementById('descriptionInput').value = '';
    document.getElementById('categoryNameInput').value = '';
    document.getElementById('categoryTargetInput').value = '';
    document.getElementById('categoryUnitPriceInput').value = '';
}

// Render category options for expense modal
function renderCategoryOptions() {
    const categoryOptions = document.getElementById('categoryOptions');
    categoryOptions.innerHTML = appState.categories.map(category => {
        const remaining = Math.max(0, category.target - category.spent);
        return `
            <div class="category-option" onclick="selectCategory(${category.id})">
                <div>
                    <div>${category.name}</div>
                    <div class="category-option-subtext">
                        ගෝලය: ${formatCurrency(category.target)} | ඉතිරි: ${formatCurrency(remaining)}
                    </div>
                </div>
                <div class="category-option-subtext">
                    ${formatCurrency(category.spent)} / ${formatCurrency(category.target)}
                </div>
            </div>
        `;
    }).join('');
}

// Select category
function selectCategory(categoryId) {
    // Remove previous selection
    document.querySelectorAll('.category-option').forEach(option => {
        option.classList.remove('selected');
    });
    
    // Add selection to clicked option
    event.target.closest('.category-option').classList.add('selected');
    
    appState.selectedCategory = appState.categories.find(cat => cat.id === categoryId);
}

// Submit transaction
function submitTransaction() {
    const amount = parseFloat(document.getElementById('amountInput').value);
    const description = document.getElementById('descriptionInput').value;
    const type = appState.currentModalType;
    
    if (isNaN(amount) || amount <= 0) {
        alert('වලංගු මුදලක් ඇතුළත් කරන්න');
        return;
    }
    
    if (type === 'income' && amount > appState.bankBalance) {
        alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ' + formatCurrency(appState.bankBalance));
        return;
    }
    
    if (type === 'expense' && amount > appState.cashBalance) {
        alert('මුදල් ශේෂය ප්‍රමාණවත් නොවේ. දැනට ඇති ශේෂය: ' + formatCurrency(appState.cashBalance));
        return;
    }
    
    if (type === 'expense' && !appState.selectedCategory) {
        alert('කාණ්ඩයක් තෝරන්න');
        return;
    }
    
    // Create transaction
    const now = new Date();
    const transaction = {
        id: now.getTime(),
        type,
        amount,
        category: appState.selectedCategory ? { ...appState.selectedCategory } : null,
        description,
        date: now.toLocaleString('si-LK'),
        timestamp: now.getTime()
    };
    
    // Update balances and categories
    if (type === 'bank-deposit') {
        appState.bankBalance += amount;
    } else if (type === 'income') {
        appState.bankBalance -= amount;
        appState.cashBalance += amount;
    } else if (type === 'expense') {
        appState.cashBalance -= amount;
        
        if (appState.selectedCategory) {
            const categoryIndex = appState.categories.findIndex(cat => cat.id === appState.selectedCategory.id);
            if (categoryIndex !== -1) {
                appState.categories[categoryIndex].balance += amount;
                appState.categories[categoryIndex].spent += amount;
            }
        }
    }
    
    // Add transaction
    appState.transactions.unshift(transaction);
    
    // Save and render
    saveData();
    renderApp();
    closeModal();
    
    alert('සාර්ථකයි - ගනුදෙනුව සාර්ථකව සටහන් කරන ලදී');
}

// Submit category
function submitCategory() {
    const name = document.getElementById('categoryNameInput').value.trim();
    const target = parseFloat(document.getElementById('categoryTargetInput').value);
    const unitPrice = parseFloat(document.getElementById('categoryUnitPriceInput').value);
    
    if (!name) {
        alert('කාණ්ඩයේ නම ඇතුළත් කරන්න');
        return;
    }
    
    if (isNaN(target) || target <= 0) {
        alert('වලංගු ගෝලයක් ඇතුළත් කරන්න');
        return;
    }
    
    if (isNaN(unitPrice) || unitPrice <= 0) {
        alert('වලංගු ඒකක මිලක් ඇතුළත් කරන්න');
        return;
    }
    
    const newCategory = {
        id: appState.nextCategoryId++,
        name,
        balance: 0,
        target,
        spent: 0,
        unitPrice
    };
    
    appState.categories.push(newCategory);
    
    saveData();
    renderApp();
    closeModal();
    
    alert('සාර්ථකයි - නව කාණ්ඩය සාර්ථකව එකතු කරන ලදී');
}

// Show category details
function showCategoryDetails(categoryId) {
    const category = appState.categories.find(cat => cat.id === categoryId);
    if (category) {
        const transactions = appState.transactions.filter(t => t.category && t.category.id === categoryId);
        alert(`කාණ්ඩය: ${category.name}\nගෝලය: ${formatCurrency(category.target)}\nවියදම්: ${formatCurrency(category.spent)}\nගනුදෙනු: ${transactions.length}`);
    }
}

// Edit category
function editCategory(categoryId) {
    const category = appState.categories.find(cat => cat.id === categoryId);
    if (category) {
        appState.editingCategory = category;
        document.getElementById('categoryModalTitle').textContent = 'කාණ්ඩය Edit කරන්න';
        document.getElementById('categoryNameInput').value = category.name;
        document.getElementById('categoryTargetInput').value = category.target;
        document.getElementById('categoryUnitPriceInput').value = category.unitPrice;
        document.getElementById('categoryModal').style.display = 'flex';
    }
}

// Delete category
function deleteCategory(categoryId) {
    const category = appState.categories.find(cat => cat.id === categoryId);
    if (category) {
        const categoryTransactions = appState.transactions.filter(t => t.category && t.category.id === categoryId);
        
        if (confirm(`"${category.name}" කාණ්ඩය මකන්න අවශ්‍යද?` + 
                   (categoryTransactions.length > 0 ? 
                    `\n\nසටහන: මෙම කාණ්ඩයට අදාළ ${categoryTransactions.length} ගනුදෙනු මකා දමනු ලැබේ.` : ''))) {
            
            appState.categories = appState.categories.filter(cat => cat.id !== categoryId);
            appState.transactions = appState.transactions.filter(t => !t.category || t.category.id !== categoryId);
            
            saveData();
            renderApp();
            alert('සාර්ථකයි - කාණ්ඩය සාර්ථකව මකා දමන ලදී');
        }
    }
}

// Close modal when clicking outside
window.onclick = function(event) {
    const transactionModal = document.getElementById('transactionModal');
    const categoryModal = document.getElementById('categoryModal');
    
    if (event.target === transactionModal) {
        closeModal();
    }
    if (event.target === categoryModal) {
        closeModal();
    }
}

// Initialize app when page loads (for web testing)
if (typeof cordova === 'undefined') {
    onDeviceReady();
}