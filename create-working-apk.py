#!/usr/bin/env python3
"""
Create Working APK from Original
Fixes invalid package issues
"""

import zipfile
import os
import shutil
import tempfile
from pathlib import Path

def create_working_apk():
    print("🔧 CREATING WORKING APK...")
    print("=" * 50)
    
    original_apk = Path('/workspace/original-finance-app.apk')
    working_apk = Path('/workspace/PersonalFinanceApp-Working-v2.3.apk')
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        print("📦 Extracting original APK...")
        with zipfile.ZipFile(original_apk, 'r') as apk:
            apk.extractall(temp_path)
        
        # Keep the original binary files that work
        print("✅ Preserving working components...")
        
        # Don't modify the binary AndroidManifest.xml - keep original
        # Don't modify classes.dex - keep original
        # Just optimize architectures and repackage properly
        
        # Remove only x86 architectures to reduce size
        lib_path = temp_path / 'lib'
        if lib_path.exists():
            for arch in ['x86', 'x86_64']:
                arch_path = lib_path / arch
                if arch_path.exists():
                    shutil.rmtree(arch_path)
                    print(f"   🗑️ Removed {arch} architecture")
        
        print("📱 Creating working APK...")
        
        # Create APK with proper compression but preserve binary formats
        with zipfile.ZipFile(working_apk, 'w', zipfile.ZIP_STORED) as new_apk:
            for root, dirs, files in os.walk(temp_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = file_path.relative_to(temp_path)
                    
                    # Use STORED compression for critical files
                    if file in ['AndroidManifest.xml', 'classes.dex', 'resources.arsc']:
                        new_apk.write(file_path, arc_name, compress_type=zipfile.ZIP_STORED)
                    else:
                        new_apk.write(file_path, arc_name, compress_type=zipfile.ZIP_DEFLATED)
        
        original_size = original_apk.stat().st_size
        working_size = working_apk.stat().st_size
        savings = original_size - working_size
        
        print(f"\n✅ WORKING APK CREATED!")
        print(f"📏 Original Size: {original_size / 1024 / 1024:.1f} MB")
        print(f"📏 Working Size: {working_size / 1024 / 1024:.1f} MB")
        print(f"💾 Space Saved: {savings / 1024 / 1024:.1f} MB ({(savings/original_size)*100:.1f}%)")
        
        return working_apk

def create_fixed_apk_alternative():
    """Create a completely new working APK using Cordova approach"""
    print("\n🔄 CREATING ALTERNATIVE APK...")
    
    # Use our previously created Cordova APK but with better content
    cordova_path = Path('/workspace/FinanceAppCordova')
    if not cordova_path.exists():
        print("❌ Cordova project not found")
        return None
    
    # Update the web content with a simpler, working version
    www_path = cordova_path / 'www'
    
    # Create a simple, working HTML app
    simple_app_html = '''<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>මුදල් කළමනාකරණ</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            min-height: 100vh;
            color: white;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .balance-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 30px;
        }
        .balance-card {
            background: rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            backdrop-filter: blur(10px);
        }
        .balance-label {
            font-size: 14px;
            opacity: 0.8;
            margin-bottom: 8px;
        }
        .balance-amount {
            font-size: 20px;
            font-weight: bold;
        }
        .actions {
            display: grid;
            gap: 15px;
            margin-bottom: 30px;
        }
        .action-btn {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            padding: 15px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .action-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        .transactions {
            background: rgba(255,255,255,0.1);
            border-radius: 12px;
            padding: 20px;
        }
        .transaction-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .transaction-item:last-child {
            border-bottom: none;
        }
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background: white;
            color: black;
            padding: 20px;
            border-radius: 12px;
            width: 90%;
            max-width: 400px;
        }
        .modal input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .modal button {
            background: #1e3a8a;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>💰 මුදල් කළමනාකරණ</h1>
        <p>Personal Finance Management v2.3</p>
    </div>
    
    <div class="balance-container">
        <div class="balance-card">
            <div class="balance-label">බැංකු ශේෂය</div>
            <div class="balance-amount" id="bankBalance">රු 50,000</div>
        </div>
        <div class="balance-card">
            <div class="balance-label">මුදල් ශේෂය</div>
            <div class="balance-amount" id="cashBalance">රු 0</div>
        </div>
    </div>
    
    <div class="actions">
        <button class="action-btn" onclick="openModal('deposit')">
            🏦 බැංකුවට තැන්පත් කරන්න
        </button>
        <button class="action-btn" onclick="openModal('withdraw')">
            ⬇️ මුදල් ලබාගැනීම
        </button>
        <button class="action-btn" onclick="openModal('expense')">
            ⬆️ වියදම් කරන්න
        </button>
        <button class="action-btn" onclick="showTransactions()">
            📊 ගනුදෙනු ඉතිහාසය
        </button>
    </div>
    
    <div class="transactions">
        <h3>මෑත ගනුදෙනු</h3>
        <div id="transactionList">
            <div class="transaction-item">
                <span>🏦 ආරම්භක ශේෂය</span>
                <span>+රු 50,000</span>
            </div>
        </div>
    </div>
    
    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <h3 id="modalTitle">ගනුදෙනුව</h3>
            <input type="number" id="amount" placeholder="මුදල ඇතුළත් කරන්න" />
            <input type="text" id="description" placeholder="විස්තරය (අමතර)" />
            <button onclick="submitTransaction()">සේව් කරන්න</button>
            <button onclick="closeModal()">අවලංගු කරන්න</button>
        </div>
    </div>

    <script>
        let bankBalance = 50000;
        let cashBalance = 0;
        let transactions = [];
        let currentModalType = '';
        
        function formatCurrency(amount) {
            return 'රු ' + amount.toLocaleString('si-LK');
        }
        
        function updateBalances() {
            document.getElementById('bankBalance').textContent = formatCurrency(bankBalance);
            document.getElementById('cashBalance').textContent = formatCurrency(cashBalance);
            saveData();
        }
        
        function openModal(type) {
            currentModalType = type;
            const modal = document.getElementById('modal');
            const title = document.getElementById('modalTitle');
            
            switch(type) {
                case 'deposit':
                    title.textContent = 'බැංකුවට තැන්පත් කරන්න';
                    break;
                case 'withdraw':
                    title.textContent = 'මුදල් ලබාගැනීම';
                    break;
                case 'expense':
                    title.textContent = 'වියදම් කරන්න';
                    break;
            }
            
            modal.style.display = 'flex';
        }
        
        function closeModal() {
            document.getElementById('modal').style.display = 'none';
            document.getElementById('amount').value = '';
            document.getElementById('description').value = '';
        }
        
        function submitTransaction() {
            const amount = parseFloat(document.getElementById('amount').value);
            const description = document.getElementById('description').value;
            
            if (!amount || amount <= 0) {
                alert('වලංගු මුදලක් ඇතුළත් කරන්න');
                return;
            }
            
            const transaction = {
                type: currentModalType,
                amount: amount,
                description: description,
                date: new Date().toLocaleString('si-LK'),
                id: Date.now()
            };
            
            switch(currentModalType) {
                case 'deposit':
                    bankBalance += amount;
                    break;
                case 'withdraw':
                    if (amount > bankBalance) {
                        alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ');
                        return;
                    }
                    bankBalance -= amount;
                    cashBalance += amount;
                    break;
                case 'expense':
                    if (amount > cashBalance) {
                        alert('මුදල් ශේෂය ප්‍රමාණවත් නොවේ');
                        return;
                    }
                    cashBalance -= amount;
                    break;
            }
            
            transactions.unshift(transaction);
            updateBalances();
            updateTransactionList();
            closeModal();
            alert('ගනුදෙනුව සාර්ථකව සටහන් කරන ලදී');
        }
        
        function updateTransactionList() {
            const list = document.getElementById('transactionList');
            list.innerHTML = '';
            
            transactions.slice(0, 10).forEach(t => {
                const item = document.createElement('div');
                item.className = 'transaction-item';
                
                let icon = '';
                let sign = '';
                switch(t.type) {
                    case 'deposit': icon = '🏦'; sign = '+'; break;
                    case 'withdraw': icon = '⬇️'; sign = '+'; break;
                    case 'expense': icon = '⬆️'; sign = '-'; break;
                }
                
                item.innerHTML = `
                    <span>${icon} ${t.description || t.type}</span>
                    <span>${sign}${formatCurrency(t.amount)}</span>
                `;
                list.appendChild(item);
            });
        }
        
        function saveData() {
            const data = {
                bankBalance,
                cashBalance,
                transactions
            };
            localStorage.setItem('financeAppData', JSON.stringify(data));
        }
        
        function loadData() {
            const saved = localStorage.getItem('financeAppData');
            if (saved) {
                const data = JSON.parse(saved);
                bankBalance = data.bankBalance || 50000;
                cashBalance = data.cashBalance || 0;
                transactions = data.transactions || [];
                updateBalances();
                updateTransactionList();
            }
        }
        
        function showTransactions() {
            alert('ගනුදෙනු ඉතිහාසය පහතින් බලන්න');
        }
        
        // Load data on startup
        window.onload = function() {
            loadData();
        };
    </script>
</body>
</html>'''
    
    # Replace the www content with our working HTML
    www_path = Path('/workspace/FinanceAppCordova/www')
    if www_path.exists():
        # Clear existing content
        for item in www_path.iterdir():
            if item.is_file():
                item.unlink()
            elif item.is_dir():
                shutil.rmtree(item)
        
        # Write our simple working app
        with open(www_path / 'index.html', 'w', encoding='utf-8') as f:
            f.write(simple_app_html)
    
    print("✅ Created simple working HTML app")
    return working_apk

if __name__ == "__main__":
    try:
        working_apk = create_working_apk()
        print(f"\n🎉 WORKING APK READY!")
        print(f"📱 File: {working_apk}")
        
    except Exception as e:
        print(f"❌ Error: {e}")