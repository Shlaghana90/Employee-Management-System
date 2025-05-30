package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayEmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Employee> empList = new EmployeeDAO().getEmployeesBySalary(0); // Get all
            request.setAttribute("employeeList", empList);
            RequestDispatcher rd = request.getRequestDispatcher("empdisplay.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
