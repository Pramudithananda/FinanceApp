#!/bin/bash

echo ""
echo "=========================================="
echo " Personal Finance App - Installation"
echo " මුදල් කළමනාකරණ - ස්ථාපනය"
echo "=========================================="
echo ""

# Check if Python is available
if command -v python3 &> /dev/null; then
    echo "Python 3 found! Starting local server..."
    echo ""
    echo "Opening your finance app at: http://localhost:8000"
    echo "Press Ctrl+C to stop the server when done."
    echo ""
    
    # Try to open in browser
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:8000
    elif command -v open &> /dev/null; then
        open http://localhost:8000
    else
        echo "Please open http://localhost:8000 in your browser"
    fi
    
    python3 -m http.server 8000
    
elif command -v python &> /dev/null; then
    echo "Python found! Starting local server..."
    echo ""
    echo "Opening your finance app at: http://localhost:8000"
    echo "Press Ctrl+C to stop the server when done."
    echo ""
    
    # Try to open in browser
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:8000
    elif command -v open &> /dev/null; then
        open http://localhost:8000
    else
        echo "Please open http://localhost:8000 in your browser"
    fi
    
    python -m http.server 8000
    
elif command -v node &> /dev/null; then
    echo "Node.js found! Checking for serve..."
    
    if command -v serve &> /dev/null; then
        echo "Starting with serve..."
        echo ""
        echo "Opening your finance app..."
        echo "Press Ctrl+C to stop the server when done."
        echo ""
        serve -s .
    else
        echo "Installing serve globally..."
        npm install -g serve
        echo "Starting with serve..."
        echo ""
        serve -s .
    fi
    
else
    echo "Neither Python nor Node.js found."
    echo "Opening directly in browser..."
    echo ""
    echo "Note: For best experience, install Python or Node.js and run this script again."
    echo ""
    
    # Try to open in browser
    if command -v xdg-open &> /dev/null; then
        xdg-open index.html
    elif command -v open &> /dev/null; then
        open index.html
    else
        echo "Please open index.html in your browser manually"
    fi
fi