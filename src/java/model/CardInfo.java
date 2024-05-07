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
@Table(name = "CARD_INFO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CardInfo.findAll", query = "SELECT c FROM CardInfo c"),
    @NamedQuery(name = "CardInfo.findByCardInfoId", query = "SELECT c FROM CardInfo c WHERE c.cardInfoId = :cardInfoId"),
    @NamedQuery(name = "CardInfo.findByCardType", query = "SELECT c FROM CardInfo c WHERE c.cardType = :cardType"),
    @NamedQuery(name = "CardInfo.findByCardNumber", query = "SELECT c FROM CardInfo c WHERE c.cardNumber = :cardNumber"),
    @NamedQuery(name = "CardInfo.findByExpiryDate", query = "SELECT c FROM CardInfo c WHERE c.expiryDate = :expiryDate"),
    @NamedQuery(name = "CardInfo.findByCcv", query = "SELECT c FROM CardInfo c WHERE c.ccv = :ccv")})
public class CardInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CARD_INFO_ID")
    private Integer cardInfoId;
    @Size(max = 20)
    @Column(name = "CARD_TYPE")
    private String cardType;
    @Size(max = 17)
    @Column(name = "CARD_NUMBER")
    private String cardNumber;
    @Size(max = 10)
    @Column(name = "EXPIRY_DATE")
    private String expiryDate;
    @Size(max = 4)
    @Column(name = "CCV")
    private String ccv;
    @JoinColumn(name = "CUST_ID", referencedColumnName = "CUST_ID")
    @ManyToOne(optional = false)
    private Customer custId;

    public CardInfo() {
    }

    public CardInfo(String cardType, String cardNumber, String expiryDate, String ccv, Customer custId) {
        this.cardType = cardType;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.ccv = ccv;
        this.custId = custId;
    }

    public CardInfo(Integer cardInfoId) {
        this.cardInfoId = cardInfoId;
    }

    public Integer getCardInfoId() {
        return cardInfoId;
    }

    public void setCardInfoId(Integer cardInfoId) {
        this.cardInfoId = cardInfoId;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getCcv() {
        return ccv;
    }

    public void setCcv(String ccv) {
        this.ccv = ccv;
    }

    public Customer getCustId() {
        return custId;
    }

    public void setCustId(Customer custId) {
        this.custId = custId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cardInfoId != null ? cardInfoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CardInfo)) {
            return false;
        }
        CardInfo other = (CardInfo) object;
        if ((this.cardInfoId == null && other.cardInfoId != null) || (this.cardInfoId != null && !this.cardInfoId.equals(other.cardInfoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CardInfo[ cardInfoId=" + cardInfoId + " ]";
    }
    
}
