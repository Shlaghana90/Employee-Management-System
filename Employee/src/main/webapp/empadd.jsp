<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
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
        h2 {
            font-size: 2.5em;
            margin-bottom: 30px;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.3);
        }
        form {
            background: white;
            color: #7b4397;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 500px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px 10px;
            margin: 10px 0 20px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
        }
        input[type="submit"] {
            background-color: #dc2430;
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 10px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        input[type="submit"]:hover {
            background-color: #7b4397;
            transform: scale(1.05);
        }
        .message {
            margin-top: 20px;
            font-weight: bold;
            font-size: 1.2em;
        }
        .success {
            color: #28a745;
        }
        .error {
            color: #ffdddd;
        }
        a.back-link {
            margin-top: 20px;
            color: white;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Add New Employee</h2>
    <form method="post">
        Emp No:
        <input type="number" name="empno" required>
        Name:
        <input type="text" name="empName" required>
        Date of Joining:
        <input type="date" name="doj" required>
        Gender:
        <select name="gender" required>
            <option>Male</option>
            <option>Female</option>
        </select>
        Basic Salary:
        <input type="number" name="bsalary" step="0.01" required>
        <input type="submit" value="Add Employee">
    </form>

    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String url = "jdbc:mysql://localhost:3306/employee";
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
            PreparedStatement ps = con.prepareStatement("INSERT INTO Employee VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, empno);
            ps.setString(2, empName);
            ps.setDate(3, Date.valueOf(doj));
            ps.setString(4, gender);
            ps.setDouble(5, bsalary);

            int result = ps.executeUpdate();
            if (result > 0) {
                out.println("<p class='message success'> Employee Added Successfully!</p>");
            } else {
                out.println("<p class='message error'> Error Adding Employee.</p>");
            }
            con.close();
        } catch (Exception e) {
            out.println("<p class='message error'> Error: " + e.getMessage() + "</p>");
        }
    }
    %>

    <a href="index.jsp" class="back-link"> Back to Home</a>
</body>
</html>
