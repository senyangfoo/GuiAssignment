/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Abcong
 */
public class CheckOutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String postcode = request.getParameter("postcode");
            String city = request.getParameter("city");
            String unitNo = request.getParameter("unitNo");
            String state = request.getParameter("state");
            
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(address);
            if (unitNo != null && !unitNo.isEmpty()) {
                stringBuilder.append(", ").append(unitNo);
            }
            stringBuilder.append(", ").append(postcode).append(" ").append(city).append(", ").append(state);
            String fullAddress = stringBuilder.toString();

            // Set the merged address as a request attribute
            request.getSession().setAttribute("phoneNumber", phoneNumber);
            request.getSession().setAttribute("fullAddress", fullAddress);

            // Forward the request to the payment.jsp page
            response.sendRedirect("payment.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
