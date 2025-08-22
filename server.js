const express = require('express');
const path = require('path');
const fs = require('fs');
const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files
app.use(express.static('public'));

// Create public directory if it doesn't exist
if (!fs.existsSync('public')) {
    fs.mkdirSync('public');
}

// Create a simple APK file (placeholder)
const apkContent = Buffer.from('PK\x03\x04', 'utf8'); // ZIP file header
fs.writeFileSync('public/AccountManager.apk', apkContent);

// Routes
app.get('/', (req, res) => {
    res.send(`
        <!DOCTYPE html>
        <html lang="si">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Account Manager App - APK Download</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }
                
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                }
                
                .container {
                    background: rgba(255, 255, 255, 0.1);
                    backdrop-filter: blur(10px);
                    border-radius: 20px;
                    padding: 40px;
                    text-align: center;
                    max-width: 500px;
                    width: 90%;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                }
                
                .app-icon {
                    width: 80px;
                    height: 80px;
                    background: linear-gradient(45deg, #10B981, #059669);
                    border-radius: 20px;
                    margin: 0 auto 20px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 40px;
                }
                
                h1 {
                    font-size: 28px;
                    margin-bottom: 10px;
                    font-weight: 600;
                }
                
                .subtitle {
                    font-size: 16px;
                    opacity: 0.9;
                    margin-bottom: 30px;
                }
                
                .features {
                    text-align: left;
                    margin: 30px 0;
                    background: rgba(255, 255, 255, 0.1);
                    padding: 20px;
                    border-radius: 15px;
                }
                
                .features h3 {
                    margin-bottom: 15px;
                    font-size: 18px;
                }
                
                .features ul {
                    list-style: none;
                }
                
                .features li {
                    margin: 8px 0;
                    padding-left: 20px;
                    position: relative;
                }
                
                .features li:before {
                    content: "✓";
                    position: absolute;
                    left: 0;
                    color: #10B981;
                    font-weight: bold;
                }
                
                .download-btn {
                    background: linear-gradient(45deg, #10B981, #059669);
                    color: white;
                    padding: 15px 30px;
                    border: none;
                    border-radius: 50px;
                    font-size: 18px;
                    font-weight: 600;
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-block;
                    margin: 20px 10px;
                    transition: transform 0.2s ease, box-shadow 0.2s ease;
                    box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3);
                }
                
                .download-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 15px 30px rgba(16, 185, 129, 0.4);
                }
                
                .instructions {
                    background: rgba(255, 255, 255, 0.1);
                    padding: 20px;
                    border-radius: 15px;
                    margin-top: 30px;
                    text-align: left;
                }
                
                .instructions h3 {
                    margin-bottom: 15px;
                    font-size: 18px;
                }
                
                .instructions ol {
                    padding-left: 20px;
                }
                
                .instructions li {
                    margin: 8px 0;
                }
                
                .version {
                    font-size: 14px;
                    opacity: 0.7;
                    margin-top: 20px;
                }
                
                .size {
                    font-size: 14px;
                    opacity: 0.8;
                    margin-top: 10px;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="app-icon">💰</div>
                <h1>Account Manager App</h1>
                <p class="subtitle">සිංහල මුදල් කළමනාකරණ ඇප් එක</p>
                
                <div class="features">
                    <h3>✨ Features:</h3>
                    <ul>
                        <li>🏦 Multi-Account Management</li>
                        <li>💰 Income & Expense Tracking</li>
                        <li>📊 Real-time Analytics</li>
                        <li>🔍 Search Functionality</li>
                        <li>💾 Local Storage</li>
                        <li>🎨 Beautiful Sinhala Interface</li>
                    </ul>
                </div>
                
                <a href="/AccountManager.apk" class="download-btn" download>
                    📱 Download APK
                </a>
                
                <div class="size">File Size: ~15 MB</div>
                <div class="version">Version: 1.0.0</div>
                
                <div class="instructions">
                    <h3>📋 Installation Instructions:</h3>
                    <ol>
                        <li>Download the APK file above</li>
                        <li>Enable "Install from Unknown Sources" in your Android settings</li>
                        <li>Open the downloaded APK file</li>
                        <li>Follow the installation prompts</li>
                        <li>Enjoy managing your accounts! 🎉</li>
                    </ol>
                </div>
            </div>
            
            <script>
                // Add download tracking
                document.querySelector('.download-btn').addEventListener('click', function() {
                    // You can add analytics here
                    console.log('APK download started');
                });
            </script>
        </body>
        </html>
    `);
});

app.get('/download', (req, res) => {
    res.download('public/AccountManager.apk', 'AccountManager.apk');
});

app.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
    console.log(`📱 APK Download available at: http://localhost:${PORT}`);
    console.log(`🌐 Direct APK link: http://localhost:${PORT}/AccountManager.apk`);
});