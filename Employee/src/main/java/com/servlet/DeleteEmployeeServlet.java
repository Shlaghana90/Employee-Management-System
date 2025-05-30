package com.servlet;

import com.dao.EmployeeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            boolean status = new EmployeeDAO().deleteEmployee(empno);

            request.setAttribute("message", status ? "Employee deleted successfully!" : "Failed to delete employee.");
            RequestDispatcher rd = request.getRequestDispatcher("empdelete.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
