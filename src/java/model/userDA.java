package model;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDA implements Serializable {

    @PersistenceContext
    EntityManager em;

    private String host = "jdbc:derby://localhost:1527/music";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "CUSTOMER";
    private Connection conn;
    private PreparedStatement stmt;
    private String sqlQueryStr = "SELECT * from " + tableName;
    private String sqlQueryByIdStr = "SELECT * from " + tableName + " WHERE CUST_ID = ?"; 
    private String sqlInsertStr = "INSERT INTO " + tableName + " (\"CUST_NAME\", \"CUST_EMAIL\", \"CUST_PASSWORD\")" + " VALUES(?, ?,?)";
    private String sqlUpdateStr = "UPDATE " + tableName + " SET CUST_EMAIL = ? , CUST_PASSWORD = ?" + " WHERE CUST_NAME = ?";
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
            String test = rs.getString("CUST_ID");
            customer = new Customer(Integer.valueOf(test), rs.getString("CUST_NAME"), rs.getString("CUST_EMAIL"),rs.getString("CUST_PASSWORD"));
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return customer;
    }
    
    public Customer getCurrentRecordById(int id) {
    Customer customer = null;
        try {
            stmt = conn.prepareStatement(sqlQueryByIdStr);
            stmt.setInt(1, id); // Set the customer ID parameter
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                customer = new Customer(id,rs.getString("CUST_NAME"),rs.getString("CUST_EMAIL"),rs.getString("CUST_PASSWORD"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return customer;
    }
    
    public int getQuantity() {

        String queryStr = "SELECT COUNT(*) FROM CUSTOMER";
        try {

            stmt = conn.prepareStatement(queryStr);
            ResultSet rs2 = stmt.executeQuery();
            while (rs2.next()) {
                count = rs2.getInt(1);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return count;
    }

    public boolean addRecord(Customer user) {
        try {
            stmt = conn.prepareStatement(sqlInsertStr);
            stmt.setString(1, user.getCustName());
            stmt.setString(2, user.getCustEmail());
            stmt.setString(3, user.getCustPassword());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.getMessage();
            return false;
        }
    }
    
    public boolean editRecord(Customer user) {
        try {
            stmt = conn.prepareStatement(sqlUpdateStr);
            stmt.setString(1, user.getCustEmail());
            stmt.setString(2, user.getCustPassword());
            stmt.setString(3, user.getCustName());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.getMessage();
            return false;
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
           List<Customer> customers = em.createNamedQuery("Customer.findAll").getResultList();
        return customers;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public static void main(String[] args) {
//        userDA uses = new userDA();
//        String name = "111";
//        String mail = "aaa";
//        String CustPass = "aaa";
//        boolean exist;
//        Customer custs = new Customer(name,mail,CustPass);
//        List<Customer> existCust = uses.findAll();
//        for (Customer c : existCust){
//            if(c.getCustName().equals(name)){
//                exist = true;
//                System.out.println("Userrname Repeated!");
//            }
//            else{
//                exist = false;
//            }
//        }
//        if (exist = false){
//            uses.addRecord(custs);
//            System.out.println("New customer added!");
//        }
  }
}
