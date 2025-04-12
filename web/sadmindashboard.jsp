<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vishu Pawar - Admin Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        :root {
            --primary-dark: #1a1a2e;
            --secondary-dark: #222;
            --accent-gradient: linear-gradient(45deg, #6a11cb, #2575fc);
            --text-light: #fff;
            --text-dark: #222;
            --card-bg-dark: #2c2c2c;
            --card-bg-light: #ffffff;
            --hover-color-dark: #6a11cb;
            --hover-color-light: #e0e0ff;
            --shadow-dark: rgba(255, 255, 255, 0.1);
            --shadow-light: rgba(0, 0, 0, 0.1);
            --transition-speed: 0.6s;
        }
        
        body {
            background-color: var(--primary-dark);
            color: var(--text-light);
            transition: background-color var(--transition-speed) ease-in-out, color var(--transition-speed) ease-in-out;
        }
        
        .light-mode {
            background-color: #f4f4f4;
            color: var(--text-dark);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.9);
            box-shadow: 0 4px 10px var(--shadow-dark);
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            transition: background-color var(--transition-speed) ease-in-out, box-shadow var(--transition-speed) ease-in-out;
        }
        
        .light-mode .header {
            background: rgba(240, 240, 240, 0.9);
            box-shadow: 0 4px 10px var(--shadow-light);
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            transition: 0.4s ease-in-out;
        }
        
        .logo:hover {
            text-shadow: 0 0 20px rgba(106, 17, 203, 0.8);
        }

        .theme-switch {
            display: flex;
            align-items: center;
            cursor: pointer;
            background: #333;
            border-radius: 30px;
            width: 80px;
            height: 35px;
            padding: 5px;
            transition: 0.4s ease-in-out;
            position: relative;
        }
        
        .theme-switch .slider {
            width: 30px;
            height: 30px;
            background: white;
            border-radius: 50%;
            position: absolute;
            left: 5px;
            transition: 0.4s ease-in-out;
        }
        
        .light-mode .theme-switch {
            background: #ddd;
        }
        
        .light-mode .slider {
            left: 45px;
        }

        .sidebar {
            position: fixed;
            top: 80px;
            left: 0;
            width: 250px;
            height: calc(100vh - 80px);
            background: var(--secondary-dark);
            padding-top: 20px;
            box-shadow: 4px 0 10px var(--shadow-dark);
            transition: background-color var(--transition-speed) ease-in-out, box-shadow var(--transition-speed) ease-in-out;
            overflow-y: auto;
            z-index: 900;
        }
        
        .light-mode .sidebar {
            background: #f0f0f0;
            box-shadow: 4px 0 10px var(--shadow-light);
        }

        .profile-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin-bottom: 20px;
        }

        .profile-picture {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 15px;
            overflow: hidden;
            border: 4px solid rgba(255, 255, 255, 0.2);
            cursor: pointer;
            position: relative;
            transition: border 0.3s ease;
        }
        
        .light-mode .profile-picture {
            background-color: rgba(0, 0, 0, 0.05);
            border: 4px solid rgba(0, 0, 0, 0.1);
        }

        .profile-picture input[type="file"] {
            display: none;
        }

        .profile-picture-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0,0,0,0.7);
            overflow: hidden;
            width: 100%;
            height: 0;
            transition: 0.5s ease;
        }

        .profile-picture:hover .profile-picture-overlay {
            height: 30%;
        }

        .profile-picture-overlay-text {
            color: white;
            font-size: 12px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .profile-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .profile-title {
            font-size: 14px;
            color: #b0b0b0;
            margin-bottom: 10px;
        }
        
        .light-mode .profile-title {
            color: #666;
        }
        
        .sidebar ul {
            list-style: none;
        }
        
        .sidebar ul li {
            padding: 15px 20px;
            transition: 0.3s;
            margin: 0 10px 8px 10px;
            border-radius: 8px;
        }
        
        .sidebar ul li a {
            text-decoration: none;
            color: var(--text-light);
            display: flex;
            align-items: center;
        }
        
        .light-mode .sidebar ul li a {
            color: var(--text-dark);
        }
        
        .sidebar ul li:hover {
            background: var(--hover-color-dark);
            cursor: pointer;
            transform: translateX(5px);
        }
        
        .light-mode .sidebar ul li:hover {
            background: var(--hover-color-light);
        }
        
        .sidebar ul li i {
            margin-right: 10px;
            font-size: 18px;
            width: 25px;
            text-align: center;
        }

        .content {
            margin-left: 270px;
            margin-top: 100px;
            padding: 20px;
            transition: margin var(--transition-speed) ease-in-out;
        }
        
        .welcome-section {
            position: relative;
            background: var(--secondary-dark);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: background-color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .welcome-section {
            background: #fff;
        }
        
        .welcome-section h1 {
            font-size: 2.2rem;
            margin-bottom: 15px;
            position: relative;
            z-index: 1;
        }
        
        .welcome-section p {
            font-size: 1.1rem;
            margin-bottom: 20px;
            max-width: 600px;
            position: relative;
            z-index: 1;
            color: #b0b0b0;
        }
        
        .light-mode .welcome-section p {
            color: #666;
        }
        
        .welcome-section .decorative-shape {
            position: absolute;
            right: -50px;
            top: -50px;
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background: var(--accent-gradient);
            opacity: 0.1;
            z-index: 0;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .dashboard-card {
            background: var(--card-bg-dark);
            border-radius: 12px;
            padding: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color var(--transition-speed) ease-in-out;
            position: relative;
            overflow: hidden;
            min-height: 180px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .light-mode .dashboard-card {
            background: var(--card-bg-light);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .light-mode .dashboard-card:hover {
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .dashboard-card-icon {
            position: absolute;
            top: -20px;
            right: -20px;
            font-size: 100px;
            color: rgba(255, 255, 255, 0.05);
            transition: color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .dashboard-card-icon {
            color: rgba(0, 0, 0, 0.03);
        }

        .card-title {
            font-size: 1.1rem;
            margin-bottom: 15px;
            font-weight: 500;
            color: #b0b0b0;
            position: relative;
            z-index: 1;
            transition: color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .card-title {
            color: #666;
        }

        .card-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--text-light);
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
            transition: color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .card-value {
            color: var(--text-dark);
        }

        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            color: white;
            position: relative;
            z-index: 1;
            overflow: hidden;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #2575fc, #6a11cb);
            transition: 0.5s;
            z-index: -1;
        }
        
        .btn:hover::before {
            left: 0;
        }
        
        .btn i {
            transition: transform 0.3s ease;
        }
        
        .btn:hover i {
            transform: translateX(5px);
        }

        .recent-activity {
            background: var(--card-bg-dark);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: background-color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .recent-activity {
            background: var(--card-bg-light);
        }
        
        .recent-activity h2 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 15px;
            transition: border-color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .recent-activity h2 {
            border-bottom: 2px solid rgba(0, 0, 0, 0.1);
        }

        .activity-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            transition: background-color 0.3s ease, border-color var(--transition-speed) ease-in-out;
        }
        
        .light-mode .activity-item {
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .activity-item:hover {
            background-color: rgba(255, 255, 255, 0.02);
            padding-left: 10px;
        }
        
        .light-mode .activity-item:hover {
            background-color: rgba(0, 0, 0, 0.02);
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-content {
            display: flex;
            align-items: center;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            background: var(--accent-gradient);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .activity-text {
            display: flex;
            flex-direction: column;
        }
        
        .activity-desc {
            font-weight: 500;
        }
        
        .activity-user {
            font-size: 0.85rem;
            color: #b0b0b0;
        }
        
        .light-mode .activity-user {
            color: #666;
        }
        
        .activity-time {
            font-size: 0.85rem;
            color: #b0b0b0;
        }
        
        .light-mode .activity-time {
            color: #666;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">Vishu Pawar - Admin Panel</div>
        <div class="theme-switch" onclick="toggleTheme()">
            <div class="slider"></div>
        </div>
    </header>

    <div class="sidebar">
        <div class="profile-section">
            <div class="profile-picture">
                <input type="file" id="profilePicture" accept="image/*">
                <label for="profilePicture">
                    <i class="fas fa-user fa-3x"></i>
                </label>
                <div class="profile-picture-overlay">
                    <div class="profile-picture-overlay-text">
                        Upload Picture
                    </div>
                </div>
            </div>
            <div class="profile-name">Vishu Pawar</div>
            <div class="profile-title">Administrator</div>
        </div>
        
        <ul>
            <li><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="#"><i class="fas fa-tasks"></i> Project Management</a></li>
            <li><a href="#"><i class="fas fa-chart-line"></i> Financial Tracking</a></li>
            <li><a href="labourmanage.jsp"><i class="fas fa-users"></i> Labour Management</a></li>
            <li><a href="#"><i class="fas fa-user-shield"></i> Team & User Roles</a></li>
            <li><a href="#"><i class="fas fa-file-alt"></i> Document Storage</a></li>
            <li><a href="#"><i class="fas fa-chart-bar"></i> Reports & Analytics</a></li>
            <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            <li><a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <div class="content">
        <div class="welcome-section">
            <div class="decorative-shape"></div>
            <h1>Welcome, Vishu</h1>
            <p>Here's what's happening with your projects today. Check the latest updates and manage your resources effectively.</p>
        </div>
        
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <i class="fas fa-users dashboard-card-icon"></i>
                <h3 class="card-title">Total Labourers</h3>
                <div class="card-value">154</div>
                <button class="btn">
                    View Details <i class="fas fa-arrow-right"></i>
                </button>
            </div>
            
            <div class="dashboard-card">
                <i class="fas fa-money-check-alt dashboard-card-icon"></i>
                <h3 class="card-title">Pending Payments</h3>
                <div class="card-value">₹450,000</div>
                <button class="btn">
                    Process Payments <i class="fas fa-arrow-right"></i>
                </button>
            </div>
            
            <div class="dashboard-card">
                <i class="fas fa-hard-hat dashboard-card-icon"></i>
                <h3 class="card-title">Active Projects</h3>
                <div class="card-value">7</div>
                <button class="btn">
                    Manage Projects <i class="fas fa-arrow-right"></i>
                </button>
            </div>
            
            <div class="dashboard-card">
                <i class="fas fa-calendar-check dashboard-card-icon"></i>
                <h3 class="card-title">Today's Attendance</h3>
                <div class="card-value">132/154</div>
                <button class="btn">
                    View Attendance <i class="fas fa-arrow-right"></i>
                </button>
            </div>
        </div>
        
        <div class="recent-activity">
            <h2>Recent Activity</h2>
            
            <div class="activity-item">
                <div class="activity-content">
                    <div class="activity-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <div class="activity-text">
                        <div class="activity-desc">New labourer added to Project Skyline</div>
                        <div class="activity-user">by Admin</div>
                    </div>
                </div>
                <div class="activity-time">2 hours ago</div>
            </div>
            
            <div class="activity-item">
                <div class="activity-content">
                    <div class="activity-icon">
                        <i class="fas fa-money-bill-wave"></i>
                    </div>
                    <div class="activity-text">
                        <div class="activity-desc">Payroll processed for February</div>
                        <div class="activity-user">by Finance Team</div>
                    </div>
                </div>
                <div class="activity-time">5 hours ago</div>
            </div>
            
            <div class="activity-item">
                <div class="activity-content">
                    <div class="activity-icon">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <div class="activity-text">
                        <div class="activity-desc">New project "Urban Heights" initiated</div>
                        <div class="activity-user">by Project Manager</div>
                    </div>
                </div>
                <div class="activity-time">Yesterday</div>
            </div>
            
            <div class="activity-item">
                <div class="activity-content">
                    <div class="activity-icon">
                        <i class="fas fa-file-signature"></i>
                    </div>
                    <div class="activity-text">
                        <div class="activity-desc">Contract signed with Supplier XYZ</div>
                        <div class="activity-user">by Procurement</div>
                    </div>
                </div>
                <div class="activity-time">2 days ago</div>
            </div>
        </div>
    </div>

    <script>
        function toggleTheme() {
            document.body.classList.toggle("light-mode");
        }
        
        // Profile picture upload functionality
        document.getElementById('profilePicture').addEventListener('change', function(event) {
            const file = event.target.files[0];
            const reader = new FileReader();

            reader.onload = function(e) {
                const profilePicture = document.querySelector('.profile-picture');
                const userIcon = profilePicture.querySelector('.fa-user');
                
                // Check if there's already an img element
                let img = profilePicture.querySelector('img');
                if (!img) {
                    img = document.createElement('img');
                    userIcon.style.display = 'none';
                    profilePicture.appendChild(img);
                }
                
                img.src = e.target.result;
                img.style.width = '100%';
                img.style.height = '100%';
                img.style.objectFit = 'cover';
            }

            reader.readAsDataURL(file);
        });
    </script>
</body>
</html>