<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #7b4397, #dc2430);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #ffffff;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            color: #333;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #dc2430;
            color: #fff;
            font-size: 1em;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #7b4397;
        }

        label {
            font-size: 1em;
            color: #fff;
            display: block;
            text-align: left;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Generate Employee Report</h2>
    <form action="report_result.jsp" method="post">
        <label for="reportType">Select Report Type:</label>
        <select name="reportType" required>
            <option value="namePrefix">Name starts with</option>
            <option value="years">More than N years of service</option>
            <option value="salary">Salary greater than</option>
        </select>

        <label for="value">Enter Value:</label>
        <input type="text" name="value" required />

        <input type="submit" value="Generate Report" />
    </form>
</div>

</body>
</html>
