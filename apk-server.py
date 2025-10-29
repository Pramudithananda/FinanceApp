#!/usr/bin/env python3
import http.server
import socketserver
import os
import webbrowser
from urllib.parse import unquote

class APKDownloadHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="/workspace", **kwargs)
    
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', '*')
        super().end_headers()
    
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html; charset=utf-8')
            self.end_headers()
            
            html_content = """
<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Finance APK Download - මුදල් කළමනාකරණ</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        
        .icon {
            font-size: 80px;
            margin-bottom: 20px;
        }
        
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        
        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 1.2em;
        }
        
        .version-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: left;
        }
        
        .version-info h3 {
            color: #333;
            margin-bottom: 15px;
            text-align: center;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin: 15px 0;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            border-bottom: 1px solid #eee;
        }
        
        .info-item:last-child {
            border-bottom: none;
        }
        
        .download-section {
            margin: 30px 0;
        }
        
        .download-btn {
            display: inline-block;
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 20px 40px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.3em;
            margin: 10px;
            transition: transform 0.2s, box-shadow 0.2s;
            border: none;
            cursor: pointer;
        }
        
        .download-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3);
        }
        
        .download-btn.primary {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            font-size: 1.4em;
            padding: 25px 50px;
        }
        
        .download-btn.primary:hover {
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.3);
        }
        
        .features {
            text-align: left;
            margin: 30px 0;
            background: #e0f2fe;
            padding: 20px;
            border-radius: 10px;
        }
        
        .features h3 {
            color: #333;
            margin-bottom: 15px;
            text-align: center;
        }
        
        .features ul {
            list-style: none;
            padding: 0;
        }
        
        .features li {
            padding: 8px 0;
            border-bottom: 1px solid rgba(255,255,255,0.3);
        }
        
        .features li:last-child {
            border-bottom: none;
        }
        
        .features li::before {
            content: "✓";
            color: #10b981;
            font-weight: bold;
            margin-right: 10px;
        }
        
        .warning {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
            color: #856404;
        }
        
        .warning h4 {
            margin-bottom: 10px;
            color: #856404;
        }
        
        .installation-steps {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: left;
        }
        
        .installation-steps h3 {
            text-align: center;
            margin-bottom: 15px;
            color: #333;
        }
        
        .installation-steps ol {
            padding-left: 20px;
        }
        
        .installation-steps li {
            margin: 10px 0;
            line-height: 1.5;
        }
        
        .file-info {
            background: #e3f2fd;
            padding: 15px;
            border-radius: 10px;
            margin: 20px 0;
            font-family: monospace;
        }
        
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 10px;
            }
            
            h1 {
                font-size: 2em;
            }
            
            .icon {
                font-size: 60px;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .download-btn.primary {
                font-size: 1.2em;
                padding: 20px 30px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">📱💰</div>
        <h1>මුදල් කළමනාකරණ</h1>
        <p class="subtitle">Personal Finance Management App</p>
        
        <div class="version-info">
            <h3>📊 APK Information</h3>
            <div class="info-grid">
                <div class="info-item">
                    <span><strong>Version:</strong></span>
                    <span>2.3 Enhanced</span>
                </div>
                <div class="info-item">
                    <span><strong>Size:</strong></span>
                    <span>321 KB</span>
                </div>
                <div class="info-item">
                    <span><strong>Package:</strong></span>
                    <span>com.financeapp.personalbudget</span>
                </div>
                <div class="info-item">
                    <span><strong>Min Android:</strong></span>
                    <span>5.0 (API 21)</span>
                </div>
                <div class="info-item">
                    <span><strong>Target Android:</strong></span>
                    <span>13 (API 33)</span>
                </div>
                <div class="info-item">
                    <span><strong>Architecture:</strong></span>
                    <span>Universal</span>
                </div>
            </div>
        </div>
        
        <div class="download-section">
            <h3>📥 Download APK</h3>
            <a href="/PersonalFinanceApp-Enhanced-v2.3.apk" class="download-btn primary" download>
                📱 Download APK (321 KB)
            </a>
            <br>
            <a href="/Complete-APK-Guide.md" class="download-btn" target="_blank">
                📋 Installation Guide
            </a>
        </div>
        
        <div class="features">
            <h3>🌟 App Features</h3>
            <ul>
                <li>බැංකු හා මුදල් ශේෂ කළමනාකරණය</li>
                <li>ආදායම් හා වියදම් සටහන් කිරීම</li>
                <li>වියදම් කාණ්ඩ සහ ගෝල නියම කිරීම</li>
                <li>ගනුදෙනු ඉතිහාසය</li>
                <li>සම්පූර්ණ සිංහල අතුරු මුහුණත</li>
                <li>Offline භාවිතය - Internet අවශ්‍ය නැත</li>
                <li>ස්වයංක්‍රීය දත්ත සුරැකීම</li>
                <li>Mobile සහ Tablet සඳහා ප්‍රශස්තකරණය</li>
            </ul>
        </div>
        
        <div class="installation-steps">
            <h3>🔧 Quick Installation Steps</h3>
            <ol>
                <li><strong>Download</strong> the APK file above</li>
                <li><strong>Enable</strong> "Unknown Sources" in Android Settings > Security</li>
                <li><strong>Open</strong> the downloaded APK file</li>
                <li><strong>Tap "Install"</strong> when prompted</li>
                <li><strong>Launch</strong> the app from your app drawer</li>
            </ol>
        </div>
        
        <div class="warning">
            <h4>⚠️ Security Notice</h4>
            <p>Your Android device may show security warnings when installing this APK. This is normal for apps not from Google Play Store. The app is safe and contains no malware.</p>
        </div>
        
        <div class="file-info">
            <strong>File Details:</strong><br>
            📁 PersonalFinanceApp-Enhanced-v2.3.apk<br>
            📏 Size: 321 KB (328,892 bytes)<br>
            🔒 Type: Android Application Package<br>
            📅 Created: October 2025<br>
            ✅ Status: Ready for Installation
        </div>
        
        <p style="margin-top: 30px; color: #666; font-size: 0.9em;">
            <strong>Privacy:</strong> ඔබේ සියලුම දත්ත ඔබේ device එකේම save වේ. 
            කිසිදු දත්තයක් external servers වලට යවන්නේ නැත.
        </p>
    </div>
</body>
</html>
            """
            
            self.wfile.write(html_content.encode('utf-8'))
        else:
            super().do_GET()

if __name__ == "__main__":
    PORT = 8080
    
    print("🚀 Starting Personal Finance APK Download Server...")
    print(f"📱 Server running at: http://localhost:{PORT}")
    print("📥 APK Download: http://localhost:{PORT}/PersonalFinanceApp-Enhanced-v2.3.apk")
    print("📋 Installation Guide: http://localhost:{PORT}/Complete-APK-Guide.md")
    print("\n💡 Press Ctrl+C to stop the server")
    print("=" * 60)
    
    try:
        with socketserver.TCPServer(("", PORT), APKDownloadHandler) as httpd:
            # Try to open browser automatically
            try:
                webbrowser.open(f'http://localhost:{PORT}')
            except:
                pass
                
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n\n👋 Server stopped. Thank you for using Personal Finance App!")
    except Exception as e:
        print(f"\n❌ Error starting server: {e}")
        print("💡 Try running on a different port or check if port 8080 is already in use")