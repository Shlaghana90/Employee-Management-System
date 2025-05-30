package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class UpdateEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String name = request.getParameter("empname");
            Date doj = Date.valueOf(request.getParameter("doj"));
            String gender = request.getParameter("gender");
            double salary = Double.parseDouble(request.getParameter("bsalary"));

            Employee emp = new Employee();
            boolean status = new EmployeeDAO().updateEmployee(emp);

            request.setAttribute("message", status ? "Employee updated successfully!" : "Failed to update employee.");
            RequestDispatcher rd = request.getRequestDispatcher("empupdate.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
