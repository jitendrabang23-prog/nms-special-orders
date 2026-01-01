@echo off
REM ========================================================
REM NMS Special Orders - GitHub Upload Automation Script
REM ========================================================
REM This script automatically pushes your NMS Special Orders
REM project files to GitHub Pages
REM ========================================================

echo.
echo ========================================================
echo NMS Special Orders - GitHub Upload Script
echo ========================================================
echo.

REM Check if Git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo Step 1: Creating workspace directory...
if not exist "C:\NMS_GitPush" mkdir C:\NMS_GitPush
cd /d C:\NMS_GitPush

echo.
echo Step 2: Cloning GitHub repository...
if exist nms-special-orders ( rmdir /s /q nms-special-orders )
git clone https://github.com/jitendrabang23-prog/nms-special-orders.git
cd nms-special-orders

echo.
echo Step 3: Clearing old files...
REM Keep only .git folder
for /d %%D in (*) do if not "%%D"==.git rmdir /s /q %%D
for %%F in (*) do if not "%%F"==.gitignore del %%F

echo.
echo Step 4: Copying your project files...
REM Copy all files from your project folder
xcopy "C:\Users\OS\Desktop\NMSSpecialOrdersApp\*" . /Y /E

echo.
echo Step 5: Verifying files...
if not exist "index.html" (
    echo ERROR: index.html not found!
    echo Please check your project folder path.
    pause
    exit /b 1
)
echo Files found:
dir /b

echo.
echo Step 6: Staging files for commit...
git add -A

echo.
echo Step 7: Committing files...
git commit -m "Push complete NMS Special Orders application - all features with offline support (PWA)"

echo.
echo Step 8: Pushing to GitHub...
git push -u origin main

echo.
echo ========================================================
echo SUCCESS! Your application is being deployed...
echo ========================================================
echo.
echo Your site will be live at:
echo https://jitendrabang23-prog.github.io/nms-special-orders/
echo.
echo This may take 30-60 seconds to appear.
echo.
echo On Mobile:
echo 1. Open the link in Chrome
echo 2. Tap Menu (3 dots)
echo 3. Select "Install app"
echo.
echo ========================================================
pause
