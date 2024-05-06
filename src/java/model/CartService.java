/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    @PersistenceContext
    EntityManager em;

    public CartService(EntityManager em) {
        this.em = em;
    }
    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
    List<Cart> products = new ArrayList<>();
    ProductService productService = new ProductService(em);
    
        try {
            for (Cart cartItem : cartList) {
                Product product = productService.findItemByID(cartItem.getProdId());
                if (product != null) {
                    Cart cartRow = new Cart();
                    cartRow.setProdId(product.getProdId());
                    cartRow.setImage(product.getImage());
                    cartRow.setProdName(product.getProdName());
                    cartRow.setPrice(product.getPrice());
                    cartRow.setQuantity(cartItem.getQuantity());

                    products.add(cartRow);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    
    public double getTotalCartPrice(List<Cart> cartProduct) {
        double sum = 0.00;
        
        if (cartProduct != null) {
            for (Cart cart : cartProduct) {
                sum += cart.getPrice() * cart.getQuantity();
            }
        }
        return sum;
    }

}

