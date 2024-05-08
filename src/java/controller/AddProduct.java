/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.transaction.UserTransaction;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductService;

/**
 *
 * @author Abcong
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AddProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    public String UPLOAD_DIRECTORY;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String prodName = request.getParameter("prodName");
            Part prodImage = request.getPart("prodImage");
            String prodCategory = request.getParameter("prodCategory");
            String prodDesc = request.getParameter("prodDesc");
            double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
            int prodStock = Integer.parseInt(request.getParameter("prodStock"));
            HttpSession session = request.getSession();
            ProductService prodService = new ProductService(em);
            List<Product> productList = prodService.findAll();
            
            UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/");

            String prodImageName = uploadFile(prodImage);

            if (!prodImageName.isBlank()) {
                Product product = new Product(prodImageName, prodName, prodCategory, prodDesc, prodPrice, prodStock);
                utx.begin();
                boolean success = prodService.addItem(product);
                utx.commit();
                session.setAttribute("productList", productList);
                response.sendRedirect("productTable.jsp");
            } else {
                session.setAttribute("productList", productList);
                response.sendRedirect("productTable.jsp");
            }

        } catch (Exception ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("productAddEdit.jsp");
        }
    }

    private String uploadFile(Part img) throws IOException {
        String fileName = "";

        if (img != null && img.getSize() > 0) {
            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            fileName = extractFileName(img);

            String path = UPLOAD_DIRECTORY + "productImage/" + fileName;

            try (InputStream fileContent = img.getInputStream(); OutputStream outStream = new FileOutputStream(path)) {
                int read;
                final byte[] buffer = new byte[1024];
                while ((read = fileContent.read(buffer)) != -1) {
                    outStream.write(buffer, 0, read);
                }
            }

        }

        //if file name is not null, meaning uploaded successfully
        return fileName;
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
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
