/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.annotation.*;
import jakarta.persistence.*;
import java.util.List;

public class OrderService {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public OrderService(EntityManager em) {
        this.em = em;
    }

    public boolean addOrder(Orders order) {
        em.persist(order);
        return true;
    }

    public Orders findByOrderId(int id) {
        Orders order = em.find(Orders.class, id);
        return order;
    }

    public boolean deleteOrder(int id) {
        Orders order = findByOrderId(id);
        if (order != null) {
            em.remove(order);
            return true;
        }
        return false;
    }

    public List<Orders> findAll() {
        List orderList = em.createNamedQuery("Orders.findAll").getResultList();
        return orderList;
    }
    
    public List<Orders> findOrderByUserId(Customer customer) {
        List orderList = em.createNamedQuery("Orders.findByCustId").setParameter("custId", customer).getResultList();
        return orderList;
    }

    public boolean updateOrder(Orders order) {
        Orders tempOrder = findByOrderId(order.getOrderId());
        if (tempOrder != null) {
            tempOrder.setCustId(order.getCustId());
            tempOrder.setOrderDate(order.getOrderDate());
            tempOrder.setTotalAmount(order.getTotalAmount());
            tempOrder.setPhoneNum(order.getPhoneNum());
            return true;
        }
        return false;
    }
    
    public boolean addOrderProduct(OrderDetail orderDetail) {
        em.persist(orderDetail);
        return true;
    }


    public void deleteAllOrderDetailById(int id){
        String qlString = "DELETE FROM ORDER_DETAIL op WHERE op.orderId = :orderId";
        em.createQuery(qlString).setParameter("orderId", id);
    }
    
    public List<OrderDetail> findAllOrderDetail() {
        List orderDetailList = em.createNamedQuery("orderDetail.findAll").getResultList();
        return orderDetailList;
    }
}
