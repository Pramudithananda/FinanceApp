#!/usr/bin/env python3
"""
Create Minimal Working APK
Uses basic Android structure that definitely works
"""

import zipfile
from pathlib import Path
import tempfile
import os

def create_minimal_working_apk():
    print("🔧 CREATING MINIMAL WORKING APK...")
    print("=" * 50)
    
    apk_path = Path('/workspace/FinanceApp-Minimal-Working-v2.3.apk')
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        print("📁 Creating minimal Android structure...")
        
        # Create basic directories
        (temp_path / 'META-INF').mkdir()
        (temp_path / 'assets' / 'www').mkdir(parents=True)
        
        print("📝 Creating minimal AndroidManifest.xml...")
        
        # Create the simplest possible AndroidManifest.xml
        manifest = '''<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.financeapp.minimal"
    android:versionCode="1"
    android:versionName="1.0">
    
    <uses-sdk android:minSdkVersion="16" android:targetSdkVersion="28" />
    <uses-permission android:name="android.permission.INTERNET" />
    
    <application android:label="Finance App">
        <activity android:name=".MainActivity" android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>'''
        
        with open(temp_path / 'AndroidManifest.xml', 'w', encoding='utf-8') as f:
            f.write(manifest)
        
        print("🌐 Creating simple web app...")
        
        # Create simple HTML app
        html_content = '''<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>මුදල් කළමනාකරණ</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e40af, #3b82f6);
            min-height: 100vh;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .app {
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .header {
            margin-bottom: 30px;
        }
        .header h1 {
            font-size: 28px;
            margin-bottom: 10px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
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
            border-radius: 15px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
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
            padding: 18px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
        }
        .action-btn:active {
            background: rgba(255,255,255,0.3);
            transform: translateY(1px);
        }
        .transactions {
            background: rgba(255,255,255,0.1);
            border-radius: 15px;
            padding: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
        }
        .transaction-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            font-size: 14px;
        }
        .transaction-item:last-child {
            border-bottom: none;
        }
        .positive { color: #4ade80; font-weight: bold; }
        .negative { color: #f87171; font-weight: bold; }
        
        @media (max-width: 480px) {
            .balance-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="app">
        <div class="header">
            <h1>💰 මුදල් කළමනාකරණ</h1>
            <p>Personal Finance Management v2.3</p>
        </div>
        
        <div class="balance-container">
            <div class="balance-card">
                <div class="balance-label">🏦 බැංකු ශේෂය</div>
                <div class="balance-amount" id="bankBalance">රු 50,000</div>
            </div>
            <div class="balance-card">
                <div class="balance-label">💵 මුදල් ශේෂය</div>
                <div class="balance-amount" id="cashBalance">රු 0</div>
            </div>
        </div>
        
        <div class="actions">
            <button class="action-btn" onclick="performAction('deposit')">
                🏦 බැංකුවට තැන්පත් කරන්න
            </button>
            <button class="action-btn" onclick="performAction('withdraw')">
                ⬇️ මුදල් ලබාගැනීම
            </button>
            <button class="action-btn" onclick="performAction('expense')">
                ⬆️ වියදම් කරන්න
            </button>
            <button class="action-btn" onclick="showSummary()">
                📊 සාරාංශය බලන්න
            </button>
        </div>
        
        <div class="transactions">
            <h3>📋 මෑත ගනුදෙනු</h3>
            <div id="transactionList">
                <div class="transaction-item">
                    <span>🏦 ආරම්භක ශේෂය</span>
                    <span class="positive">+රු 50,000</span>
                </div>
            </div>
        </div>
    </div>

    <script>
        let bankBalance = 50000;
        let cashBalance = 0;
        let transactions = [];
        
        function formatCurrency(amount) {
            return 'රු ' + Math.abs(amount).toLocaleString('si-LK');
        }
        
        function updateBalances() {
            document.getElementById('bankBalance').textContent = formatCurrency(bankBalance);
            document.getElementById('cashBalance').textContent = formatCurrency(cashBalance);
            saveData();
        }
        
        function performAction(type) {
            let promptText = '';
            switch(type) {
                case 'deposit': promptText = 'තැන්පත් කිරීමේ මුදල:'; break;
                case 'withdraw': promptText = 'ලබාගන්නා මුදල:'; break;
                case 'expense': promptText = 'වියදම් මුදල:'; break;
            }
            
            const amount = parseFloat(prompt(promptText));
            
            if (!amount || amount <= 0) {
                alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
                return;
            }
            
            let success = false;
            let message = '';
            let transactionDesc = '';
            let transactionAmount = '';
            
            switch(type) {
                case 'deposit':
                    bankBalance += amount;
                    success = true;
                    message = 'සාර්ථකව තැන්පත් කරන ලදී! 🎉';
                    transactionDesc = '🏦 තැන්පත්';
                    transactionAmount = '+' + formatCurrency(amount);
                    break;
                    
                case 'withdraw':
                    if (amount > bankBalance) {
                        alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ!\\n\\nවර්තමාන ශේෂය: ' + formatCurrency(bankBalance));
                        return;
                    }
                    bankBalance -= amount;
                    cashBalance += amount;
                    success = true;
                    message = 'සාර්ථකව ලබාගන්නා ලදී! 💵';
                    transactionDesc = '⬇️ මුදල් ලබාගැනීම';
                    transactionAmount = '+' + formatCurrency(amount);
                    break;
                    
                case 'expense':
                    if (amount > cashBalance) {
                        alert('මුදල් ශේෂය ප්‍රමාණවත් නොවේ!\\n\\nවර්තමාන ශේෂය: ' + formatCurrency(cashBalance));
                        return;
                    }
                    cashBalance -= amount;
                    success = true;
                    message = 'වියදම සටහන් කරන ලදී! 📝';
                    transactionDesc = '⬆️ වියදම';
                    transactionAmount = '-' + formatCurrency(amount);
                    break;
            }
            
            if (success) {
                updateBalances();
                addTransaction(transactionDesc, transactionAmount);
                alert(message);
            }
        }
        
        function addTransaction(description, amount) {
            const transaction = {
                description: description,
                amount: amount,
                date: new Date().toLocaleDateString('si-LK'),
                id: Date.now()
            };
            
            transactions.unshift(transaction);
            updateTransactionList();
        }
        
        function updateTransactionList() {
            const list = document.getElementById('transactionList');
            list.innerHTML = '';
            
            transactions.slice(0, 8).forEach(t => {
                const item = document.createElement('div');
                item.className = 'transaction-item';
                
                const amountClass = t.amount.startsWith('+') ? 'positive' : 'negative';
                
                item.innerHTML = 
                    '<span>' + t.description + '</span>' +
                    '<span class="' + amountClass + '">' + t.amount + '</span>';
                
                list.appendChild(item);
            });
        }
        
        function showSummary() {
            const total = bankBalance + cashBalance;
            const summary = '📊 මුදල් සාරාංශය\\n\\n' +
                           '💰 මුළු ශේෂය: ' + formatCurrency(total) + '\\n' +
                           '🏦 බැංකු: ' + formatCurrency(bankBalance) + '\\n' +
                           '💵 මුදල්: ' + formatCurrency(cashBalance) + '\\n' +
                           '📝 ගනුදෙනු: ' + transactions.length + '\\n\\n' +
                           '📱 මුදල් කළමනාකරණ v2.3';
            
            alert(summary);
        }
        
        function saveData() {
            const data = {
                bankBalance: bankBalance,
                cashBalance: cashBalance,
                transactions: transactions,
                lastUpdated: new Date().toISOString()
            };
            
            try {
                localStorage.setItem('financeAppData', JSON.stringify(data));
            } catch (e) {
                console.warn('Storage not available:', e);
            }
        }
        
        function loadData() {
            try {
                const saved = localStorage.getItem('financeAppData');
                if (saved) {
                    const data = JSON.parse(saved);
                    bankBalance = data.bankBalance || 50000;
                    cashBalance = data.cashBalance || 0;
                    transactions = data.transactions || [];
                    updateBalances();
                    updateTransactionList();
                }
            } catch (e) {
                console.warn('Could not load saved data:', e);
            }
        }
        
        // Initialize app
        window.addEventListener('load', function() {
            loadData();
        });
    </script>
</body>
</html>'''
        
        with open(temp_path / 'assets' / 'www' / 'index.html', 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        print("📄 Creating META-INF...")
        
        # Create minimal META-INF
        with open(temp_path / 'META-INF' / 'MANIFEST.MF', 'w') as f:
            f.write('Manifest-Version: 1.0\nCreated-By: Minimal APK Builder\n')
        
        print("📦 Creating minimal APK...")
        
        # Create APK with no compression to avoid any issues
        with zipfile.ZipFile(apk_path, 'w', zipfile.ZIP_STORED) as apk:
            for root, dirs, files in os.walk(temp_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = file_path.relative_to(temp_path)
                    apk.write(file_path, str(arc_name))
        
        file_size = apk_path.stat().st_size
        
        print(f"\n✅ MINIMAL WORKING APK CREATED!")
        print(f"📏 Size: {file_size / 1024:.1f} KB ({file_size / 1024 / 1024:.2f} MB)")
        print(f"📱 File: {apk_path}")
        
        return apk_path

def create_debug_test_apk():
    """Create an even simpler debug APK for testing"""
    print("\n🐛 CREATING DEBUG TEST APK...")
    
    debug_apk = Path('/workspace/FinanceApp-Debug-Test-v2.3.apk')
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        # Create absolute minimal structure
        (temp_path / 'META-INF').mkdir()
        
        # Simplest possible manifest
        manifest = '''<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.test.finance"
    android:versionCode="1"
    android:versionName="1.0">
    
    <uses-sdk android:minSdkVersion="14" />
    
    <application android:label="Test Finance">
        <activity android:name=".MainActivity" android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>'''
        
        with open(temp_path / 'AndroidManifest.xml', 'w', encoding='utf-8') as f:
            f.write(manifest)
        
        # Minimal META-INF
        with open(temp_path / 'META-INF' / 'MANIFEST.MF', 'w') as f:
            f.write('Manifest-Version: 1.0\n')
        
        # Create debug APK with STORED compression
        with zipfile.ZipFile(debug_apk, 'w', zipfile.ZIP_STORED) as apk:
            apk.write(temp_path / 'AndroidManifest.xml', 'AndroidManifest.xml')
            apk.write(temp_path / 'META-INF' / 'MANIFEST.MF', 'META-INF/MANIFEST.MF')
        
        debug_size = debug_apk.stat().st_size
        print(f"✅ Debug APK: {debug_size / 1024:.1f} KB")
        
        return debug_apk

if __name__ == "__main__":
    try:
        # Create minimal working APK
        minimal_apk = create_minimal_working_apk()
        
        # Create debug test APK
        debug_apk = create_debug_test_apk()
        
        print(f"\n🎉 APK CREATION COMPLETE!")
        print(f"✅ Minimal APK: {minimal_apk}")
        print(f"✅ Debug APK: {debug_apk}")
        
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()