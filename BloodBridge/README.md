# BloodBridge: Optimizing Lifesaving Resources

> **A Cloud-Native Blood Donation Management System**
> 
> Built with Python Flask, MySQL, and AWS Architecture Concepts

---

## Project Overview

**BloodBridge** is a full-stack healthcare web application designed to optimize blood donation and emergency blood request management. The system connects four key stakeholders - **Administrators**, **Donors**, **Hospitals**, and **Blood Bank Managers** - through a unified cloud-powered platform.

This project demonstrates:
- Modern web application development with Flask
- MySQL database design and management
- Professional healthcare UI/UX design
- AWS Cloud Architecture concepts (EC2 + RDS)
- Multi-role authentication and session management
- Real-time inventory tracking and analytics

---

## AWS Cloud Architecture

```
Users (Web/Mobile)
    |
    v
Route 53 (DNS + Health Checks)
    |
    v
CloudFront (CDN + SSL/TLS)
    |
    v
AWS WAF + Shield (DDoS Protection)
    |
    v
Application Load Balancer (ALB)
    |
    v
EC2 Auto-Scaling Group (Flask App)
    |
    v
RDS MySQL (Multi-AZ + Backups)
```

**Architecture Highlights:**
- **EC2**: Auto-scaling compute instances running the Flask application
- **RDS**: Managed MySQL database with Multi-AZ deployment for high availability
- **ALB**: Application Load Balancer for traffic distribution
- **CloudFront**: Content delivery network with edge caching
- **WAF + Shield**: Web application firewall and DDoS protection
- **VPC**: Virtual private cloud with security groups and NACLs
- **CloudWatch**: Monitoring and logging

---

## Features

### 1. Authentication System
- Multi-role login (Admin, Donor, Hospital, Blood Bank Manager)
- Secure password hashing with Werkzeug
- Session-based authentication
- Flash messaging system

### 2. Admin Dashboard
- System overview with analytics charts
- User management (view all users and donors)
- Blood request management (approve/reject/fulfill)
- Real-time inventory monitoring
- Dashboard statistics and trends

### 3. Donor Dashboard
- Personal profile management
- Donation eligibility checker (56-day rule)
- Upcoming blood drives listing
- Matching blood requests notification
- Donation history tracking
- Blood drive scheduling

### 4. Hospital Dashboard
- Emergency blood request creation
- Request status tracking
- Available donors listing
- Blood inventory overview
- Priority-based request system (Low/Medium/High/Critical)

### 5. Blood Bank Dashboard
- Real-time inventory management
- Stock update (add/remove units)
- Low stock alerts and warnings
- All requests overview
- Blood group-wise stock tracking

### 6. Public Pages
- Home page with live statistics
- Emergency requests listing
- Public blood inventory view
- AWS Architecture documentation
- Contact page

---

## Technology Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | HTML5, CSS3, JavaScript |
| **Backend** | Python 3.8+, Flask |
| **Database** | MySQL 8.0 |
| **ORM/DB** | Flask-MySQLdb |
| **Security** | Werkzeug (password hashing) |
| **Charts** | Chart.js |
| **Icons** | Font Awesome 6 |
| **Fonts** | Google Fonts (Inter, Poppins) |
| **Cloud** | AWS EC2, RDS (architecture demo) |

---

## Project Structure

```
BloodBridge/
├── app.py                          # Main Flask application
├── requirements.txt                # Python dependencies
├── README.md                       # Project documentation
│
├── templates/                      # HTML Templates
│   ├── base.html                   # Base template with navbar/footer
│   ├── index.html                  # Home page
│   ├── login.html                  # Login page
│   ├── register.html               # Donor registration
│   ├── about.html                  # About & Architecture
│   ├── contact.html                # Contact page
│   ├── emergency.html              # Emergency requests
│   ├── inventory.html              # Public inventory
│   ├── 404.html                    # Error page
│   ├── 500.html                    # Error page
│   │
│   ├── admin/                      # Admin templates
│   │   ├── dashboard.html
│   │   ├── users.html
│   │   ├── requests.html
│   │   └── inventory.html
│   │
│   ├── donor/                      # Donor templates
│   │   ├── dashboard.html
│   │   └── profile.html
│   │
│   ├── hospital/                   # Hospital templates
│   │   ├── dashboard.html
│   │   └── request_blood.html
│   │
│   └── bloodbank/                  # Blood Bank templates
│       └── dashboard.html
│
├── static/                         # Static assets
│   ├── css/
│   ├── js/
│   └── images/
│
└── database/
    └── schema.sql                  # Database schema + sample data
```

---

## Setup Instructions

### Prerequisites
- Python 3.8 or higher
- MySQL 8.0 (via XAMPP, WAMP, or standalone)
- pip (Python package manager)
- Git (optional)

### Step 1: Clone/Download the Project
```bash
cd BloodBridge
```

### Step 2: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Setup MySQL Database

**Option A: Using XAMPP/MySQL Workbench**
1. Start MySQL service in XAMPP Control Panel
2. Open phpMyAdmin or MySQL Workbench
3. Create a new database: `bloodbridge_db`
4. Import the schema file:
```sql
USE bloodbridge_db;
SOURCE database/schema.sql;
```

**Option B: Using MySQL Command Line**
```bash
mysql -u root -p
```
```sql
CREATE DATABASE bloodbridge_db;
USE bloodbridge_db;
SOURCE database/schema.sql;
EXIT;
```

### Step 4: Configure Database Connection

Edit `app.py` and update the MySQL configuration:

```python
# Local Development (default)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'bloodbridge_db'

# For AWS RDS (production)
# app.config['MYSQL_HOST'] = 'your-rds-endpoint.amazonaws.com'
# app.config['MYSQL_USER'] = 'admin'
# app.config['MYSQL_PASSWORD'] = 'your-password'
# app.config['MYSQL_DB'] = 'bloodbridge_db'
```

### Step 5: Run the Application
```bash
python app.py
```

The application will start at: **http://localhost:5000**

---

## Demo Credentials

### Admin Login
- **Email:** `admin@bloodbridge.com`
- **Password:** `admin123`
- **Role:** Select "Admin" on login page

### Sample Hospital Logins
- **City General Hospital:** `citygen@hospital.com` / `admin123`
- **St. Mary Medical Center:** `stmary@hospital.com` / `admin123`
- **Metro Emergency Hospital:** `metro@hospital.com` / `admin123`

### Sample Blood Bank Login
- **Central Blood Bank:** `central@bloodbank.com` / `admin123`

### Sample Donor Logins
- **John Smith:** `john@email.com` / `admin123`
- **Sarah Johnson:** `sarah@email.com` / `admin123`

> **Note:** All sample accounts use the same password `admin123` for demonstration purposes.

---

## AWS Deployment Guide (For Presentation)

### Step 1: Launch EC2 Instance
1. Go to AWS EC2 Console
2. Launch Instance: Amazon Linux 2 / Ubuntu 20.04
3. Instance Type: t3.medium
4. Configure Security Group:
   - SSH (22)
   - HTTP (80)
   - HTTPS (443)
   - Custom TCP (5000) - for development

### Step 2: Setup RDS Database
1. Go to AWS RDS Console
2. Create MySQL 8.0 database
3. Enable Multi-AZ for high availability
4. Configure Security Group to allow EC2 access
5. Note the endpoint URL

### Step 3: Deploy Application
```bash
# SSH into EC2
ssh -i your-key.pem ec2-user@your-ec2-ip

# Install dependencies
sudo yum update -y
sudo yum install python3 python3-pip mysql-devel -y

# Clone and setup
git clone <your-repo>
cd BloodBridge
pip3 install -r requirements.txt

# Update app.py with RDS endpoint
# Run with Gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### Step 4: Setup ALB and Route 53
1. Create Target Group pointing to EC2 instances
2. Create Application Load Balancer
3. Configure Route 53 DNS records
4. Setup SSL certificate with ACM

---

## Database Schema

### Tables
1. **users** - Admin, Hospital, Blood Bank accounts
2. **donors** - Registered blood donors
3. **blood_requests** - Emergency blood requests
4. **inventory** - Blood stock levels
5. **blood_drives** - Upcoming donation events
6. **donation_history** - Donation records

### Views
- `vw_inventory_status` - Stock status overview
- `vw_donor_eligibility` - Donor eligibility checker

---

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/inventory` | GET | Get inventory data (JSON) |
| `/api/stats` | GET | Get dashboard statistics |
| `/api/request_stats` | GET | Get request status counts |

---

## UI/UX Features

- **Theme:** Red + White + Dark Blue healthcare theme
- **Animations:** Fade-in, slide-in, heartbeat, floating elements
- **Glassmorphism:** Frosted glass effects on hero sections
- **Responsive:** Mobile-first design with breakpoints
- **Charts:** Chart.js for data visualization
- **Icons:** Font Awesome 6 pro icons
- **Badges:** Color-coded status indicators
- **Cards:** Modern card-based layouts
- **Tables:** Professional data tables with hover effects

---

## Security Features

- Password hashing with Werkzeug (PBKDF2)
- Session-based authentication
- Role-based access control
- SQL injection prevention via parameterized queries
- XSS protection via Jinja2 auto-escaping
- CSRF protection ready (can be added with Flask-WTF)

---

## Future Enhancements

- [ ] Email notifications for critical requests
- [ ] SMS alerts for donors
- [ ] Mobile app (React Native / Flutter)
- [ ] AI-powered demand prediction
- [ ] Blockchain-based donation tracking
- [ ] Integration with hospital EMR systems
- [ ] Real-time chat between stakeholders
- [ ] Geolocation-based donor matching

---

## License

This project is built for **educational and demonstration purposes**.

---

## Credits

- **Framework:** Flask (Pallets Projects)
- **Database:** MySQL (Oracle)
- **Cloud:** Amazon Web Services (AWS)
- **Icons:** Font Awesome
- **Charts:** Chart.js
- **Fonts:** Google Fonts (Inter, Poppins)

---

## Contact

For questions or support:
- Email: contact@bloodbridge.com
- Phone: +1 (555) 0100
- Address: 123 Healthcare Avenue, New York, NY 10001

---

**Built with passion for saving lives.**
