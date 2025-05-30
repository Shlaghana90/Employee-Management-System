package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String criteria = (String) request.getAttribute("criteria");
            String value = (String) request.getAttribute("value");

            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> result = null;

            switch (criteria) {
                case "name":
                    result = dao.getEmployeesByNamePrefix(value);
                    break;
                case "experience":
                    result = dao.getEmployeesByExperience(Integer.parseInt(value));
                    break;
                case "salary":
                    result = dao.getEmployeesBySalary(Double.parseDouble(value));
                    break;
                default:
                    throw new IllegalArgumentException("Unknown report criteria");
            }

            request.setAttribute("reportList", result);
            RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
