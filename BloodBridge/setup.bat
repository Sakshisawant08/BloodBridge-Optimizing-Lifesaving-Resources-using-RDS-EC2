@echo off
REM BloodBridge Setup Script for Windows
REM Optimizing Lifesaving Resources

echo ==========================================
echo   BloodBridge Setup
echo   Optimizing Lifesaving Resources
echo ==========================================
echo.

REM Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed. Please install Python 3.8+
    pause
    exit /b 1
)

echo [1/5] Python detected.
python --version

REM Check pip
pip --version >nul 2>&1
if errorlevel 1 (
    echo Error: pip is not installed. Please install pip.
    pause
    exit /b 1
)

echo.
echo [2/5] Installing Python dependencies...
pip install -r requirements.txt

if errorlevel 1 (
    echo Error: Failed to install dependencies.
    pause
    exit /b 1
)

echo.
echo [3/5] Dependencies installed successfully!
echo.
echo [4/5] Database Setup Instructions:
echo ----------------------------------------
echo Please run the following SQL commands in MySQL:
echo.
echo   CREATE DATABASE IF NOT EXISTS bloodbridge_db;
echo   USE bloodbridge_db;
echo   SOURCE database/schema.sql;
echo.
echo Or use MySQL Workbench to import schema.sql
echo ----------------------------------------
echo.

echo [5/5] Setup instructions complete!
echo.
echo ==========================================
echo   Setup Instructions Complete!
echo ==========================================
echo.
echo To start the application:
echo   python app.py
echo.
echo Then open: http://localhost:5000
echo.
echo Demo Login:
echo   Email: admin@bloodbridge.com
echo   Password: admin123
echo   Role: Admin
echo ==========================================
pause
