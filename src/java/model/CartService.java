/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

public class CartService {
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CartService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addCart(Cart cart) {
    try {
        mgr.persist(cart);
        return true;
    } catch (Exception ex) {
        ex.printStackTrace(); // For debugging purposes
        return false;
    }
}

    public Cart findCartById(String code) {
        Cart cart = mgr.find(Cart.class, code);
        return cart;
    }

    public boolean deleteCart(String id) {
        Cart cart = findCartById(id);
        if (cart != null) {
            mgr.remove(cart);
            return true;
        }
        return false;
    }

    public List<Cart> findAll() {
        List cartList = mgr.createNamedQuery("cart.findAll").getResultList();
        return cartList;
    }


}
