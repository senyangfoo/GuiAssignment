/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import jakarta.annotation.Resource;
import jakarta.persistence.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductService {
private String host = "jdbc:derby://localhost:1527/music";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "PRODUCT";
    private Connection conn;
    private PreparedStatement stmt;
    private String sqlQueryByIdStr = "SELECT * from " + tableName + " WHERE PROD_ID = ?"; 
    private ResultSet rs;
    
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public ProductService() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
        } catch (Exception ex) {
            ex.getMessage();
        }
    }

    public boolean addItem(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findItemByID(int prodId) {
        Product product = mgr.find(Product.class, prodId);
        return product;
    }

    public boolean deleteItem(int ID) {
        Product product = findItemByID(ID);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    public List<Product> findAll() {
        List itemList = mgr.createNamedQuery("Product.findAll").getResultList();
        return itemList;
    }

    public boolean updateItem(Product product) {
        Product tempProduct = findItemByID(product.getProdId());
        if (tempProduct != null) {
            tempProduct.setImage(product.getImage());
            tempProduct.setProdName(product.getProdName());
            tempProduct.setCategory(product.getCategory());
            tempProduct.setDescription(product.getDescription());
            tempProduct.setPrice(product.getPrice());
            tempProduct.setStock(product.getStock());
            return true;
        }
        return false;
    }
    
    public Product getCurrentProductById(int id) {
    Product product = null;
        try {
            stmt = conn.prepareStatement(sqlQueryByIdStr);
            stmt.setInt(1, id); // Set the customer ID parameter
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                product = new Product(id, rs.getString("IMAGE"), rs.getString("PROD_NAME"), rs.getString("CATEGORY"), 
                        rs.getString("DESCRIPTION"), Double.parseDouble(rs.getString("PRICE")), Integer.parseInt(rs.getString("STOCK")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return product;
    }
}
