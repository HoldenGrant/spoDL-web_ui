
# SpotDL Web App

A modern web interface for downloading Spotify songs, playlists, albums, and artists with an integrated music player.

## ✨ Features

- 🎵 Download individual Spotify tracks
- 📋 Download entire playlists (auto-organized in folders)
- 💿 Download albums (auto-organized in folders)
- 🎤 Download artist discographies
- 🎚️ Multiple audio formats (MP3, M4A/AAC, WAV, FLAC, Opus)
- 📊 Adjustable bitrate options (128-320 kbps)
- 📝 Optional lyrics generation (.lrc files)
- 📥 Download manager with file history
- 🎨 Modern, responsive UI with Spotify theme
- ⚡ Real-time progress tracking with countdown timer
- 🎵 **Built-in mini music player** with progress bar and controls
- 📁 Automatic folder organization for playlists/albums
- 🖼️ **Automatic album artwork embedding**
- 🎧 In-browser audio playback with playlist support

## 🚀 Quick Start

### Windows

1. **Simply double-click `run.bat`** or run in Command Prompt:
   ```bat
   run.bat
   ```

The script will automatically:
- ✅ Check and install Python 3.11 if needed
- ✅ Install all required dependencies
- ✅ Download and setup FFmpeg via SpotDL
- ✅ Load Spotify credentials from `.env` file
- ✅ Prompt for credentials if `.env` doesn't exist
- ✅ Start the web server

**First-time installation:** If Python is installed for the first time, you'll be prompted to restart your computer. Simply run `run.bat` again after restart.

### Mac/Linux

1. **Open Terminal** and run:
   ```bash
   chmod +x run.sh
   ./run.sh
   ```

The script will automatically:
- ✅ Check Python 3 installation
- ✅ Install all required dependencies
- ✅ Setup FFmpeg for SpotDL
- ✅ Load Spotify credentials from `.env` file
- ✅ Prompt for credentials if `.env` doesn't exist
- ✅ Start the web server

### Access the App

After running the launcher script, open your browser to:
```
http://localhost:8000
```

## 🔑 Spotify API Setup

1. Visit [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/)
2. Click "Create App"
3. Fill in app name and description
4. Copy your **Client ID** and **Client Secret**

### Option 1: Use .env file (Recommended)
Create a `.env` file in the project folder:
```env
SPOTIPY_CLIENT_ID=your_client_id_here
SPOTIPY_CLIENT_SECRET=your_client_secret_here
```

The launcher scripts will automatically read this file.

### Option 2: Enter manually
If no `.env` file exists, the launcher will prompt you to enter credentials. They will be saved to `.env` for future use.

## 📦 Prerequisites

- **Python 3.8+** (automatically installed by run.bat on Windows)
- **FFmpeg** (automatically installed by the launcher scripts)
- **Internet connection** (for downloading from Spotify/YouTube)

All Python dependencies are automatically installed from `requirements.txt`:
- fastapi==0.103.0
- uvicorn==0.23.2
- python-multipart==0.0.6
- spotdl==4.4.3
- spotipy==2.24.0
- python-dotenv==1.0.0

## 💡 Usage

1. **Enter a Spotify URL or song name:**
   - Track: `https://open.spotify.com/track/...`
   - Playlist: `https://open.spotify.com/playlist/...`
   - Album: `https://open.spotify.com/album/...`
   - Artist: `https://open.spotify.com/artist/...`
   - Or just search: `Blinding Lights The Weeknd`

2. **Select download options:**
   - **Type:** Track, Playlist, Album, or Artist
   - **Format:** MP3, M4A (AAC), WAV, FLAC, or Opus
   - **Bitrate:** 128, 192, 256, or 320 kbps
   - **Lyrics:** Check to generate .lrc files

3. **Click "Start Download"**
   - Real-time progress updates
   - Countdown timer shows estimated completion time
   - Files appear in the downloaded files section

4. **Play or Download:**
   - 🎵 Click the **play button (▶)** to listen in-browser
   - 💾 Click **Download** to save locally
   - Files are saved in `downloads/` directory
   - Playlists/albums auto-organized in folders

## 🎵 Music Player Features

The built-in mini player includes:
- ▶️ Play/Pause controls
- ⏹️ Stop button
- ⏮️ Previous/Next track navigation
- 📊 Visual progress bar with click-to-seek
- ⏱️ Current time and duration display
- 🎨 Beautiful Spotify-themed design with animations
- 🔄 Auto-play next track when current ends
- 📱 Responsive design for mobile devices

## 📁 Project Structure

```
spodl/
├── app.py              # FastAPI backend server
├── index.html          # Frontend UI with music player
├── run.bat             # Windows launcher (auto-setup)
├── run.sh              # Mac/Linux launcher (auto-setup)
├── requirements.txt    # Python dependencies
├── .env                # Spotify credentials (create this)
├── .gitignore          # Git ignore file
├── downloads/          # Downloaded files directory (auto-created)
│   ├── Song.mp3        # Individual tracks
│   └── Playlist Name/  # Playlist folders
│       ├── Song1.mp3
│       └── Song2.mp3
└── README.md           # This file
```

## 🔧 Advanced Setup (Manual)

If you prefer manual setup instead of using the launcher scripts:

1. **Install Python 3.8+**
   - Windows: Download from [python.org](https://python.org)
   - Mac: `brew install python3`
   - Linux: `sudo apt install python3 python3-pip`

2. **Install FFmpeg**
   ```bash
   # Using SpotDL (recommended)
   spotdl --download-ffmpeg
   
   # Or install manually:
   # Windows: Download from ffmpeg.org
   # Mac: brew install ffmpeg
   # Linux: sudo apt install ffmpeg
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Create .env file** with your Spotify credentials

5. **Start the server**
   ```bash
   python app.py
   ```

6. **Open browser** to `http://localhost:8000`

## 🐛 Troubleshooting

### "Spotdl not initialized" error
- **Solution:** Install FFmpeg: `spotdl --download-ffmpeg`
- Or use the launcher scripts which do this automatically

### "Connection refused" error
- Make sure the server is running: `python app.py`
- Check that port 8000 is not already in use
- Try accessing `http://127.0.0.1:8000` instead

### Audio player not working
- Check browser console for errors
- Ensure files are in `downloads/` directory
- Try a different browser (Chrome/Edge recommended)

### Python not found after installation (Windows)
- Restart your computer after Python installation
- Run `run.bat` again

### Download speed is slow
- Depends on internet connection and source availability
- SpotDL searches multiple sources for best quality

### Files don't have album art
- The app uses `--force-update-metadata` and `--ytm-data` flags
- Some tracks may not have artwork available from sources
- Artwork is automatically embedded when available

### Permission errors
- **Windows:** Try running `run.bat` as administrator
- **Mac/Linux:** Ensure script is executable: `chmod +x run.sh`

## 🌐 API Endpoints

- `GET /` - Main HTML interface
- `GET /api/status/init` - Check if SpotDL is initialized
- `POST /api/download` - Start a download
- `GET /api/status/{download_id}` - Get download status and progress
- `GET /api/downloads` - List all downloaded files
- `GET /api/download/{filename}` - Stream or download a file

## ⚙️ Configuration

You can customize the app by editing `app.py`:

- `DOWNLOAD_DIR`: Change download location (default: `downloads/`)
- Server port: Modify `uvicorn.run()` parameters
- SpotDL options: Adjust download command flags

## 🎨 Features in Detail

### Automatic Organization
- **Playlists/Albums:** Created in named folders
- **Individual Tracks:** Saved in root `downloads/` directory
- **Folder Names:** Sanitized for filesystem compatibility

### Progress Tracking
- Real-time download status updates
- Per-song progress for playlists/albums
- Countdown timer with estimated completion time
- Visual progress bars

### Music Player
- **Inline Playback:** Play music directly in browser
- **Keyboard Controls:** Space to play/pause (when focused)
- **Seek Support:** Click progress bar to jump to position
- **Auto-play:** Automatically plays next track
- **Format Support:** MP3, M4A, FLAC, WAV, Opus

### Quality Options
- **Formats:** MP3 (most compatible), M4A/AAC (Apple), FLAC (lossless), WAV (uncompressed), Opus (efficient)
- **Bitrates:** 128 kbps (mobile), 192 kbps (standard), 256 kbps (high), 320 kbps (maximum)
- **Metadata:** Automatically embeds title, artist, album, artwork
- **Lyrics:** Optional .lrc file generation (synced lyrics)

## 🚀 Deployment

### Local Network Access

To access from other devices on your network:

1. Find your local IP address:
   ```bash
   # Windows
   ipconfig
   
   # Mac/Linux
   ifconfig
   ```

2. Edit `app.py` and change the host:
   ```python
   uvicorn.run(app, host="0.0.0.0", port=8000)
   ```

3. Access from other devices: `http://YOUR_IP:8000`

### Production Deployment

For production use with external access:

```bash
# Install production server
pip install gunicorn

# Run with gunicorn
gunicorn app:app --workers 4 --worker-class uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
```

**Security Note:** Add authentication and HTTPS for production deployments.

## 📝 Notes

- Requires active internet connection for Spotify/YouTube access
- **Copyright:** Only download content you have rights to use
- **Fair Use:** Don't overload servers with excessive requests
- **Quality:** Actual quality depends on source availability
- **FFmpeg:** Required for audio conversion and metadata embedding


## 🙏 Credits & Thanks

Special thanks to the creators and maintainers of these open source projects:

- [SpotDL](https://github.com/spotDL/spotify-downloader) — Spotify music downloader
- [FastAPI](https://github.com/tiangolo/fastapi) — Modern Python web framework
- [Uvicorn](https://www.uvicorn.org/) — Lightning-fast ASGI server
- [Spotipy](https://github.com/plamere/spotipy) — Spotify Web API wrapper
- [FFmpeg](https://ffmpeg.org/) — Multimedia framework for audio processing
- [Python](https://www.python.org/) — The language powering everything

This project would not be possible without their work and the open source community.

## 📄 License

MIT License - See individual projects for their licenses.

## ⚠️ Disclaimer

This tool is for educational purposes. Users are responsible for complying with copyright laws and Spotify's Terms of Service. Only download content you have the rights to use.

---

**Enjoy your music! 🎵**

For issues or questions, please check the Troubleshooting section or open an issue on the project repository.
