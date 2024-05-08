/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.annotation.Resource;
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
import model.Customer;
import model.CustomerService;
import model.Product;
import model.ProductReview;
import model.ProductReviewService;
import model.ProductService;

public class SubmitReviewServlet extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            int Id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("id")));
            int productID = Integer.parseInt(request.getParameter("productID"));
            int rating = Integer.parseInt(request.getParameter("rating"));            
            String comment = request.getParameter("comment");

            CustomerService customerservice = new CustomerService(em);
            ProductService productservice = new ProductService(em);
            ProductReviewService prService = new ProductReviewService(em);
            em.getEntityManagerFactory().getCache().evictAll();
            
            Customer customer = customerservice.findByCustId(Id);
            Product product = productservice.findItemByID(productID);
            
            List<ProductReview> allProductdReview = prService.findReviewByProdId(product);
            boolean reviewExist = false;
            int existReviewId = 0;
            for(ProductReview aPR : allProductdReview){
                if(aPR.getCustId().equals(customer)){
                    reviewExist = true;
                    existReviewId = aPR.getProductReviewId();
                    break;
                }
            }
            
            if(reviewExist == true){
                ProductReview updateReview = new ProductReview(existReviewId, rating, comment, customer, product);
                utx.begin();
                prService.updateProductReview(updateReview);
                utx.commit();
                reviewExist = false;
            }else{
                ProductReview newReview = new ProductReview(rating, comment, customer, product);
                utx.begin();
                prService.addReview(newReview);
                utx.commit();
            }
            
            session.setAttribute("productID", productID);
            response.sendRedirect("ViewReview");
        }catch(Exception ex){
            ex.printStackTrace();
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
