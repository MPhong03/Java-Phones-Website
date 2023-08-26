package com.cnjava.SpringBootProject.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cnjava.SpringBootProject.Model.Card;
import com.cnjava.SpringBootProject.Model.Cart;
import com.cnjava.SpringBootProject.Model.Code;
import com.cnjava.SpringBootProject.Model.Order;
import com.cnjava.SpringBootProject.Model.OrderDetail;
import com.cnjava.SpringBootProject.Model.AppUser;
import com.cnjava.SpringBootProject.Repository.CardRepository;
import com.cnjava.SpringBootProject.Service.CartService;
import com.cnjava.SpringBootProject.Service.CodeService;
import com.cnjava.SpringBootProject.Service.MailService;
import com.cnjava.SpringBootProject.Service.OrderDetailService;
import com.cnjava.SpringBootProject.Service.OrderService;
import com.cnjava.SpringBootProject.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping(path="/payment", produces="application/json")
@CrossOrigin(origins="*")
public class JsonResponse {
	
	
	@Autowired
	private CardRepository cardRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@GetMapping("/saveorder")
	public Map<String, String> checkCard(@RequestParam("name") String name, @RequestParam("numbercard") String number, @RequestParam("month") String month,@RequestParam("year") String year, @RequestParam("cvv") String cvv,@RequestParam("fullname") String fullname,  @RequestParam("email") String email,  @RequestParam("phone") String phone,  @RequestParam("province") String province,  @RequestParam("address") String address,  @RequestParam("code") String code,  @RequestParam("final") String finalPrice,HttpServletRequest request){
		
		HashMap<String, String> map = new HashMap<>();
		
	
		if(fullname.equals("") || email.equals("") || phone.equals("") || address.equals("")) {
			map.put("status", "false");
			map.put("message", "Vui lòng nhập đủ thông tin đặt hàng");
			return map;
		}
		
		
		if(name.equals("") || number.equals("") || month.equals("") || year.equals("") || cvv.equals("")) {
			map.put("status", "false");
			map.put("message", "Vui lòng nhập đủ thông tin thẻ");
			
		}
		else {
			
			int yearC = Integer.valueOf(year);
			int monthC = Integer.valueOf(month);
			int cvvC = Integer.valueOf(cvv);
			
			Card card = cardRepository.checkCard(name, number, monthC, yearC, cvvC);
			
			if(card == null) {
				map.put("status", "false");
				map.put("message", "Thông tin thẻ không đúng");
				
			}
			else {
				int money = Integer.valueOf(finalPrice);
				
				if(card.getMoney() - money < 0) {
					map.put("status", "false");
					map.put("message", "Số dư không đủ");
					return map;
				}
				else {
					
					HttpSession session = request.getSession(false);
					 
				    String userEmail = (String) session.getAttribute("email");
				    
					 
					AppUser user = userService.getUserByEmail(userEmail);
					
					Date date = new Date();  
					SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss a");  
					String strDate = formatter.format(date);
					String orderCode = strDate + "*"+userEmail;
					
					Order or = new Order();
					
					or.setAddress(address);
					or.setCode(orderCode);
					or.setDate(strDate);
					or.setDiscount(code);
					or.setEmail(email);
					or.setFullname(fullname);
					or.setPhonenumber(phone);
					or.setProvince(province);
					or.setStatus(0);
					or.setTotal(money);
					or.setUserid(user);
					
					orderService.saveOrder(or);  // luu order
					
				
					Code codeDiscount = codeService.getCodeByText(code); //update ma giam gia da dc su dung
					if(codeDiscount!= null) {
						codeDiscount.setStatus(1);
					    codeService.saveCode(codeDiscount);
					}
			
					Order tmpOrder = orderService.getOrderByCode(orderCode); // lay order da luu 
					
					List< Cart> list = cartService.getCartByEmail(userEmail);
					
					for(Cart c: list) {  //luu order detail
						OrderDetail od = new OrderDetail();
						od.setOrderid(tmpOrder);
						od.setProductid(c.getProductid());
						od.setQuantity(c.getQuantity());
						od.setColor(c.getColor());
						
						orderDetailService.saveDetail(od);
						
						cartService.deleteCart(c.getCartID());
					}
					
					int oldMoney = card.getMoney();
					card.setMoney(oldMoney - money);
					cardRepository.save(card); // update card money
					
					
					
					map.put("status", "true");
					map.put("message", "Đã đặt hàng thành công");
					
				}
				
			}
		}
		
		
		return map;
		
	}
}
