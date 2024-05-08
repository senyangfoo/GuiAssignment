/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Collection;

/**
 *
 * @author Abcong
 */
@Entity
@Table(name = "CUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c"),
    @NamedQuery(name = "Customer.findByCustId", query = "SELECT c FROM Customer c WHERE c.custId = :custId"),
    @NamedQuery(name = "Customer.findByCustName", query = "SELECT c FROM Customer c WHERE c.custName = :custName"),
    @NamedQuery(name = "Customer.findByCustEmail", query = "SELECT c FROM Customer c WHERE c.custEmail = :custEmail"),
    @NamedQuery(name = "Customer.findByCustPassword", query = "SELECT c FROM Customer c WHERE c.custPassword = :custPassword")})
public class Customer implements Serializable {

    @Size(max = 80)
    @Column(name = "CUST_NAME")
    private String custName;
    @Size(max = 80)
    @Column(name = "CUST_EMAIL")
    private String custEmail;
    @Size(max = 20)
    @Column(name = "CUST_PASSWORD")
    private String custPassword;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "custId")
    private Collection<ProductReview> productReviewCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "custId")
    private Collection<CardInfo> cardInfoCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CUST_ID")
    private Integer custId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "custId")
    private Collection<Orders> ordersCollection;

    public Customer() {
    }

    public Customer(Integer custId, String custName, String custEmail, String custPassword) {
        this.custId = custId;
        this.custName = custName;
        this.custEmail = custEmail;
        this.custPassword = custPassword;
    }

    public Customer(String custName, String custEmail, String custPassword) {
        this.custName = custName;
        this.custEmail = custEmail;
        this.custPassword = custPassword;
    }

    public Customer(Integer custId) {
        this.custId = custId;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (custId != null ? custId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.custId == null && other.custId != null) || (this.custId != null && !this.custId.equals(other.custId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Customer[ custId=" + custId + " ]";
    }

    @XmlTransient
    public Collection<CardInfo> getCardInfoCollection() {
        return cardInfoCollection;
    }

    public void setCardInfoCollection(Collection<CardInfo> cardInfoCollection) {
        this.cardInfoCollection = cardInfoCollection;
    }

    @XmlTransient
    public Collection<ProductReview> getProductReviewCollection() {
        return productReviewCollection;
    }

    public void setProductReviewCollection(Collection<ProductReview> productReviewCollection) {
        this.productReviewCollection = productReviewCollection;
    }
    
}
