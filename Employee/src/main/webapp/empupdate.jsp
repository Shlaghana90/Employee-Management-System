<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #7b4397, #dc2430);
            color: #fff;
            margin: 0;
            padding: 50px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label, input, select {
            margin: 10px 0;
            font-size: 1em;
        }

        input[type="number"], input[type="text"], input[type="date"], select {
            padding: 10px;
            border: none;
            border-radius: 8px;
            width: 100%;
            color: #333;
        }

        input[type="submit"] {
            background-color: #dc2430;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #7b4397;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .success {
            color: #00ff99;
        }

        .error {
            color: #ffd700;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Employee</h2>
    <form method="post">
        Emp No:
        <input type="number" name="empno" required>

        New Name:
        <input type="text" name="empName" required>

        New DoJ:
        <input type="date" name="doj" required>

        New Gender:
        <select name="gender">
            <option>Male</option>
            <option>Female</option>
        </select>

        New Salary:
        <input type="number" name="bsalary" step="0.01" required>

        <input type="submit" value="Update">
    </form>

    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String url = "jdbc:mysql://localhost:3306/Employee";
        String user = "root";
        String pass = "";

        int empno = Integer.parseInt(request.getParameter("empno"));
        String empName = request.getParameter("empName");
        String doj = request.getParameter("doj");
        String gender = request.getParameter("gender");
        double bsalary = Double.parseDouble(request.getParameter("bsalary"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, empName);
            ps.setDate(2, Date.valueOf(doj));
            ps.setString(3, gender);
            ps.setDouble(4, bsalary);
            ps.setInt(5, empno);

            int result = ps.executeUpdate();
            if (result > 0) {
                out.println("<p class='message success'>Employee Updated</p>");
            } else {
                out.println("<p class='message error'>Employee Not Found</p>");
            }
            con.close();
        } catch (Exception e) {
            out.println("<p class='message error'>Error: " + e.getMessage() + "</p>");
        }
    }
    %>
</div>
</body>
</html>
