@echo off
:: ============================================================
::   morPHYtrek — The Voice Firewall (Portable, for the world)
::   The MOUTH. Listens, narrates (Piper), creates its OWN queue
::   folder (morphytrek_data\queue) next to itself. One queue.
::   Its own. Nothing else.
::   NOTHING hardcoded. Works from ANY folder on ANY Windows PC.
::   Title MORPHYTREK-PORTABLE so refresh NEVER kills the live mouth.
:: ============================================================
cd /d "%~dp0"
set "ROOT=%~dp0"
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

:: --- Strip environment pollution FIRST (Hermes injects PYTHONPATH) ---
set PYTHONPATH=
set PYTHONHOME=
set VIRTUAL_ENV=

:: --- Python: the bundled runtime, ALWAYS. No interpreter swaps.
::     (SALE BUILD 2026-10-16: no system-python fallback. If the bundled
::     runtime is missing the bundle is incomplete — say so and stop,
::     never silently run some other python the buyer never asked for.)
set "PY=%ROOT%\runtime\python.exe"
if not exist "%PY%" (
    echo.
    echo ============================================
    echo   runtime\python.exe NOT FOUND.
    echo   The bundled Python runtime is missing —
    echo   the folder was not copied completely.
    echo   Re-download / re-extract the whole folder.
    echo ============================================
    pause
    exit /b 1
)

:: --- DEPENDENCY CHECK (first-run installer, standard behavior) ---
::     For each module: if the bundled python can import it, do nothing.
::     If it can't, install it. Skips silently when everything is
::     already present (normal boot).
::     (SALE BUILD 2026-10-16: get-pip bootstrap removed — pip ships
::     inside the bundled runtime; the old line referenced a file that
::     is not part of this bundle.)
echo Checking dependencies...
"%PY%" -c "import sounddevice"  2>nul || "%PY%" -m pip install --quiet --disable-pip-version-check sounddevice  2>nul
"%PY%" -c "import faster_whisper" 2>nul || "%PY%" -m pip install --quiet --disable-pip-version-check faster_whisper 2>nul
"%PY%" -c "import pyperclip"   2>nul || "%PY%" -m pip install --quiet --disable-pip-version-check pyperclip   2>nul
"%PY%" -c "import pyautogui"   2>nul || "%PY%" -m pip install --quiet --disable-pip-version-check pyautogui   2>nul
"%PY%" -c "import pynput"      2>nul || "%PY%" -m pip install --quiet --disable-pip-version-check pynput      2>nul
echo Dependencies OK.

:: --- REFRESH MORPHYTREK (this bundle only — title MORPHYTREK-PORTABLE,
::     NEVER matches the LIVE mouth whose title is exactly "morPHYtrek") ---
taskkill /F /FI "WINDOWTITLE eq MORPHYTREK-PORTABLE*" >nul 2>&1
timeout /t 1 >nul

:: --- WAIT FOR THE SINGLE-INSTANCE PORT TO CLEAR (operator order 2026-10-16,
::     root cause of "the pill kills morPHYtrek but never restarts it"):
::     the mouth locks port 47841. When the pill taskkills the tree, the
::     socket can linger a few seconds. If the bat relaunches immediately,
::     the new mouth fails to bind, prints "Already running. Exiting." and
::     dies. Wait until the port is FREE before launching. ---
set /a _tries=0
:waitport
powershell -NoProfile -Command "exit [int](-not (Get-NetTCPConnection -LocalPort 47841 -State Listen -ErrorAction SilentlyContinue))" >nul 2>&1
if %errorlevel%==0 (
    set /a _tries+=1
    if %_tries% geq 20 goto launch
    timeout /t 1 >nul
    goto waitport
)

:launch
:: --- Launch the mouth DIRECTLY in this window (visible, labelled).
::     If it crashes, the error stays on screen so you can read it.
::     No hidden windows. No flash-and-close. Ever.
title MORPHYTREK-PORTABLE
"%PY%" "%ROOT%\morPHYtrek.py"

:: --- If we reach here, morPHYtrek exited. Keep the window open on crash
::     so the error is readable. Normal shutdown (Ctrl+C / window close)
::     also lands here.
if errorlevel 1 (
    echo.
    echo ============================================
    echo   morPHYtrek STOPPED with an error (code %errorlevel%)
    echo   The error is above. Window stays open.
    echo ============================================
    pause
)
exit
