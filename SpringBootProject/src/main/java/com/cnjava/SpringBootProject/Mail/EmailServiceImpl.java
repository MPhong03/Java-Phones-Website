package com.cnjava.SpringBootProject.Mail;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


@Component
public interface EmailServiceImpl extends JavaMailSender {

    
}