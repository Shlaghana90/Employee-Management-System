<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Employee</title>
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
            max-width: 550px;
            text-align: center;
        }

        h2, h3 {
            color: #fff;
            margin-bottom: 20px;
        }

        input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: none;
            border-radius: 8px;
            font-size: 1em;
        }

        input[type="number"] {
            background: #fff;
            color: #333;
        }

        input[type="submit"] {
            background: #dc2430;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #7b4397;
        }

        p {
            margin: 8px 0;
            font-size: 1.1em;
        }

        .message {
            font-weight: bold;
            margin-top: 20px;
        }

        .not-found {
            color: #ffd700;
        }

        .error {
            color: #ff4d4d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Display Employee</h2>
        <form method="post">
            Enter Employee No:
            <input type="number" name="empno" required>
            <input type="submit" value="Display">
        </form>

        <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String url = "jdbc:mysql://localhost:3306/Employee";
            String user = "root";
            String pass = "";

            int empno = Integer.parseInt(request.getParameter("empno"));

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pass);
                String sql = "SELECT * FROM Employee WHERE Empno=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, empno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>
                    <h3>Employee Details:</h3>
                    <p>Emp No: <%= rs.getInt("Empno") %></p>
                    <p>Name: <%= rs.getString("EmpName") %></p>
                    <p>Date of Joining: <%= rs.getDate("DoJ") %></p>
                    <p>Gender: <%= rs.getString("Gender") %></p>
                    <p>Salary: i<%= rs.getDouble("Bsalary") %></p>
        <%
                } else {
                    out.println("<p class='message not-found'>Employee not found.</p>");
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
