
package da;

import domain.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDA implements Serializable{
     @PersistenceContext
    EntityManager em;
     
    private String host = "jdbc:derby://localhost:1527/music";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "CUSTOMER";
    private Connection conn;
    private PreparedStatement stmt;
    private String sqlQueryStr = "SELECT * from " + tableName;
    private String sqlInsertStr = "INSERT INTO " + tableName + " VALUES(?, ?, ?,?)";
    private ResultSet rs;
    private int count;
    
     public userDA(EntityManager em) {
        this.em = em;
    }
     
    public userDA() {
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
            // stmt = conn.prepareStatement(sqlQueryStr);
        } catch (Exception ex) {
            ex.getMessage();
        }
    }
    
     public Customer getCurrentRecord() {
        Customer customer = null;
        try {
            customer = new Customer(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4));
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return customer;
    }
     
    public int getQuantity(){
        
          String queryStr = "SELECT COUNT(*) FROM CUSTOMER";
        try{
            
           stmt = conn.prepareStatement(queryStr);
            ResultSet rs2 = stmt.executeQuery();
            while(rs2.next()){
                count = rs2.getInt(1);
            }
        }catch (SQLException ex) {
            ex.getMessage();
        }
        
         return count;
    }
    
    
     public void addRecord(Customer user) {
        try {
            PreparedStatement stmt = conn.prepareStatement(sqlInsertStr);
            stmt.setString(1, user.getCustId());
            stmt.setString(2, user.getCustName());
            stmt.setString(3, user.getCustEmail());
            stmt.setString(4, user.getCustPassword());
            
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
     
      public ArrayList<Customer> getUsers() {

        ArrayList<Customer> customers = new ArrayList<Customer>();
        try {
            stmt = conn.prepareStatement(sqlQueryStr);
            rs = stmt.executeQuery();
            while (rs.next()) {
                customers.add(getCurrentRecord());
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return customers;
    }
      
    public List<Customer> findAll() {
        List<Customer> customer = em.createNamedQuery("Customer.findAll").getResultList();
        return customer;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
      
    public static void main(String [] args){
       userDA uses = new userDA();
       uses.findAll();
    }
}

