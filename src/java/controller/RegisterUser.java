/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.annotation.Resource;
import model.userDA;
import model.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.List;
import model.CustomerService;

/**
 *
 * @author khtee
 */
public class RegisterUser extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    private boolean exist = false;
    private boolean tempexist = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String mail = request.getParameter("mail");
            String password = request.getParameter("password");

            Customer user = new Customer(name, mail, password);
            userDA users = new userDA();
            userDA checkUser = new userDA(em);
            CustomerService customerService = new CustomerService(em);
            List<Customer> existCust = checkUser.findAll();
            for (Customer c : existCust) {
                if (c.getCustName().equals(name)) {
                    tempexist = true;
                    request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Username taken!!");
                    request.getRequestDispatcher("MainRegister.jsp").forward(request, response);

                } else {
                    exist = false;
                }
            }
            String confirmPass = request.getParameter("confirmPass");
            if (!password.equals(confirmPass)) {
                tempexist = true;
                request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Password not match!");
                request.getRequestDispatcher("MainRegister.jsp").forward(request, response);
            }
            if (password.equals(confirmPass)) {
                exist = false;
            }
            exist = tempexist;
            if (exist == false) {
                utx.begin();
                boolean success = users.addRecord(user);
                utx.commit();
                
                if (success == true) {
                    List<Customer> customerList = customerService.findByCustName(name);
                    int custId = 0;
                    for(Customer c : customerList){
                        if(c.getCustName().equals(name)){
                           custId = c.getCustId();
                           break;
                        }
                    }
                    
                    session.setAttribute("login", true);
                    session = request.getSession(true);
                    
                    session.setAttribute("customerId", custId);
                    session.setAttribute("name", name);
                    session.setAttribute("password", password);
                    session.setAttribute("mail", mail);

                    response.sendRedirect("index.jsp"); //Back to profile
                } else {
                    request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Error occurred!");
                    request.getRequestDispatcher("MainRegister.jsp").forward(request, response);
                }
            } else {
                tempexist = false;
                request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Error occurred!");
                request.getRequestDispatcher("MainRegister.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            out.println("Error: " + ex);
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
