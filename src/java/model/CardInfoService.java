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


public class CardInfoService {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;

    public CardInfoService(EntityManager em) {
        this.em = em;
    }

    public boolean addCard(CardInfo card) {
        em.persist(card);
        return true;
    }

    public List<CardInfo> findAll() {
        List<CardInfo> cardList = em.createNamedQuery("CardInfo.findAll").getResultList();
        return cardList;
    }  
}
