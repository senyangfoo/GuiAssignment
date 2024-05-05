/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.annotation.Resource;
import model.staffDA;
import model.Staff;
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

/**
 *
 * @author khtee
 */
public class EditStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    private boolean exist;
    private boolean tempexist = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String mail = request.getParameter("mail");
            String password = request.getParameter("password");
            Staff staff = new Staff(name, mail, password);
            staffDA staffs = new staffDA();
            staffDA checkUser = new staffDA(em);
            List<Staff> existCust = checkUser.findAll();
            for (Staff c : existCust) {
                if (c.getStaffName().equals(name)) {
                    tempexist = true;
                } else {
                    exist = false;
                }
            }
            String currentName = (String)request.getSession().getAttribute("name");
            if (currentName.equals(name)){
                tempexist = false;
            }
            exist = tempexist;
            if (exist == false) {
                utx.begin();
                boolean success = staffs.editRecord(staff);
                utx.commit();

                if (success = true) {
                    session.setAttribute("staffLogin", true);
                    session = request.getSession(true);

                    session.setAttribute("name", name);
                    session.setAttribute("password", password);
                    session.setAttribute("mail", mail);

                    response.sendRedirect("StaffProfile.jsp"); //Back to profile
                } else {
                    request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Error occurred!");
                    request.getRequestDispatcher("StaffProfile.jsp").forward(request, response);
                }
            }
            else if(exist == true){
                 request.setAttribute("errorMsg", "<i class=\"fa-solid fa-circle-exclamation error-icon\"></i> Username taken!!");
                    request.getRequestDispatcher("StaffEdit.jsp").forward(request, response);
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
