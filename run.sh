#!/bin/bash
# SpotDL Web App Launcher for Mac/Linux

echo "SpotDL Web App Launcher (Mac/Linux)"
echo "====================================="
echo ""

# Check Python installation
echo "Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed."
    echo ""
    echo "Please install Python 3.8 or higher:"
    echo "  macOS: brew install python3"
    echo "  Ubuntu/Debian: sudo apt install python3 python3-pip"
    echo "  Fedora: sudo dnf install python3 python3-pip"
    exit 1
fi

python3 --version
echo "Python is installed"
echo ""

# Check for requirements.txt
if [ ! -f "requirements.txt" ]; then
    echo "Error: requirements.txt file not found"
    echo "Please make sure you are running this script from the correct directory"
    exit 1
fi

# Upgrade pip and install dependencies
echo "Upgrading pip..."
python3 -m pip install --upgrade pip --quiet

echo "Installing/checking dependencies..."
python3 -m pip install -r requirements.txt --quiet

if [ $? -ne 0 ]; then
    echo "Failed to install some dependencies"
    echo "Trying with user installation..."
    python3 -m pip install -r requirements.txt --user --quiet
    if [ $? -ne 0 ]; then
        echo "Dependency installation failed"
        echo "You may need to install dependencies manually:"
        echo "python3 -m pip install -r requirements.txt"
        exit 1
    fi
fi

echo "Dependencies installed successfully"
echo ""

# Install FFmpeg for SpotDL
echo "Checking FFmpeg installation for SpotDL..."
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg not found. Installing via SpotDL..."
    python3 -m spotdl --download-ffmpeg
    if [ $? -eq 0 ]; then
        echo "FFmpeg installed successfully"
    else
        echo "Warning: FFmpeg installation may have failed"
        echo "You may need to install it manually:"
        echo "  macOS: brew install ffmpeg"
        echo "  Ubuntu/Debian: sudo apt install ffmpeg"
    fi
else
    echo "FFmpeg is already installed"
fi
echo ""

# Load credentials from .env file
echo "Setting Spotify credentials..."
if [ -f ".env" ]; then
    echo "Reading credentials from .env file..."
    export $(cat .env | grep -v '^#' | xargs)
    echo "Credentials loaded successfully"
else
    echo "No .env file found"
    echo ""
    echo "Spotify credentials are required to use this app."
    echo "Please visit: https://developer.spotify.com/dashboard/"
    echo "1. Create a new app"
    echo "2. Copy your Client ID and Client Secret"
    echo ""
    read -p "Enter your Spotify Client ID: " SPOTIPY_CLIENT_ID
    read -p "Enter your Spotify Client Secret: " SPOTIPY_CLIENT_SECRET
    export SPOTIPY_CLIENT_ID
    export SPOTIPY_CLIENT_SECRET
    
    # Save to .env file
    echo "SPOTIPY_CLIENT_ID=$SPOTIPY_CLIENT_ID" > .env
    echo "SPOTIPY_CLIENT_SECRET=$SPOTIPY_CLIENT_SECRET" >> .env
    echo "Credentials saved to .env file for future use"
fi
echo ""

# Validate credentials
if [ -z "$SPOTIPY_CLIENT_ID" ] || [ -z "$SPOTIPY_CLIENT_SECRET" ]; then
    echo "Error: Spotify credentials are required"
    exit 1
fi

echo "Starting SpotDL Web App..."
echo "Server will run at: http://localhost:8000"
echo "Press Ctrl+C to stop"
echo ""

python3 app.py
