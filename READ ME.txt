============================================================
                SMART YOUTUBE VIDEO DOWNLOADER
                     (SYVD Bundle)
============================================================

Version: 1.0
Author: [Kuruttakao]
Date: 2025-10-21

This is a portable YouTube downloader bundle that uses
yt-dlp and FFmpeg to download videos or audio (MP3/MP4)
directly from YouTube. Everything you need is included
in one folder.

------------------------------------------------------------
BUNDLE CONTENTS
------------------------------------------------------------
- yt-dlp.exe               : The YouTube downloader executable
- ffmpeg\bin\ffmpeg.exe    : FFmpeg executable for audio/video processing
- Smart YouTube Video Downloader.bat
                            : The batch script to run downloads
- Downloaded Videos        : Default folder for downloaded files
- README.txt               : This file

------------------------------------------------------------
SYSTEM REQUIREMENTS
------------------------------------------------------------
- Windows 10 / 11
- Internet connection
- No installation required (portable bundle)

------------------------------------------------------------
HOW TO USE
------------------------------------------------------------
1. Make sure the bundle folder contains:
   - yt-dlp.exe
   - ffmpeg folder with bin\ffmpeg.exe
   - Smart YouTube Video Downloader.bat

2. Double-click 'Smart YouTube Video Downloader.bat' to run it.

3. Follow the prompts:
   - Enter the YouTube URL (video or playlist)
   - Select format (MP3 for audio or MP4 for video)
   - Choose output folder (default: 'Downloaded Videos' in this folder)
   - Confirm FFmpeg path (default: ffmpeg\bin in this folder)

4. The batch file will:
   - Detect if the URL is a playlist or single video
   - Download the requested format
   - Convert audio if necessary
   - Embed metadata and cover art for MP3s
   - Save files to the chosen output folder

5. When downloads finish, the output folder will open automatically.

------------------------------------------------------------
NOTES
------------------------------------------------------------
- Recommended to keep all files in the same folder to ensure
  paths are correct.
- The batch file automatically uses the FFmpeg included in
  the 'ffmpeg\bin' folder.
- If a URL contains special characters like "&list=", it
  should still work without issues.
- Default filenames include playlist index, title, and
  proper extension (.mp3 or .mp4).

------------------------------------------------------------
SUPPORT / TROUBLESHOOTING
------------------------------------------------------------
- Make sure yt-dlp.exe and ffmpeg.exe exist in the bundle.
- If downloads fail, check your internet connection.
- Ensure that the batch file is not moved outside the bundle
  folder if you rely on the relative paths.
- For latest yt-dlp updates: https://github.com/yt-dlp/yt-dlp
- For FFmpeg builds: https://www.gyan.dev/ffmpeg/builds

============================================================
ENJOY YOUR SMART YT-DLP DOWNLOADER BUNDLE!
============================================================
