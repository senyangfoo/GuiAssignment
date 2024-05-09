/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 *
 * @author Abcong
 */
@Entity
@Table(name = "PRODUCT_REVIEW")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductReview.findAll", query = "SELECT p FROM ProductReview p"),
    @NamedQuery(name = "ProductReview.findByProductReviewId", query = "SELECT p FROM ProductReview p WHERE p.productReviewId = :productReviewId"),
    @NamedQuery(name = "ProductReview.findByStar", query = "SELECT p FROM ProductReview p WHERE p.star = :star"),
    @NamedQuery(name = "ProductReview.findByComment", query = "SELECT p FROM ProductReview p WHERE p.comment = :comment"),
    @NamedQuery(name = "ProductReview.findByProdId", query = "SELECT p FROM ProductReview p WHERE p.prodId = :prodId")})
public class ProductReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRODUCT_REVIEW_ID")
    private Integer productReviewId;
    @Column(name = "STAR")
    private Integer star;
    @Size(max = 500)
    @Column(name = "COMMENT")
    private String comment;
    @JoinColumn(name = "CUST_ID", referencedColumnName = "CUST_ID")
    @ManyToOne(optional = false)
    private Customer custId;
    @JoinColumn(name = "PROD_ID", referencedColumnName = "PROD_ID")
    @ManyToOne(optional = false)
    private Product prodId;

    public ProductReview() {
    }

    public ProductReview(Integer productReviewId, Integer star, String comment, Customer custId, Product prodId) {
        this.productReviewId = productReviewId;
        this.star = star;
        this.comment = comment;
        this.custId = custId;
        this.prodId = prodId;
    }

    public ProductReview(Integer star, String comment, Customer custId, Product prodId) {
        this.star = star;
        this.comment = comment;
        this.custId = custId;
        this.prodId = prodId;
    }

    public ProductReview(Integer productReviewId) {
        this.productReviewId = productReviewId;
    }

    public Integer getProductReviewId() {
        return productReviewId;
    }

    public void setProductReviewId(Integer productReviewId) {
        this.productReviewId = productReviewId;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Customer getCustId() {
        return custId;
    }

    public void setCustId(Customer custId) {
        this.custId = custId;
    }

    public Product getProdId() {
        return prodId;
    }

    public void setProdId(Product prodId) {
        this.prodId = prodId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productReviewId != null ? productReviewId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductReview)) {
            return false;
        }
        ProductReview other = (ProductReview) object;
        if ((this.productReviewId == null && other.productReviewId != null) || (this.productReviewId != null && !this.productReviewId.equals(other.productReviewId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ProductReview[ productReviewId=" + productReviewId + " ]";
    }
    
}
