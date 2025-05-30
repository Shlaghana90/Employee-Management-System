package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8"); // Handle UTF-8 inputs

            int empno = Integer.parseInt(request.getParameter("empno").trim());
            String name = request.getParameter("empname").trim();
            Date doj = Date.valueOf(request.getParameter("doj").trim());
            String gender = request.getParameter("gender").trim();
            double salary = Double.parseDouble(request.getParameter("bsalary").trim());

            Employee emp = new Employee();
            boolean status = new EmployeeDAO().addEmployee(emp);

            request.setAttribute("message", status ? "✅ Employee added successfully!" : "❌ Failed to add employee.");
            RequestDispatcher rd = request.getRequestDispatcher("empadd.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("empadd.jsp");
            rd.forward(request, response);
        }
    }
}
