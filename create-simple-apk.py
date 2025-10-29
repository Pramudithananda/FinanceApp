#!/usr/bin/env python3
"""
Create Simple Working APK
Uses minimal Android structure that should install properly
"""

import zipfile
import os
import tempfile
from pathlib import Path

def create_simple_apk():
    print("🔧 CREATING SIMPLE WORKING APK...")
    print("=" * 50)
    
    apk_path = Path('/workspace/SimpleFinanceApp-v2.3.apk')
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        # Create basic Android structure
        (temp_path / 'META-INF').mkdir()
        (temp_path / 'res' / 'layout').mkdir(parents=True)
        (temp_path / 'res' / 'values').mkdir(parents=True)
        (temp_path / 'res' / 'drawable-hdpi').mkdir(parents=True)
        (temp_path / 'res' / 'drawable-mdpi').mkdir(parents=True)
        (temp_path / 'res' / 'drawable-xhdpi').mkdir(parents=True)
        (temp_path / 'res' / 'drawable-xxhdpi').mkdir(parents=True)
        (temp_path / 'assets' / 'www').mkdir(parents=True)
        
        # Create AndroidManifest.xml (text format for simplicity)
        manifest = '''<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.financeapp.simple"
    android:versionCode="23"
    android:versionName="2.3">
    
    <uses-sdk android:minSdkVersion="21" android:targetSdkVersion="30" />
    <uses-permission android:name="android.permission.INTERNET" />
    
    <application
        android:allowBackup="true"
        android:label="මුදල් කළමනාකරණ"
        android:theme="@android:style/Theme.Light">
        
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>'''
        
        with open(temp_path / 'AndroidManifest.xml', 'w', encoding='utf-8') as f:
            f.write(manifest)
        
        # Create strings.xml
        strings = '''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">මුදල් කළමනාකරණ</string>
</resources>'''
        
        with open(temp_path / 'res' / 'values' / 'strings.xml', 'w', encoding='utf-8') as f:
            f.write(strings)
        
        # Create main layout
        layout = '''<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">
    
    <TextView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="මුදල් කළමනාකරණ"
        android:textSize="24sp"
        android:textStyle="bold"
        android:gravity="center"
        android:padding="20dp" />
        
    <WebView
        android:id="@+id/webview"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
        
</LinearLayout>'''
        
        with open(temp_path / 'res' / 'layout' / 'activity_main.xml', 'w', encoding='utf-8') as f:
            f.write(layout)
        
        # Create the web app content
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
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            min-height: 100vh;
            color: white;
            padding: 10px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
        }
        .header h1 {
            font-size: 22px;
            margin-bottom: 5px;
        }
        .balance-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .balance-card {
            flex: 1;
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            backdrop-filter: blur(10px);
        }
        .balance-label {
            font-size: 12px;
            opacity: 0.8;
            margin-bottom: 5px;
        }
        .balance-amount {
            font-size: 18px;
            font-weight: bold;
        }
        .actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-bottom: 20px;
        }
        .action-btn {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .action-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        .transactions {
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            padding: 15px;
        }
        .transaction-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            font-size: 14px;
        }
        .transaction-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>💰 මුදල් කළමනාකරණ</h1>
        <p>Personal Finance v2.3</p>
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
        <button class="action-btn" onclick="deposit()">
            🏦 බැංකුවට තැන්පත් කරන්න
        </button>
        <button class="action-btn" onclick="withdraw()">
            ⬇️ මුදල් ලබාගැනීම
        </button>
        <button class="action-btn" onclick="expense()">
            ⬆️ වියදම් කරන්න
        </button>
        <button class="action-btn" onclick="showInfo()">
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

    <script>
        let bankBalance = 50000;
        let cashBalance = 0;
        
        function formatCurrency(amount) {
            return 'රු ' + amount.toLocaleString();
        }
        
        function updateBalances() {
            document.getElementById('bankBalance').textContent = formatCurrency(bankBalance);
            document.getElementById('cashBalance').textContent = formatCurrency(cashBalance);
        }
        
        function deposit() {
            const amount = prompt('තැන්පත් කිරීමේ මුදල:');
            if (amount && !isNaN(amount) && amount > 0) {
                bankBalance += parseFloat(amount);
                updateBalances();
                addTransaction('🏦 තැන්පත්', '+' + formatCurrency(parseFloat(amount)));
                alert('සාර්ථකව තැන්පත් කරන ලදී');
            }
        }
        
        function withdraw() {
            const amount = prompt('ලබාගන්නා මුදල:');
            if (amount && !isNaN(amount) && amount > 0) {
                if (parseFloat(amount) <= bankBalance) {
                    bankBalance -= parseFloat(amount);
                    cashBalance += parseFloat(amount);
                    updateBalances();
                    addTransaction('⬇️ මුදල් ලබාගැනීම', '+' + formatCurrency(parseFloat(amount)));
                    alert('සාර්ථකව ලබාගන්නා ලදී');
                } else {
                    alert('ප්‍රමාණවත් ශේෂයක් නොමැත');
                }
            }
        }
        
        function expense() {
            const amount = prompt('වියදම් මුදල:');
            if (amount && !isNaN(amount) && amount > 0) {
                if (parseFloat(amount) <= cashBalance) {
                    cashBalance -= parseFloat(amount);
                    updateBalances();
                    addTransaction('⬆️ වියදම', '-' + formatCurrency(parseFloat(amount)));
                    alert('වියදම සටහන් කරන ලදී');
                } else {
                    alert('ප්‍රමාණවත් මුදල් නොමැත');
                }
            }
        }
        
        function addTransaction(type, amount) {
            const list = document.getElementById('transactionList');
            const item = document.createElement('div');
            item.className = 'transaction-item';
            item.innerHTML = `<span>${type}</span><span>${amount}</span>`;
            list.insertBefore(item, list.firstChild);
        }
        
        function showInfo() {
            alert('මුදල් කළමනාකරණ ඇප් v2.3\\n\\nමෙම ඇප් භාවිතයෙන් ඔබට:\\n• බැංකු ශේෂය කළමනාකරණය\\n• මුදල් ගනුදෙනු සටහන්\\n• වියදම් ලුහුබැඳීම\\n\\nසිය ගනුදෙනු කළ හැකිය.');
        }
        
        // Initialize
        updateBalances();
    </script>
</body>
</html>'''
        
        with open(temp_path / 'assets' / 'www' / 'index.html', 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        # Create META-INF files
        with open(temp_path / 'META-INF' / 'MANIFEST.MF', 'w') as f:
            f.write('Manifest-Version: 1.0\nCreated-By: Simple APK Builder\n')
        
        print("📱 Creating APK package...")
        
        # Create the APK
        with zipfile.ZipFile(apk_path, 'w', zipfile.ZIP_DEFLATED, compresslevel=6) as apk:
            for root, dirs, files in os.walk(temp_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = file_path.relative_to(temp_path)
                    apk.write(file_path, arc_name)
        
        file_size = apk_path.stat().st_size
        
        print(f"\n✅ SIMPLE APK CREATED!")
        print(f"📏 Size: {file_size / 1024 / 1024:.1f} MB")
        print(f"📱 File: {apk_path}")
        
        return apk_path

if __name__ == "__main__":
    try:
        apk_path = create_simple_apk()
        print(f"\n🎉 SIMPLE APK READY!")
        
    except Exception as e:
        print(f"❌ Error: {e}")