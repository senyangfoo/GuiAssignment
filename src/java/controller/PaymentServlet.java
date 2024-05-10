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
import java.util.*;
import model.CardInfo;
import model.CardInfoService;
import model.Cart;
import model.CartService;
import model.Customer;
import model.CustomerService;
import model.OrderDetail;
import model.OrderService;
import model.Orders;
import model.Product;
import model.ProductService;

public class PaymentServlet extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            
            List<Cart> cartProduct = null;
            List<Product> cartProductList = null;
            double subtotalPrice = 0;
            double deliveryFee = 0;
            double total=0;
            
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cart_list != null) {
                cartProductList = (List<Product>) session.getAttribute("cartProductList");
                cartProduct = (List<Cart>) session.getAttribute("cartProduct");
                subtotalPrice = (double) session.getAttribute("totalPrice");
                if(subtotalPrice >= 1000){
                   deliveryFee = 0.0; 
                   total = subtotalPrice;
                } else {
                   deliveryFee = 25.0;
                   total = subtotalPrice + deliveryFee;
                }
            }
            int Id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("customerId")));
            String method = request.getParameter("method");
            String address= (String) request.getSession().getAttribute("fullAddress");
            String phoneNumber= (String) request.getSession().getAttribute("phoneNumber");
            
            CardInfoService cartinfoservice = new CardInfoService(em);
            CustomerService customerservice = new CustomerService(em);
            OrderService orderservice = new OrderService(em);
            ProductService productservice = new ProductService(em);
            em.getEntityManagerFactory().getCache().evictAll();
            
            Customer customer = customerservice.findByCustId(Id);
            
            if(method.equals("debit") || method.equals("credit")){
                String cardType = request.getParameter("cardType");
                String cardNumber = request.getParameter("cardNumber");
                String expiryDate = request.getParameter("expiryDate");
                String ccv = request.getParameter("ccv");
                Date date = new Date();
                
                utx.begin();
                Orders order = new Orders(date, address, phoneNumber, method, total, customer);
                orderservice.addOrder(order);
                
                CardInfo cardinfo = new CardInfo(cardType,cardNumber, expiryDate, ccv, customer);
                cartinfoservice.addCard(cardinfo);
                
                for (int i = 0; i < cartProduct.size(); i++) {
                    Cart cart = cartProduct.get(i);
                    Product productList = cartProductList.get(i);

                    Product product = productservice.findItemByID(productList.getProdId());
                    OrderDetail orderProduct = new OrderDetail(cart.getQuantity(), order, product);
                    orderservice.addOrderDetail(orderProduct);
                }                
                cart_list.clear();
                utx.commit();
                em.clear();
                request.setAttribute("title", "Payment Succesful");
                request.setAttribute("message", "Thank you for purchase.");
                request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
            }
            
        }catch (Exception ex) {
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
