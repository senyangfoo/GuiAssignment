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
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 *
 * @author Abcong
 */
@Entity
@Table(name = "ORDER_DETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o"),
    @NamedQuery(name = "OrderDetail.findByOrderId", query = "SELECT o FROM OrderDetail o WHERE o.orderId = :orderId"),
    @NamedQuery(name = "OrderDetail.findByOrderProductId", query = "SELECT o FROM OrderDetail o WHERE o.orderProductId = :orderProductId"),
    @NamedQuery(name = "OrderDetail.findByQuantity", query = "SELECT o FROM OrderDetail o WHERE o.quantity = :quantity")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDER_PRODUCT_ID")
    private Integer orderProductId;
    @Column(name = "QUANTITY")
    private Integer quantity;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ORDER_ID")
    @ManyToOne(optional = false)
    private Orders orderId;
    @JoinColumn(name = "PROD_ID", referencedColumnName = "PROD_ID")
    @ManyToOne(optional = false)
    private Product prodId;

    public OrderDetail() {
    }

    public OrderDetail(Integer quantity, Orders orderId, Product prodId) {
        this.quantity = quantity;
        this.orderId = orderId;
        this.prodId = prodId;
    }

    public OrderDetail(Integer orderProductId) {
        this.orderProductId = orderProductId;
    }

    public Integer getOrderProductId() {
        return orderProductId;
    }

    public void setOrderProductId(Integer orderProductId) {
        this.orderProductId = orderProductId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Orders getOrderId() {
        return orderId;
    }

    public void setOrderId(Orders orderId) {
        this.orderId = orderId;
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
        hash += (orderProductId != null ? orderProductId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetail)) {
            return false;
        }
        OrderDetail other = (OrderDetail) object;
        if ((this.orderProductId == null && other.orderProductId != null) || (this.orderProductId != null && !this.orderProductId.equals(other.orderProductId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OrderDetail[ orderProductId=" + orderProductId + " ]";
    }
    
}
