const express = require('express');
const path = require('path');
const fs = require('fs');
const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files
app.use(express.static('.'));

// Serve the APK builder page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'apk-builder.html'));
});

// API endpoint to generate APK download link
app.post('/api/generate-apk', (req, res) => {
    try {
        // Simulate APK generation process
        const apkData = {
            id: Date.now().toString(),
            name: 'BudgetTrackerApp.apk',
            size: '25.6 MB',
            version: '1.0.0',
            downloadUrl: `/downloads/BudgetTrackerApp.apk`,
            qrCodeUrl: `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(`${req.protocol}://${req.get('host')}/downloads/BudgetTrackerApp.apk`)}`,
            expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000) // 7 days
        };
        
        res.json({
            success: true,
            data: apkData,
            message: 'APK download link generated successfully!'
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: 'Error generating APK download link',
            error: error.message
        });
    }
});

// Serve APK file for download
app.get('/downloads/:filename', (req, res) => {
    const filename = req.params.filename;
    const filePath = path.join(__dirname, 'downloads', filename);
    
    // Check if file exists
    if (fs.existsSync(filePath)) {
        res.download(filePath, filename, (err) => {
            if (err) {
                console.error('Error downloading file:', err);
                res.status(500).send('Error downloading file');
            }
        });
    } else {
        res.status(404).send('APK file not found. Please build the APK first.');
    }
});

// API endpoint to get build status
app.get('/api/build-status/:buildId', (req, res) => {
    const buildId = req.params.buildId;
    
    // Simulate build status
    const statuses = ['queued', 'building', 'completed', 'failed'];
    const randomStatus = statuses[Math.floor(Math.random() * statuses.length)];
    
    res.json({
        buildId,
        status: randomStatus,
        progress: randomStatus === 'building' ? Math.floor(Math.random() * 100) : (randomStatus === 'completed' ? 100 : 0),
        message: getStatusMessage(randomStatus)
    });
});

function getStatusMessage(status) {
    switch (status) {
        case 'queued':
            return 'Build is queued and will start soon...';
        case 'building':
            return 'Building your APK... This may take a few minutes.';
        case 'completed':
            return 'APK build completed successfully! You can now download it.';
        case 'failed':
            return 'Build failed. Please check your code and try again.';
        default:
            return 'Unknown status';
    }
}

// Create downloads directory if it doesn't exist
const downloadsDir = path.join(__dirname, 'downloads');
if (!fs.existsSync(downloadsDir)) {
    fs.mkdirSync(downloadsDir, { recursive: true });
}

app.listen(PORT, () => {
    console.log(`🚀 APK Builder Server running on http://localhost:${PORT}`);
    console.log(`📱 Open http://localhost:${PORT} in your browser to access the APK builder`);
    console.log(`📥 APK downloads will be available at http://localhost:${PORT}/downloads/`);
});