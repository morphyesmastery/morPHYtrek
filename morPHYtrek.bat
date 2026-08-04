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

:: --- Find Python: bundled runtime > beside us > MorPHYvenv beside us > PATH ---
set "PY=%ROOT%\runtime\python.exe"
if not exist "%PY%" set "PY=%ROOT%\python.exe"
if not exist "%PY%" set "PY=%ROOT%\MorPHYvenv\Scripts\python.exe"
if not exist "%PY%" set "PY=python"

:: --- REFRESH MORPHYTREK (this bundle only — title MORPHYTREK-PORTABLE,
::     NEVER matches the LIVE mouth whose title is exactly "morPHYtrek") ---
taskkill /F /FI "WINDOWTITLE eq MORPHYTREK-PORTABLE*" >nul 2>&1
timeout /t 1 >nul

:: --- Launch the mouth ---
start "MORPHYTREK-PORTABLE" "%PY%" "%ROOT%\morPHYtrek.py"

echo.
echo ============================================
echo   morPHYtrek is LIVE (The Voice Firewall)
echo   It makes its own queue folder: morphytrek_data\queue
echo ============================================
echo.
exit
