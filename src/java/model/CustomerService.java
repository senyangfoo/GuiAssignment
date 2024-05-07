/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

public class CustomerService {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public CustomerService(EntityManager em) {
        this.em = em;
    }

    public boolean addCust(Customer customer) {
        em.persist(customer);
        return true;
    }

    public Customer findByCustId(int id) {
        Customer customer = em.find(Customer.class, id);
        return customer;
    }
    
    public List<Customer> findByCustEmail(String email) {
        List customerList = em.createNamedQuery("Customer.findByCustEmail").setParameter("custEmail", email).getResultList();
        return customerList;
    }
    
    public List<Customer> findByCustName(String custName) {
        List customerList = em.createNamedQuery("Customer.findByCustName").setParameter("custName", custName).getResultList();
        return customerList;
    }

    public boolean deleteCust(int id) {
        Customer customer = findByCustId(id);
        if (customer != null) {
            em.remove(customer);
            return true;
        }
        return false;
    }

    public List<Customer> findAll() {
        List<Customer> customerList = em.createNamedQuery("Customer.findAll").getResultList();
        return customerList;
    }

    public boolean updateUser(Customer customer) {
        Customer tempCustomer = findByCustId(customer.getCustId());
        if (tempCustomer != null) {
            tempCustomer.setCustName(customer.getCustName());
            tempCustomer.setCustEmail(customer.getCustEmail());
            tempCustomer.setCustPassword(customer.getCustPassword());
            return true;
        }
        return false;
    }
}
