/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package domain;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Objects;

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

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "CUST_ID")
    private String custId;
    @Size(max = 80)
    @Column(name = "CUST_NAME")
    private String custName;
    @Size(max = 80)
    @Column(name = "CUST_EMAIL")
    private String custEmail;
    @Size(max = 20)
    @Column(name = "CUST_PASSWORD")
    private String custPassword;

    public Customer() {
    }

    public Customer(String custName) {
        this.custName = custName;
    }

    public Customer(String custId, String custName, String custEmail, String custPassword) {
        this.custId = custId;
        this.custName = custName;
        this.custEmail = custEmail;
        this.custPassword = custPassword;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (custName != null ? custName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Customer other = (Customer) obj;
        if (!Objects.equals(this.custId, other.custId)) {
            return false;
        }
        if (!Objects.equals(this.custName, other.custName)) {
            return false;
        }
        if (!Objects.equals(this.custEmail, other.custEmail)) {
            return false;
        }
        return Objects.equals(this.custPassword, other.custPassword);
    }

    @Override
    public String toString() {
        return "domain.Customer[ custId=" + custId + " ]";
    }
    
}
