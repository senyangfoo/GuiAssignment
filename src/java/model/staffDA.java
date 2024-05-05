package model;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class staffDA implements Serializable {

    @PersistenceContext
    EntityManager em;

    private String host = "jdbc:derby://localhost:1527/music";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "STAFF";
    private Connection conn;
    private PreparedStatement stmt;
    private String sqlQueryStr = "SELECT * from " + tableName;
    private String sqlInsertStr = "INSERT INTO " + tableName + " (\"STAFF_NAME\", \"STAFF_EMAIL\", \"STAFF_PASSWORD\")" + " VALUES(?, ?,?)";
    private String sqlUpdateStr = "UPDATE " + tableName + " SET STAFF_EMAIL = ? , STAFF_PASSWORD = ?" + " WHERE STAFF_NAME = ?";
    private ResultSet rs;
    private int count;

    public staffDA(EntityManager em) {
        this.em = em;
    }

    public staffDA() {

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
            // stmt = conn.prepareStatement(sqlQueryStr);
        } catch (Exception ex) {
            ex.getMessage();
        }
    }

    public Staff getCurrentRecord() {
        Staff staff = null;
        try {
            String test = rs.getString("CUST_ID");
            staff = new Staff(Integer.valueOf(test), rs.getString("CUST_NAME"), rs.getString("CUST_EMAIL"),rs.getString("CUST_PASSWORD"));
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return staff;
    }

    public int getQuantity() {

        String queryStr = "SELECT COUNT(*) FROM STAFF";
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

    public boolean addRecord(Staff user) {
        try {
            stmt = conn.prepareStatement(sqlInsertStr);
            stmt.setString(1, user.getStaffName());
            stmt.setString(2, user.getStaffEmail());
            stmt.setString(3, user.getStaffPassword());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.getMessage();
            return false;
        }
    }
     public boolean editRecord(Staff user) {
        try {
            stmt = conn.prepareStatement(sqlUpdateStr);
            stmt.setString(1, user.getStaffEmail());
            stmt.setString(2, user.getStaffPassword());
            stmt.setString(3, user.getStaffName());

            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.getMessage();
            return false;
        }
    }

    public ArrayList<Staff> getUsers() {

        ArrayList<Staff> customers = new ArrayList<Staff>();
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

    public List<Staff> findAll() {
           List<Staff> staff = em.createNamedQuery("Staff.findAll").getResultList();
        return staff;
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
//        Staff custs = new Staff(name,mail,CustPass);
//        List<Staff> existCust = uses.findAll();
//        for (Staff c : existCust){
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
