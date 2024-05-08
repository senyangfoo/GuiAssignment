/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import jakarta.annotation.Resource;
import jakarta.persistence.*;

public class StaffService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public StaffService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addStaff(Staff staff) {
        mgr.persist(staff);
        return true;
    }

    public Staff findStaffByID(int staffId) {
        Staff staff = mgr.find(Staff.class, staffId);
        return staff;
    }

    public List<Staff> findStaffByEmail(String email) {
        List staffList = mgr.createNamedQuery("Staff.findByStaffEmail").setParameter("staffEmail", email).getResultList();
        return staffList;
    }

    public List<Customer> findStaffByName(String custName) {
        List staffList = mgr.createNamedQuery("Staff.findByStaffName").setParameter("staffName", custName).getResultList();
        return staffList;
    }

    public boolean deleteStaff(int ID) {
        Staff staff = findStaffByID(ID);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;
    }

    public List<Staff> findAll() {
        List staffList = mgr.createNamedQuery("Staff.findAll").getResultList();
        return staffList;
    }

    public boolean updateStaff(Staff staff) {
        Staff tempProduct = findStaffByID(staff.getStaffId());
        if (tempProduct != null) {
            tempProduct.setStaffName(staff.getStaffName());
            tempProduct.setStaffEmail(staff.getStaffEmail());
            tempProduct.setStaffPassword(staff.getStaffPassword());
            return true;
        }
        return false;
    }
}
