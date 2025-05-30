<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management Home</title>
    <style>
        body {
            font-family: Verdana, sans-serif;
            background: linear-gradient(135deg, #7b4397, #dc2430);
            color: white;
            margin: 0;
            padding: 50px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        h1 {
            font-size: 3em;
            margin-bottom: 40px;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.3);
        }
        nav {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            max-width: 600px;
            width: 100%;
        }
        a {
            background: white;
            color: #7b4397;
            padding: 20px 30px;
            border-radius: 12px;
            font-weight: 700;
            font-size: 1.2em;
            text-decoration: none;
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
            transition: background-color 0.3s ease, color 0.3s ease;
            flex: 1 1 200px;
            text-align: center;
        }
        a:hover {
            background-color: #dc2430;
            color: white;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        footer {
            margin-top: auto;
            font-size: 0.9em;
            opacity: 0.7;
            text-align: center;
            width: 100%;
            padding: 15px 0;
        }
    </style>
</head>
<body>
    <h1>Employee Management System</h1>
    <nav>
        <a href="empadd.jsp">Add Employee</a>
        <a href="empupdate.jsp">Update Employee</a>
        <a href="empdelete.jsp">Delete Employee</a>
        <a href="empdisplay.jsp">Display Employees</a>
        <a href="report_form.jsp">Reports</a>
    </nav>
    <footer>
        &copy; 2025 Your Company Name
    </footer>
</body>
</html>
