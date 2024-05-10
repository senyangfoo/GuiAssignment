/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductService;

/**
 *
 * @author foose
 */
public class SearchAdminStaffProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String searchInput = request.getParameter("searchInput");
            String who = request.getParameter("who");
            ProductService product = new ProductService(em);

            List<Product> productList = product.findAll();

            List<Product> filteredList = new ArrayList<>();
            for (Product p : productList) {
                if (p.getProdName().toLowerCase().contains(searchInput.toLowerCase()) || p.getCategory().toLowerCase().contains(searchInput.toLowerCase()) || p.getProdId().toString().toLowerCase().contains(searchInput.toLowerCase())) {
                    filteredList.add(p);
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("productList", filteredList);

            if (who.equals("admin")) {
                response.sendRedirect("productTable.jsp");
            } else if (who.equals("staff")) {
                response.sendRedirect("StaffproductTable.jsp");
            }

        } catch (Exception ex) {
            Logger.getLogger(SearchAdminStaffProduct.class.getName()).log(Level.SEVERE, null, ex);
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
