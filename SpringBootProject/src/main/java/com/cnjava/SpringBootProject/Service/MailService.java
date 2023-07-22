package com.cnjava.SpringBootProject.Service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class MailService {

	@Autowired
	private JavaMailSender emailServiceImpl;
	

	
	public void sendMail(String email, String text) {
		String from = "loctran7129@gmail.com";
		String to = email;
		 
		SimpleMailMessage message = new SimpleMailMessage();
		 
		message.setFrom(from);
		message.setTo(to);
		message.setSubject("Mã xác thực OTP");
		message.setText("Mã OTP: " + text);
		 
		emailServiceImpl.send(message);
	}
}
