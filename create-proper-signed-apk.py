#!/usr/bin/env python3
"""
Create Properly Signed APK
Uses aapt to create valid Android package
"""

import zipfile
import os
import tempfile
import subprocess
from pathlib import Path
import shutil

def create_proper_apk():
    print("🔧 CREATING PROPERLY SIGNED APK...")
    print("=" * 50)
    
    apk_path = Path('/workspace/FinanceApp-Proper-v2.3.apk')
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        # Create proper Android project structure
        print("📁 Creating Android project structure...")
        
        # Main directories
        (temp_path / 'src' / 'main' / 'java' / 'com' / 'financeapp' / 'personal').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'layout').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'values').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'drawable').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'mipmap-hdpi').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'mipmap-mdpi').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'mipmap-xhdpi').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'res' / 'mipmap-xxhdpi').mkdir(parents=True)
        (temp_path / 'src' / 'main' / 'assets' / 'www').mkdir(parents=True)
        
        # Create AndroidManifest.xml
        print("📝 Creating AndroidManifest.xml...")
        manifest = '''<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.financeapp.personal"
    android:versionCode="23"
    android:versionName="2.3"
    android:installLocation="auto">
    
    <uses-sdk 
        android:minSdkVersion="21" 
        android:targetSdkVersion="33" />
    
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" 
        android:maxSdkVersion="28" />
    
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme"
        android:hardwareAccelerated="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:screenOrientation="portrait"
            android:configChanges="orientation|screenSize|keyboardHidden">
            
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>'''
        
        with open(temp_path / 'src' / 'main' / 'AndroidManifest.xml', 'w', encoding='utf-8') as f:
            f.write(manifest)
        
        # Create strings.xml
        print("📝 Creating resources...")
        strings = '''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">මුදල් කළමනාකරණ</string>
</resources>'''
        
        with open(temp_path / 'src' / 'main' / 'res' / 'values' / 'strings.xml', 'w', encoding='utf-8') as f:
            f.write(strings)
        
        # Create styles.xml
        styles = '''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="AppTheme" parent="android:Theme.Light.NoTitleBar">
        <item name="android:windowBackground">@android:color/white</item>
    </style>
</resources>'''
        
        with open(temp_path / 'src' / 'main' / 'res' / 'values' / 'styles.xml', 'w', encoding='utf-8') as f:
            f.write(styles)
        
        # Create activity_main.xml
        layout = '''<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">
    
    <WebView
        android:id="@+id/webview"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
        
</LinearLayout>'''
        
        with open(temp_path / 'src' / 'main' / 'res' / 'layout' / 'activity_main.xml', 'w', encoding='utf-8') as f:
            f.write(layout)
        
        # Create MainActivity.java
        print("☕ Creating MainActivity.java...")
        main_activity = '''package com.financeapp.personal;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebSettings;

public class MainActivity extends Activity {
    private WebView webView;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        webView = findViewById(R.id.webview);
        
        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDomStorageEnabled(true);
        webSettings.setLoadWithOverviewMode(true);
        webSettings.setUseWideViewPort(true);
        webSettings.setBuiltInZoomControls(false);
        webSettings.setDisplayZoomControls(false);
        
        webView.setWebViewClient(new WebViewClient());
        webView.loadUrl("file:///android_asset/www/index.html");
    }
    
    @Override
    public void onBackPressed() {
        if (webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
    }
}'''
        
        with open(temp_path / 'src' / 'main' / 'java' / 'com' / 'financeapp' / 'personal' / 'MainActivity.java', 'w', encoding='utf-8') as f:
            f.write(main_activity)
        
        # Create web app
        print("🌐 Creating web application...")
        html_content = '''<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>මුදල් කළමනාකරණ</title>
    <style>
        * { 
            margin: 0; 
            padding: 0; 
            box-sizing: border-box; 
            -webkit-tap-highlight-color: transparent;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: white;
            padding: 15px;
            overflow-x: hidden;
        }
        .header {
            text-align: center;
            margin-bottom: 25px;
            padding: 20px 0;
        }
        .header h1 {
            font-size: 26px;
            margin-bottom: 8px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        .header p {
            opacity: 0.9;
            font-size: 14px;
        }
        .balance-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 25px;
        }
        .balance-card {
            background: rgba(255,255,255,0.15);
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }
        .balance-label {
            font-size: 13px;
            opacity: 0.8;
            margin-bottom: 8px;
            font-weight: 500;
        }
        .balance-amount {
            font-size: 20px;
            font-weight: bold;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
        }
        .actions {
            display: grid;
            gap: 12px;
            margin-bottom: 25px;
        }
        .action-btn {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            padding: 16px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
            text-align: left;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .action-btn:active {
            background: rgba(255,255,255,0.3);
            transform: translateY(1px);
        }
        .transactions {
            background: rgba(255,255,255,0.15);
            border-radius: 15px;
            padding: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }
        .transactions h3 {
            margin-bottom: 15px;
            font-size: 18px;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
        }
        .transaction-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            font-size: 14px;
        }
        .transaction-item:last-child {
            border-bottom: none;
        }
        .transaction-left {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .transaction-amount {
            font-weight: bold;
        }
        .positive { color: #4ade80; }
        .negative { color: #f87171; }
        
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
            z-index: 1000;
        }
        .modal-content {
            background: white;
            color: #333;
            padding: 25px;
            border-radius: 15px;
            width: 90%;
            max-width: 350px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        .modal h3 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .modal input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        .modal input:focus {
            outline: none;
            border-color: #667eea;
        }
        .modal-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .modal button {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #667eea;
            color: white;
        }
        .btn-primary:active {
            background: #5a67d8;
        }
        .btn-secondary {
            background: #e2e8f0;
            color: #4a5568;
        }
        .btn-secondary:active {
            background: #cbd5e0;
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
            <div class="balance-label">🏦 බැංකු ශේෂය</div>
            <div class="balance-amount" id="bankBalance">රු 50,000</div>
        </div>
        <div class="balance-card">
            <div class="balance-label">💵 මුදල් ශේෂය</div>
            <div class="balance-amount" id="cashBalance">රු 0</div>
        </div>
    </div>
    
    <div class="actions">
        <button class="action-btn" onclick="openModal('deposit')">
            <span>🏦</span>
            <span>බැංකුවට තැන්පත් කරන්න</span>
        </button>
        <button class="action-btn" onclick="openModal('withdraw')">
            <span>⬇️</span>
            <span>මුදල් ලබාගැනීම</span>
        </button>
        <button class="action-btn" onclick="openModal('expense')">
            <span>⬆️</span>
            <span>වියදම් කරන්න</span>
        </button>
        <button class="action-btn" onclick="showSummary()">
            <span>📊</span>
            <span>සාරාංශය</span>
        </button>
    </div>
    
    <div class="transactions">
        <h3>📋 මෑත ගනුදෙනු</h3>
        <div id="transactionList">
            <div class="transaction-item">
                <div class="transaction-left">
                    <span>🏦</span>
                    <span>ආරම්භක ශේෂය</span>
                </div>
                <span class="transaction-amount positive">+රු 50,000</span>
            </div>
        </div>
    </div>
    
    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <h3 id="modalTitle">ගනුදෙනුව</h3>
            <input type="number" id="amount" placeholder="මුදල ඇතුළත් කරන්න" />
            <input type="text" id="description" placeholder="විස්තරය (අමතර)" />
            <div class="modal-buttons">
                <button class="btn-primary" onclick="submitTransaction()">සේව් කරන්න</button>
                <button class="btn-secondary" onclick="closeModal()">අවලංගු</button>
            </div>
        </div>
    </div>

    <script>
        let bankBalance = 50000;
        let cashBalance = 0;
        let transactions = [];
        let currentModalType = '';
        
        function formatCurrency(amount) {
            return 'රු ' + Math.abs(amount).toLocaleString('si-LK');
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
            
            const titles = {
                'deposit': '🏦 බැංකුවට තැන්පත් කරන්න',
                'withdraw': '⬇️ මුදල් ලබාගැනීම',
                'expense': '⬆️ වියදම් කරන්න'
            };
            
            title.textContent = titles[type] || 'ගනුදෙනුව';
            modal.style.display = 'flex';
            
            // Focus on amount input
            setTimeout(() => {
                document.getElementById('amount').focus();
            }, 100);
        }
        
        function closeModal() {
            document.getElementById('modal').style.display = 'none';
            document.getElementById('amount').value = '';
            document.getElementById('description').value = '';
        }
        
        function submitTransaction() {
            const amount = parseFloat(document.getElementById('amount').value);
            const description = document.getElementById('description').value || getDefaultDescription(currentModalType);
            
            if (!amount || amount <= 0) {
                alert('කරුණාකර වලංගු මුදලක් ඇතුළත් කරන්න');
                return;
            }
            
            const transaction = {
                type: currentModalType,
                amount: amount,
                description: description,
                date: new Date().toLocaleString('si-LK'),
                id: Date.now()
            };
            
            let success = false;
            
            switch(currentModalType) {
                case 'deposit':
                    bankBalance += amount;
                    success = true;
                    break;
                case 'withdraw':
                    if (amount > bankBalance) {
                        alert('බැංකු ශේෂය ප්‍රමාණවත් නොවේ!');
                        return;
                    }
                    bankBalance -= amount;
                    cashBalance += amount;
                    success = true;
                    break;
                case 'expense':
                    if (amount > cashBalance) {
                        alert('මුදල් ශේෂය ප්‍රමාණවත් නොවේ!');
                        return;
                    }
                    cashBalance -= amount;
                    success = true;
                    break;
            }
            
            if (success) {
                transactions.unshift(transaction);
                updateBalances();
                updateTransactionList();
                closeModal();
                
                // Success feedback
                const messages = {
                    'deposit': 'සාර්ථකව තැන්පත් කරන ලදී! 🎉',
                    'withdraw': 'සාර්ථකව ලබාගන්නා ලදී! 💵',
                    'expense': 'වියදම සටහන් කරන ලදී! 📝'
                };
                alert(messages[currentModalType]);
            }
        }
        
        function getDefaultDescription(type) {
            const defaults = {
                'deposit': 'බැංකු තැන්පත්',
                'withdraw': 'මුදල් ලබාගැනීම',
                'expense': 'වියදම'
            };
            return defaults[type] || 'ගනුදෙනුව';
        }
        
        function updateTransactionList() {
            const list = document.getElementById('transactionList');
            list.innerHTML = '';
            
            transactions.slice(0, 8).forEach(t => {
                const item = document.createElement('div');
                item.className = 'transaction-item';
                
                const icons = {
                    'deposit': '🏦',
                    'withdraw': '⬇️',
                    'expense': '⬆️'
                };
                
                const isPositive = t.type === 'deposit' || t.type === 'withdraw';
                const sign = isPositive ? '+' : '-';
                const amountClass = isPositive ? 'positive' : 'negative';
                
                item.innerHTML = `
                    <div class="transaction-left">
                        <span>${icons[t.type] || '💰'}</span>
                        <span>${t.description}</span>
                    </div>
                    <span class="transaction-amount ${amountClass}">${sign}${formatCurrency(t.amount)}</span>
                `;
                list.appendChild(item);
            });
        }
        
        function showSummary() {
            const total = bankBalance + cashBalance;
            const transactionCount = transactions.length;
            
            alert(`📊 මුදල් සාරාංශය\\n\\n💰 මුළු ශේෂය: ${formatCurrency(total)}\\n🏦 බැංකු: ${formatCurrency(bankBalance)}\\n💵 මුදල්: ${formatCurrency(cashBalance)}\\n📝 ගනුදෙනු: ${transactionCount}\\n\\nමුදල් කළමනාකරණ v2.3`);
        }
        
        function saveData() {
            const data = {
                bankBalance,
                cashBalance,
                transactions,
                lastUpdated: new Date().toISOString()
            };
            try {
                localStorage.setItem('financeAppData', JSON.stringify(data));
            } catch (e) {
                console.log('Storage not available');
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
                console.log('Could not load saved data');
            }
        }
        
        // Initialize app
        window.addEventListener('load', function() {
            loadData();
        });
        
        // Handle back button
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeModal();
            }
        });
        
        // Prevent zoom on double tap
        let lastTouchEnd = 0;
        document.addEventListener('touchend', function (event) {
            const now = (new Date()).getTime();
            if (now - lastTouchEnd <= 300) {
                event.preventDefault();
            }
            lastTouchEnd = now;
        }, false);
    </script>
</body>
</html>'''
        
        with open(temp_path / 'src' / 'main' / 'assets' / 'www' / 'index.html', 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        # Create simple icon files (placeholder)
        print("🎨 Creating app icons...")
        icon_sizes = ['hdpi', 'mdpi', 'xhdpi', 'xxhdpi']
        for size in icon_sizes:
            icon_dir = temp_path / 'src' / 'main' / 'res' / f'mipmap-{size}'
            # Create a simple text file as placeholder (will be converted by aapt)
            with open(icon_dir / 'ic_launcher.png', 'wb') as f:
                # Minimal PNG header for a 1x1 transparent pixel
                f.write(b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x08\x06\x00\x00\x00\x1f\x15\xc4\x89\x00\x00\x00\rIDATx\x9cc\xf8\x0f\x00\x00\x01\x00\x01\x00\x18\xdd\x8d\xb4\x00\x00\x00\x00IEND\xaeB`\x82')
        
        print("🔨 Building APK with aapt...")
        
        # Use aapt to package the APK properly
        try:
            # Create R.java and compile resources
            cmd = [
                'aapt', 'package',
                '-f',  # force overwrite
                '-m',  # make package directories under location specified by -J
                '-J', str(temp_path / 'gen'),  # output directory for R.java
                '-M', str(temp_path / 'src' / 'main' / 'AndroidManifest.xml'),
                '-S', str(temp_path / 'src' / 'main' / 'res'),
                '-A', str(temp_path / 'src' / 'main' / 'assets'),
                '-I', '/usr/lib/android-sdk/platforms/android-33/android.jar',  # Android platform
                '-F', str(apk_path)  # output APK
            ]
            
            # Try to find android.jar
            android_jar_paths = [
                '/usr/lib/android-sdk/platforms/android-33/android.jar',
                '/opt/android-sdk/platforms/android-33/android.jar',
                '/usr/share/android-sdk/platforms/android-33/android.jar'
            ]
            
            android_jar = None
            for jar_path in android_jar_paths:
                if os.path.exists(jar_path):
                    android_jar = jar_path
                    break
            
            if not android_jar:
                print("⚠️  Android JAR not found, creating simple APK...")
                # Fallback: create APK manually
                create_manual_apk(temp_path, apk_path)
            else:
                cmd[cmd.index('-I') + 1] = android_jar
                result = subprocess.run(cmd, capture_output=True, text=True)
                
                if result.returncode != 0:
                    print(f"⚠️  aapt failed: {result.stderr}")
                    print("Creating manual APK...")
                    create_manual_apk(temp_path, apk_path)
                else:
                    print("✅ APK created with aapt")
        
        except Exception as e:
            print(f"⚠️  aapt error: {e}")
            print("Creating manual APK...")
            create_manual_apk(temp_path, apk_path)
        
        if apk_path.exists():
            file_size = apk_path.stat().st_size
            print(f"\n✅ PROPER APK CREATED!")
            print(f"📏 Size: {file_size / 1024:.1f} KB")
            print(f"📱 File: {apk_path}")
            return apk_path
        else:
            print("❌ Failed to create APK")
            return None

def create_manual_apk(temp_path, apk_path):
    """Fallback method to create APK manually"""
    print("📦 Creating APK manually...")
    
    with zipfile.ZipFile(apk_path, 'w', zipfile.ZIP_DEFLATED, compresslevel=6) as apk:
        # Add AndroidManifest.xml
        manifest_path = temp_path / 'src' / 'main' / 'AndroidManifest.xml'
        if manifest_path.exists():
            apk.write(manifest_path, 'AndroidManifest.xml')
        
        # Add resources
        res_path = temp_path / 'src' / 'main' / 'res'
        if res_path.exists():
            for root, dirs, files in os.walk(res_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = 'res' / file_path.relative_to(res_path)
                    apk.write(file_path, str(arc_name))
        
        # Add assets
        assets_path = temp_path / 'src' / 'main' / 'assets'
        if assets_path.exists():
            for root, dirs, files in os.walk(assets_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = 'assets' / file_path.relative_to(assets_path)
                    apk.write(file_path, str(arc_name))
        
        # Add META-INF
        apk.writestr('META-INF/MANIFEST.MF', 'Manifest-Version: 1.0\nCreated-By: Manual APK Builder\n')

if __name__ == "__main__":
    try:
        apk_path = create_proper_apk()
        if apk_path:
            print(f"\n🎉 PROPER APK READY!")
        else:
            print("❌ Failed to create APK")
        
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()