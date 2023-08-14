package com.cnjava.SpringBootProject.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnjava.SpringBootProject.Model.Cart;
import com.cnjava.SpringBootProject.Repository.CartRepository;


@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	
	
	public List<Cart> getCartByEmail(String email){
		return cartRepository.getCartByEmail(email);
	}
	
	public Cart getById( int id) {
		Optional<Cart> tmp = cartRepository.findById(id);
		return tmp.get();
	}
	
	public void saveCart(Cart c) {
		cartRepository.save(c);
	}
	
	public void deleteCart(int cartID) {
		cartRepository.deleteById(cartID);
	}
}
