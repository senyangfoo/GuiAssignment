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

public class ProductReviewService {
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductReviewService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addReview(ProductReview productReview) {
        mgr.persist(productReview);
        return true;
    }

    public ProductReview findReviewByID(int Id) {
        ProductReview productReview = mgr.find(ProductReview.class, Id);
        return productReview;
    }
    
    public List<ProductReview> findReviewByProdId(Product prodId) {
        List reviewList = mgr.createNamedQuery("ProductReview.findByProdId").setParameter("prodId", prodId).getResultList();
        return reviewList;
    }

    public boolean deleteReview(int ID) {
        ProductReview producteview = findReviewByID(ID);
        if (producteview != null) {
            mgr.remove(producteview);
            return true;
        }
        return false;
    }

    public List<Product> findAll() {
        List itemList = mgr.createNamedQuery("Product.findAll").getResultList();
        return itemList;
    }

    public boolean updateProductReview(ProductReview productReview) {
        ProductReview tempProductReview = findReviewByID(productReview.getProductReviewId());
        if (tempProductReview != null) {
            tempProductReview.setComment(productReview.getComment());
            tempProductReview.setCustId(productReview.getCustId());
            tempProductReview.setProdId(productReview.getProdId());
            tempProductReview.setStar(productReview.getStar());
            return true;
        }
        return false;
    }
}
