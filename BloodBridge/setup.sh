#!/bin/bash
# BloodBridge Setup Script
# Run this script to set up the project automatically

echo "=========================================="
echo "  BloodBridge Setup"
echo "  Optimizing Lifesaving Resources"
echo "=========================================="
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed. Please install Python 3.8+"
    exit 1
fi

echo "[1/5] Python version:"
python3 --version

# Check pip
if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 is not installed. Please install pip."
    exit 1
fi

echo ""
echo "[2/5] Installing Python dependencies..."
pip3 install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "Error: Failed to install dependencies."
    exit 1
fi

echo ""
echo "[3/5] Dependencies installed successfully!"
echo ""
echo "[4/5] Database Setup Instructions:"
echo "----------------------------------------"
echo "Please run the following SQL commands in MySQL:"
echo ""
echo "  CREATE DATABASE IF NOT EXISTS bloodbridge_db;"
echo "  USE bloodbridge_db;"
echo "  SOURCE database/schema.sql;"
echo ""
echo "Or use: mysql -u root -p < database/schema.sql"
echo "----------------------------------------"
echo ""

# Check if MySQL is running
if command -v mysql &> /dev/null; then
    echo "[5/5] MySQL detected. Attempting auto-setup..."

    read -p "Enter MySQL username (default: root): " db_user
    db_user=${db_user:-root}

    read -sp "Enter MySQL password (press Enter if empty): " db_pass
    echo ""

    if [ -z "$db_pass" ]; then
        mysql -u "$db_user" -e "CREATE DATABASE IF NOT EXISTS bloodbridge_db;" 2>/dev/null
        if [ $? -eq 0 ]; then
            mysql -u "$db_user" bloodbridge_db < database/schema.sql
            echo "Database setup complete!"
        else
            echo "Could not auto-setup database. Please run manually."
        fi
    else
        mysql -u "$db_user" -p"$db_pass" -e "CREATE DATABASE IF NOT EXISTS bloodbridge_db;" 2>/dev/null
        if [ $? -eq 0 ]; then
            mysql -u "$db_user" -p"$db_pass" bloodbridge_db < database/schema.sql
            echo "Database setup complete!"
        else
            echo "Could not auto-setup database. Please run manually."
        fi
    fi
else
    echo "[5/5] MySQL not detected. Please install MySQL and run schema.sql manually."
fi

echo ""
echo "=========================================="
echo "  Setup Complete!"
echo "=========================================="
echo ""
echo "To start the application:"
echo "  python3 app.py"
echo ""
echo "Then open: http://localhost:5000"
echo ""
echo "Demo Login:"
echo "  Email: admin@bloodbridge.com"
echo "  Password: admin123"
echo "  Role: Admin"
echo "=========================================="
