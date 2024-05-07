/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Customer;
import model.userDA;
import jakarta.annotation.Resource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;

/**
 *
 * @author khtee
 */
public class RetrieveUser extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    int count = 3;
    String err = "Wrong Username Or Password!";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String password = request.getParameter("password");

            em.getEntityManagerFactory().getCache().evictAll();
            userDA user = new userDA(em);
            List<Customer> customer = user.findAll();

            for (Customer c : customer) {
                if (c.getCustName().equals(name) && c.getCustPassword().equals(password)) {
                    session.setAttribute("login", true);
                    session = request.getSession(true);
                    
                    session.setAttribute("id", c.getCustId());
                    session.setAttribute("name", c.getCustName());
                    session.setAttribute("password", c.getCustPassword());
                    session.setAttribute("mail", c.getCustEmail());

                    response.sendRedirect("index.jsp"); //homepage
                }
            }

            request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Username Or Password is wrong");
            request.getRequestDispatcher("Login.jsp").forward(request, response);

        } catch (Exception ex) {

            out.println("<h1 style='color: red'>Error accure at " + ex + " </h1>");

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
