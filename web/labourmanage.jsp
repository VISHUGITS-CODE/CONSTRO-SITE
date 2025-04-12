<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>                                                            
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Labour Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 85%;
            margin: auto;
            overflow: hidden;
            padding: 20px;
        }
        .header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1rem;
        }
        .navigation {
            display: flex;
            justify-content: space-around;
            background-color: #444;
            padding: 1rem;
        }
        .navigation a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .navigation a:hover {
            background-color: #555;
        }
        .section {
            background-color: white;
            margin: 20px 0;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            display: inline-block;
            background-color: #333;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #444;
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .dashboard-card {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            border: 1px solid #e0e0e0;
        }
        .dashboard-card h3 {
            margin-bottom: 15px;
            color: #333;
        }
        .dashboard-card .metric {
            font-size: 2rem;
            font-weight: bold;
            color: #444;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Labour Management System</h1>
        </div>
        
        <div class="navigation">
            <a href="#dashboard">Dashboard</a>
            <a href="#attendance">Attendance</a>
            <a href="#payment">Payroll</a>
            <a href="#labourmanagement">Labour Management</a>
            <a href="#addlabour">Add Labour</a>
            <a href="#reports">Reports</a>
        </div>

        <!-- Dashboard Section -->
        <div id="dashboard" class="section">
            <h2>Workforce Dashboard</h2>
            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <h3>Total Labours</h3>
                    <div class="metric">-</div>
                </div>
                <div class="dashboard-card">
                    <h3>Today's Attendance</h3>
                    <div class="metric">-</div>
                </div>
                <div class="dashboard-card">
                    <h3>Pending Payments</h3>
                    <div class="metric">-</div>
                </div>
                <div class="dashboard-card">
                    <h3>Active Projects</h3>
                    <div class="metric">-</div>
                </div>
            </div>
        </div>

        <!-- Attendance Section -->
        <div id="attendance" class="section">
            <h2>Advanced Attendance Management</h2>
            <form action="AdvancedAttendanceServlet" method="post">
                <div class="form-group">
                    <label>Project Site</label>
                    <select name="project_site" required>
                        <option value="">Select Project Site</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Attendance Type</label>
                    <select name="attendance_type" required>
                        <option value="">Select Attendance Type</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Work Hours</label>
                    <input type="number" name="work_hours" min="0" max="16" step="0.5" required>
                </div>
                <div class="form-group">
                    <label>Performance Notes</label>
                    <textarea name="performance_notes" rows="3"></textarea>
                </div>
                <button type="submit" class="btn">Submit Attendance</button>
            </form>
        </div>

        <!-- Payroll Section -->
        <div id="payment" class="section">
            <h2>Comprehensive Payroll Management</h2>
            <form action="PayrollServlet" method="post">
                <div class="form-group">
                    <label>Salary Calculation Period</label>
                    <select name="calculation_period" required>
                        <option value="">Select Calculation Period</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Salary Components</label>
                    <div>
                        <input type="number" name="base_salary" placeholder="Base Salary" required>
                        <input type="number" name="overtime_pay" placeholder="Overtime Pay">
                        <input type="number" name="bonus" placeholder="Performance Bonus">
                    </div>
                </div>
                <div class="form-group">
                    <label>Deductions</label>
                    <div>
                        <input type="number" name="pf_contribution" placeholder="PF Contribution">
                        <input type="number" name="tax_deduction" placeholder="Tax Deduction">
                        <input type="number" name="other_deductions" placeholder="Other Deductions">
                    </div>
                </div>
                <button type="submit" class="btn">Calculate Payroll</button>
            </form>
        </div>

        <!-- Labour Management Section -->
        <div id="labourmanagement" class="section">
            <h2>Labour Skill and Performance Tracking</h2>
            <form action="SkillManagementServlet" method="post">
                <div class="form-group">
                    <label>Skill Assessment</label>
                    <select name="skill_category" required>
                        <option value="">Select Skill Category</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Skill Rating</label>
                    <select name="skill_rating" required>
                        <option value="">Select Skill Rating</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Training Recommendation</label>
                    <textarea name="training_notes" rows="3"></textarea>
                </div>
                <button type="submit" class="btn">Update Skill Profile</button>
            </form>
        </div>

        <!-- Add New Labour Section -->
        <div id="addlabour" class="section">
            <h2>Add New Labour</h2>
            <form action="AddLabourServlet" method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="full_name" required>
                </div>
                <div class="form-group">
                    <label>Contact Number</label>
                    <input type="tel" name="contact_number" required>
                </div>
                <div class="form-group">
                    <label>Daily Rate</label>
                    <input type="number" name="daily_rate" required>
                </div>
                <div class="form-group">
                    <label>Skill Category</label>
                    <select name="skill_category">
                        <option value="">Select Skill Category</option>
                        <option value="mason">Mason</option>
                        <option value="carpenter">Carpenter</option>
                        <option value="helper">Helper</option>
                        <option value="electrician">Electrician</option>
                    </select>
                </div>
                <button type="submit" class="btn">Add Labour</button>
            </form>
        </div>

        <!-- Reporting Section -->
        <div id="reports" class="section">
            <h2>Advanced Reporting</h2>
            <form action="ReportGenerationServlet" method="post">
                <div class="form-group">
                    <label>Report Type</label>
                    <select name="report_type" required>
                        <option value="">Select Report Type</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Date Range</label>
                    <input type="date" name="start_date" required>
                    <input type="date" name="end_date" required>
                </div>
                <div class="form-group">
                    <label>Export Format</label>
                    <select name="export_format">
                        <option value="">Select Export Format</option>
                    </select>
                </div>
                <button type="submit" class="btn">Generate Report</button>
            </form>
        </div>
    </div>
</body>
</html>