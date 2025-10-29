@echo off
echo.
echo ==========================================
echo  Personal Finance App - Installation
echo  මුදල් කළමනාකරණ - ස්ථාපනය
echo ==========================================
echo.

echo Checking if Python is available...
python --version >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo Python found! Starting local server...
    echo.
    echo Opening your finance app at: http://localhost:8000
    echo Press Ctrl+C to stop the server when done.
    echo.
    start http://localhost:8000
    python -m http.server 8000
) else (
    echo Python not found. Opening directly in browser...
    echo.
    echo Note: For best experience, install Python and run this script again.
    echo Or install Node.js and use: npm install -g serve, then: serve -s .
    echo.
    start index.html
)

pause