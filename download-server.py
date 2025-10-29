#!/usr/bin/env python3
import http.server
import socketserver
import os
import webbrowser
from urllib.parse import unquote

class DownloadHandler(http.server.SimpleHTTPRequestHandler):
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
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            
            html_content = """
<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Finance App Download - මුදල් කළමනාකරණ</title>
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
        
        .features {
            text-align: left;
            margin: 30px 0;
            background: #f8f9fa;
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
            border-bottom: 1px solid #eee;
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
        
        .download-section {
            margin: 30px 0;
        }
        
        .download-btn {
            display: inline-block;
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
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
            font-size: 1.3em;
            padding: 20px 40px;
        }
        
        .download-btn.primary:hover {
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.3);
        }
        
        .info {
            background: #e0f2fe;
            border: 1px solid #0ea5e9;
            border-radius: 10px;
            padding: 15px;
            margin: 20px 0;
            color: #0c4a6e;
        }
        
        .version {
            color: #666;
            font-size: 0.9em;
            margin-top: 20px;
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">💰</div>
        <h1>මුදල් කළමනාකරණ</h1>
        <p class="subtitle">Personal Finance Management App</p>
        
        <div class="features">
            <h3>🌟 විශේෂාංග (Features)</h3>
            <ul>
                <li>බැංකු හා මුදල් ශේෂ කළමනාකරණය</li>
                <li>ආදායම් හා වියදම් සටහන් කිරීම</li>
                <li>වියදම් කාණ්ඩ සහ ගෝල නියම කිරීම</li>
                <li>ගනුදෙනු ඉතිහාසය</li>
                <li>සම්පූර්ණ සිංහල අතුරු මුහුණත</li>
                <li>Mobile සහ Desktop සඳහා ප්‍රශස්තකරණය</li>
                <li>Offline භාවිතය - Internet අවශ්‍ය නැත</li>
                <li>ස්වයංක්‍රීය දත්ත සුරැකීම</li>
            </ul>
        </div>
        
        <div class="download-section">
            <h3>📥 Download කරන්න</h3>
            <a href="/finance-app-v2.3.zip" class="download-btn primary" download>
                📱 Complete App Download (ZIP)
            </a>
            <br>
            <a href="/finance-app-download/" class="download-btn" target="_blank">
                🌐 Online Demo බලන්න
            </a>
        </div>
        
        <div class="info">
            <strong>📋 Installation Instructions:</strong><br>
            1. ZIP file එක download කරන්න<br>
            2. Extract කරන්න<br>
            3. install.bat (Windows) හෝ install.sh (Mac/Linux) run කරන්න<br>
            4. හෝ index.html browser එකේ open කරන්න
        </div>
        
        <div class="info">
            <strong>🔒 Privacy:</strong> ඔබේ සියලුම දත්ත ඔබේ device එකේම save වේ. 
            කිසිදු දත්තයක් external servers වලට යවන්නේ නැත.
        </div>
        
        <p class="version">Version 2.3 - Working Version</p>
    </div>
</body>
</html>
            """
            
            self.wfile.write(html_content.encode('utf-8'))
        else:
            super().do_GET()

if __name__ == "__main__":
    PORT = 8080
    
    print("🚀 Starting Personal Finance App Download Server...")
    print(f"📱 Server running at: http://localhost:{PORT}")
    print("📥 Download page: http://localhost:{PORT}")
    print("🌐 Direct app access: http://localhost:{PORT}/finance-app-download/")
    print("📦 ZIP download: http://localhost:{PORT}/finance-app-v2.3.zip")
    print("\n💡 Press Ctrl+C to stop the server")
    print("=" * 60)
    
    try:
        with socketserver.TCPServer(("", PORT), DownloadHandler) as httpd:
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