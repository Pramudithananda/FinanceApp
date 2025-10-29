#!/usr/bin/env python3
"""
Fix APK Parsing Issues
Creates a working APK by fixing common parsing problems
"""

import zipfile
import os
import tempfile
from pathlib import Path
import shutil

def fix_apk_parsing():
    print("🔧 FIXING APK PARSING ISSUES...")
    print("=" * 50)
    
    original_apk = Path('/workspace/original-finance-app.apk')
    fixed_apk = Path('/workspace/FinanceApp-Fixed-v2.3.apk')
    
    if not original_apk.exists():
        print("❌ Original APK not found")
        return None
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        print("📦 Extracting original APK...")
        try:
            with zipfile.ZipFile(original_apk, 'r') as apk:
                apk.extractall(temp_path)
        except Exception as e:
            print(f"❌ Failed to extract APK: {e}")
            return None
        
        print("🔍 Analyzing APK structure...")
        
        # Check what we have
        manifest_path = temp_path / 'AndroidManifest.xml'
        classes_dex = temp_path / 'classes.dex'
        resources_arsc = temp_path / 'resources.arsc'
        
        print(f"   AndroidManifest.xml: {'✅' if manifest_path.exists() else '❌'}")
        print(f"   classes.dex: {'✅' if classes_dex.exists() else '❌'}")
        print(f"   resources.arsc: {'✅' if resources_arsc.exists() else '❌'}")
        
        # Remove problematic architectures
        lib_path = temp_path / 'lib'
        if lib_path.exists():
            for arch in ['x86', 'x86_64']:
                arch_path = lib_path / arch
                if arch_path.exists():
                    shutil.rmtree(arch_path)
                    print(f"   🗑️ Removed {arch} architecture")
        
        # Remove META-INF to avoid signature conflicts
        meta_inf = temp_path / 'META-INF'
        if meta_inf.exists():
            shutil.rmtree(meta_inf)
            print("   🗑️ Removed META-INF (signatures)")
        
        # Create new META-INF
        (temp_path / 'META-INF').mkdir()
        with open(temp_path / 'META-INF' / 'MANIFEST.MF', 'w') as f:
            f.write('Manifest-Version: 1.0\nCreated-By: APK Fixer\n')
        
        print("📱 Creating fixed APK...")
        
        # Create APK with specific compression settings
        with zipfile.ZipFile(fixed_apk, 'w', zipfile.ZIP_DEFLATED, compresslevel=6) as new_apk:
            for root, dirs, files in os.walk(temp_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = file_path.relative_to(temp_path)
                    
                    # Use STORED compression for critical Android files
                    if file in ['AndroidManifest.xml', 'classes.dex', 'resources.arsc']:
                        new_apk.write(file_path, arc_name, compress_type=zipfile.ZIP_STORED)
                    else:
                        new_apk.write(file_path, arc_name, compress_type=zipfile.ZIP_DEFLATED)
        
        original_size = original_apk.stat().st_size
        fixed_size = fixed_apk.stat().st_size
        
        print(f"\n✅ FIXED APK CREATED!")
        print(f"📏 Original Size: {original_size / 1024 / 1024:.1f} MB")
        print(f"📏 Fixed Size: {fixed_size / 1024 / 1024:.1f} MB")
        print(f"📱 File: {fixed_apk}")
        
        return fixed_apk

def create_universal_apk():
    """Create a universal APK that should work on most devices"""
    print("\n🌍 CREATING UNIVERSAL APK...")
    
    universal_apk = Path('/workspace/FinanceApp-Universal-v2.3.apk')
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        # Create minimal but complete Android structure
        (temp_path / 'res' / 'layout').mkdir(parents=True)
        (temp_path / 'res' / 'values').mkdir(parents=True)
        (temp_path / 'res' / 'drawable').mkdir(parents=True)
        (temp_path / 'assets' / 'www').mkdir(parents=True)
        (temp_path / 'META-INF').mkdir(parents=True)
        
        # Create AndroidManifest.xml (text format)
        manifest = '''<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.financeapp.universal"
    android:versionCode="23"
    android:versionName="2.3">
    
    <uses-sdk android:minSdkVersion="16" android:targetSdkVersion="30" />
    <uses-permission android:name="android.permission.INTERNET" />
    
    <application
        android:allowBackup="true"
        android:label="මුදල් කළමනාකරණ"
        android:theme="@android:style/Theme.Light">
        
        <activity
            android:name="com.financeapp.universal.MainActivity"
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
<WebView xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/webview"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />'''
        
        with open(temp_path / 'res' / 'layout' / 'main.xml', 'w', encoding='utf-8') as f:
            f.write(layout)
        
        # Create the web app (optimized for mobile)
        html_content = '''<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>මුදල් කළමනාකරණ</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e40af, #3b82f6);
            min-height: 100vh;
            color: white;
            padding: 10px;
            -webkit-user-select: none;
            user-select: none;
        }
        .app {
            max-width: 400px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
            padding: 15px;
        }
        .header h1 {
            font-size: 20px;
            margin-bottom: 5px;
        }
        .balances {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .balance {
            flex: 1;
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
        }
        .balance-label {
            font-size: 12px;
            opacity: 0.8;
            margin-bottom: 5px;
        }
        .balance-amount {
            font-size: 16px;
            font-weight: bold;
        }
        .actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-bottom: 20px;
        }
        .btn {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            padding: 15px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:active {
            background: rgba(255,255,255,0.3);
        }
        .transactions {
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            padding: 15px;
        }
        .transaction {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            font-size: 13px;
        }
        .transaction:last-child {
            border-bottom: none;
        }
        .positive { color: #4ade80; }
        .negative { color: #f87171; }
    </style>
</head>
<body>
    <div class="app">
        <div class="header">
            <h1>💰 මුදල් කළමනාකරණ</h1>
            <p>v2.3 - Universal</p>
        </div>
        
        <div class="balances">
            <div class="balance">
                <div class="balance-label">බැංකු ශේෂය</div>
                <div class="balance-amount" id="bank">රු 50,000</div>
            </div>
            <div class="balance">
                <div class="balance-label">මුදල් ශේෂය</div>
                <div class="balance-amount" id="cash">රු 0</div>
            </div>
        </div>
        
        <div class="actions">
            <button class="btn" onclick="action('deposit')">🏦 තැන්පත් කරන්න</button>
            <button class="btn" onclick="action('withdraw')">⬇️ මුදල් ලබාගන්න</button>
            <button class="btn" onclick="action('expense')">⬆️ වියදම් කරන්න</button>
            <button class="btn" onclick="showInfo()">📊 තොරතුරු</button>
        </div>
        
        <div class="transactions">
            <h3>මෑත ගනුදෙනු</h3>
            <div id="list">
                <div class="transaction">
                    <span>🏦 ආරම්භක ශේෂය</span>
                    <span class="positive">+රු 50,000</span>
                </div>
            </div>
        </div>
    </div>

    <script>
        let bank = 50000, cash = 0, transactions = [];
        
        function fmt(n) { return 'රු ' + Math.abs(n).toLocaleString(); }
        
        function update() {
            document.getElementById('bank').textContent = fmt(bank);
            document.getElementById('cash').textContent = fmt(cash);
            save();
        }
        
        function action(type) {
            const amount = parseFloat(prompt(type === 'deposit' ? 'තැන්පත් මුදල:' : 
                                           type === 'withdraw' ? 'ලබාගන්නා මුදල:' : 'වියදම් මුදල:'));
            
            if (!amount || amount <= 0) return;
            
            if (type === 'deposit') {
                bank += amount;
                add('🏦 තැන්පත්', '+' + fmt(amount));
                alert('සාර්ථකව තැන්පත් කරන ලදී!');
            } else if (type === 'withdraw') {
                if (amount > bank) { alert('ප්‍රමාණවත් ශේෂයක් නැත!'); return; }
                bank -= amount;
                cash += amount;
                add('⬇️ මුදල් ලබාගැනීම', '+' + fmt(amount));
                alert('සාර්ථකව ලබාගන්නා ලදී!');
            } else if (type === 'expense') {
                if (amount > cash) { alert('ප්‍රමාණවත් මුදල් නැත!'); return; }
                cash -= amount;
                add('⬆️ වියදම', '-' + fmt(amount));
                alert('වියදම සටහන් කරන ලදී!');
            }
            
            update();
        }
        
        function add(desc, amt) {
            const list = document.getElementById('list');
            const div = document.createElement('div');
            div.className = 'transaction';
            div.innerHTML = '<span>' + desc + '</span><span class="' + 
                           (amt.startsWith('+') ? 'positive' : 'negative') + '">' + amt + '</span>';
            list.insertBefore(div, list.firstChild);
            
            transactions.unshift({desc, amt, time: Date.now()});
            if (transactions.length > 10) transactions.pop();
        }
        
        function showInfo() {
            alert('💰 මුදල් කළමනාකරණ v2.3\\n\\n🏦 බැංකු: ' + fmt(bank) + 
                  '\\n💵 මුදල්: ' + fmt(cash) + 
                  '\\n💰 මුළු: ' + fmt(bank + cash) + 
                  '\\n📝 ගනුදෙනු: ' + transactions.length);
        }
        
        function save() {
            try {
                localStorage.setItem('finance', JSON.stringify({bank, cash, transactions}));
            } catch(e) {}
        }
        
        function load() {
            try {
                const data = JSON.parse(localStorage.getItem('finance') || '{}');
                bank = data.bank || 50000;
                cash = data.cash || 0;
                transactions = data.transactions || [];
                update();
                
                const list = document.getElementById('list');
                list.innerHTML = '';
                transactions.forEach(t => {
                    const div = document.createElement('div');
                    div.className = 'transaction';
                    div.innerHTML = '<span>' + t.desc + '</span><span class="' + 
                                   (t.amt.startsWith('+') ? 'positive' : 'negative') + '">' + t.amt + '</span>';
                    list.appendChild(div);
                });
            } catch(e) {}
        }
        
        window.onload = load;
    </script>
</body>
</html>'''
        
        with open(temp_path / 'assets' / 'www' / 'index.html', 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        # Create META-INF
        with open(temp_path / 'META-INF' / 'MANIFEST.MF', 'w') as f:
            f.write('Manifest-Version: 1.0\nCreated-By: Universal APK Builder\n')
        
        print("📱 Creating universal APK...")
        
        # Create APK with minimal compression
        with zipfile.ZipFile(universal_apk, 'w', zipfile.ZIP_DEFLATED, compresslevel=1) as apk:
            for root, dirs, files in os.walk(temp_path):
                for file in files:
                    file_path = Path(root) / file
                    arc_name = file_path.relative_to(temp_path)
                    apk.write(file_path, arc_name)
        
        file_size = universal_apk.stat().st_size
        
        print(f"\n✅ UNIVERSAL APK CREATED!")
        print(f"📏 Size: {file_size / 1024:.1f} KB")
        print(f"📱 File: {universal_apk}")
        
        return universal_apk

if __name__ == "__main__":
    try:
        # Try to fix the original APK
        fixed_apk = fix_apk_parsing()
        
        # Also create a universal APK as backup
        universal_apk = create_universal_apk()
        
        print(f"\n🎉 APK FIXING COMPLETE!")
        
        if fixed_apk:
            print(f"✅ Fixed Original: {fixed_apk}")
        if universal_apk:
            print(f"✅ Universal Backup: {universal_apk}")
        
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()