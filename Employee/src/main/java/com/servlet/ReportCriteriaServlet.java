package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String criteria = request.getParameter("criteria");
        String value = request.getParameter("value");

        request.setAttribute("criteria", criteria);
        request.setAttribute("value", value);

        RequestDispatcher rd = request.getRequestDispatcher("ReportServlet");
        rd.forward(request, response);
    }
}
