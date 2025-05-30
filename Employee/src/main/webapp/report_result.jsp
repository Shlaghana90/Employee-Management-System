<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #7b4397, #dc2430);
            margin: 0;
            padding: 40px;
            color: #fff;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ffffff;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin: auto;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(6px);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #fff;
        }

        th {
            background-color: rgba(0, 0, 0, 0.3);
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        p.message {
            text-align: center;
            font-size: 1.2em;
            color: yellow;
            margin-top: 20px;
        }

        p.error {
            text-align: center;
            font-size: 1.2em;
            color: #ffdddd;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%
String reportType = request.getParameter("reportType");
String value = request.getParameter("value");

String url = "jdbc:mysql://localhost:3306/Employee";
String user = "root";
String pass = "";

String sql = "";

if ("namePrefix".equals(reportType)) {
    sql = "SELECT * FROM Employee WHERE EmpName LIKE '" + value + "%'";
} else if ("years".equals(reportType)) {
    sql = "SELECT * FROM Employee WHERE YEAR(CURDATE()) - YEAR(DoJ) >= " + value;
} else if ("salary".equals(reportType)) {
    sql = "SELECT * FROM Employee WHERE Bsalary > " + value;
}

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    boolean hasData = false;
%>
    <h2>Report Results</h2>
    <table>
        <tr>
            <th>Emp No</th>
            <th>Name</th>
            <th>DoJ</th>
            <th>Gender</th>
            <th>Salary</th>
        </tr>
<%
    while (rs.next()) {
        hasData = true;
%>
        <tr>
            <td><%= rs.getInt("Empno") %></td>
            <td><%= rs.getString("EmpName") %></td>
            <td><%= rs.getDate("DoJ") %></td>
            <td><%= rs.getString("Gender") %></td>
            <td><%= rs.getDouble("Bsalary") %></td>
        </tr>
<%
    }

    if (!hasData) {
%>
        <p class="message">No matching records found.</p>
<%
    }

    con.close();
} catch (Exception e) {
%>
    <p class="error">Error: <%= e.getMessage() %></p>
<%
}
%>

</table>
</body>
</html>
