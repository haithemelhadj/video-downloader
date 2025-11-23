@echo off
:: Get the folder where this batch file is located
set "SCRIPT_DIR=%~dp0"
:: Enable delayed expansion
setlocal enabledelayedexpansion
:: init
title Smart YouTube video Downloader syvd
color 0A
:: code
echo =================================================================
echo downlaod yt-dlp at: https://github.com/yt-dlp/yt-dlp
echo run this batch file in the SAME FOLDER as the yt-dlp.exe
echo 
echo download ffmpeg essentials at: https://www.gyan.dev/ffmpeg/builds
echo it's recommended to put the ffmpeg in c:\ and rename it to ffmpeg 
echo =================================================================
echo        SMART YT-DLP DOWNLOADER
echo ============================================
echo.

:: --- Default values ---
set "DEFAULT_FORMAT=mp3"

set "DEFAULT_OUTPUT_DIR=%SCRIPT_DIR%Downloaded Videos"
::set "DEFAULT_OUTPUT_DIR=%USERPROFILE%\Downloads\Downloaded Videos"

::----------------------------------
:: Default FFmpeg path relative to this script
::---set "DEFAULT_FFMPEG_PATH=%SCRIPT_DIR%ffmpeg\bin"
::set "DEFAULT_FFMPEG_PATH=C:\ffmpeg\bin"
::----------------------------------

:: --- Ask for inputs (with defaults) ---
set /p VIDEO_URL=Enter the YouTube URL (video or playlist): 
if "%VIDEO_URL%"=="" (
    echo X You must enter a URL!
    exit /b
)
echo.

set /p FORMAT=Enter format (mp3/mp4) [Default: %DEFAULT_FORMAT%]: 
if "%FORMAT%"=="" set FORMAT=%DEFAULT_FORMAT%
echo.

set /p OUTPUT_DIR=Enter output folder [Default: %DEFAULT_OUTPUT_DIR%]: 
if "%OUTPUT_DIR%"=="" set OUTPUT_DIR=%DEFAULT_OUTPUT_DIR%
echo.


::----------------------------------
:: --- Set FFmpeg path relative to batch if not provided ---
set "DEFAULT_FFMPEG_PATH=%SCRIPT_DIR%ffmpeg\bin"
::set /p FFMPEG_PATH=Enter ffmpeg\bin folder [Default: %DEFAULT_FFMPEG_PATH%]: 
if "%FFMPEG_PATH%"=="" set FFMPEG_PATH=%DEFAULT_FFMPEG_PATH%
echo Using FFmpeg from: %FFMPEG_PATH%
::------------------*
if not exist "%FFMPEG_PATH%\ffmpeg.exe" (
    echo ❌ ffmpeg.exe not found in %FFMPEG_PATH%
    pause
    exit /b
)

::------------------*


::------------------------------------
:: --- Detect if URL is a playlist automatically ---
echo Detecting playlist or single video...
echo.
::echo %VIDEO_URL% | find /I "list=" >nul
echo "!VIDEO_URL!" | find /I "list=" >nul
if %errorlevel%==0 (
    set IS_PLAYLIST=true
    set PLAYLIST_FLAG=--yes-playlist
    echo V Detected a playlist.
) else (
    set IS_PLAYLIST=false
    set PLAYLIST_FLAG=--no-playlist
    echo * Detected a single video.
)
echo.


:: --- Determine format flags ---
if /I "%FORMAT%"=="mp3" (
    set FORMAT_FLAGS=-x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata
) else (
    set FORMAT_FLAGS=-f "bestvideo+bestaudio" --merge-output-format mp4 --add-metadata
)




:: --- Build output template ---
if /I "!IS_PLAYLIST!"=="true" (
    set "OUTPUT_TEMPLATE=!OUTPUT_DIR!\%%(playlist_index)s - %%(title)s.%%(ext)s"
) else (
    set "OUTPUT_TEMPLATE=!OUTPUT_DIR!\%%(title)s.%%(ext)s"
)
echo OUTPUT_TEMPLATE=!OUTPUT_TEMPLATE!

:: --- Ensure output folder exists ---
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: --- Summary ---
echo ============================================
echo Download Settings:
echo URL: %VIDEO_URL%
echo Playlist: %IS_PLAYLIST%
echo Format: %FORMAT%
echo Output Folder: %OUTPUT_DIR%
echo FFmpeg Path: %FFMPEG_PATH%
echo ============================================
echo.

:: --- Run yt-dlp ---
yt-dlp.exe %PLAYLIST_FLAG% %FORMAT_FLAGS% --ffmpeg-location "%FFMPEG_PATH%" --extractor-args "youtube:player_client=android" --ignore-errors --retries infinite -o "%OUTPUT_TEMPLATE%" "%VIDEO_URL%"
echo.
echo ============================================
echo ✅ Download process complete!
echo Files saved to: %OUTPUT_DIR%
echo ============================================

start "" "%OUTPUT_DIR%"
pause