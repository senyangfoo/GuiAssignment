/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package da;

import java.sql.*;
import java.util.*;
import domain.Product;

public class ProductDA {
    private Connection conn;
    private PreparedStatement stmt;
    private String host = "jdbc:derby://localhost:1527/music";
    private String user = "nbuser";
    private String password = "nbuser";

    public void getConnection(){
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
            // stmt = conn.prepareStatement(sqlQueryStr);
        } catch (Exception ex) {
            ex.getMessage();
        }
    }
    
    public List<Product> getAllProduct(){
        List<Product> products = new ArrayList<Product>();
        
        try{
            String query = "SELECT * FROM PRODUCT";
            stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                String id = rs.getString("prod_id");
                String image = rs.getString("image");
                String name = rs.getString("prod_name");
                String category = rs.getString("category");
                String description = rs.getString("description");
                double price = Double.parseDouble(rs.getString("price"));
                int stock = Integer.parseInt(rs.getString("stock"));
                
                Product p = new Product(id, image, name, category, description, price, stock);
                products.add(p);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return products;
    }
}
