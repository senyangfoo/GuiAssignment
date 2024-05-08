/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import jakarta.annotation.Resource;
import jakarta.persistence.*;

public class ProductService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
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
}
