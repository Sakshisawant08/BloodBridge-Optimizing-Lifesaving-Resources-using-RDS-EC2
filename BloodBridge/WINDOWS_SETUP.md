# BloodBridge - Windows Setup Guide (XAMPP)

## Step 1: Install XAMPP
1. Download XAMPP from: https://www.apachefriends.org/
2. Install XAMPP (default settings are fine)
3. Start XAMPP Control Panel
4. Start "Apache" and "MySQL" services

## Step 2: Extract BloodBridge
1. Extract BloodBridge.zip to C:\xampp\htdocs\BloodBridge\
   OR any folder like C:\Users\YourName\BloodBridge\

## Step 3: Install Python Dependencies
1. Open Command Prompt (CMD) or PowerShell
2. Go to BloodBridge folder:
   cd C:\Users\YourName\BloodBridge
3. Install dependencies:
   pip install -r requirements.txt

## Step 4: Setup Database (IMPORTANT)
### Method A: Using XAMPP Shell (Recommended)
1. Open XAMPP Control Panel
2. Click "Shell" button (bottom right)
3. In the shell, type:
   mysql -u root
4. Then run these commands:
   CREATE DATABASE bloodbridge_db;
   USE bloodbridge_db;
   source C:/Users/YourName/BloodBridge/database/schema.sql;
   EXIT;

### Method B: Using phpMyAdmin
1. Open browser: http://localhost/phpmyadmin
2. Click "New" (left sidebar)
3. Database name: bloodbridge_db
4. Click "Create"
5. Click on "bloodbridge_db" database
6. Click "Import" tab
7. Choose File: select database/schema.sql
8. Click "Go" (bottom)

## Step 5: Run the Application
1. Open Command Prompt
2. Go to BloodBridge folder:
   cd C:\Users\YourName\BloodBridge
3. Run:
   python app.py
4. Open browser:
   http://localhost:5000

## Login Credentials
| Role       | Email                     | Password  |
|------------|---------------------------|-----------|
| Admin      | admin@bloodbridge.com     | admin123  |
| Hospital   | citygen@hospital.com      | admin123  |
| Blood Bank | central@bloodbank.com     | admin123  |
| Donor      | john@email.com            | admin123  |

IMPORTANT: Select the correct ROLE on the login page before clicking Login!

## Troubleshooting
- If "mysql command not found", make sure XAMPP's MySQL is running
- If pip install fails, try: python -m pip install -r requirements.txt
- If port 5000 is busy, change port in app.py last line: app.run(port=5001)
