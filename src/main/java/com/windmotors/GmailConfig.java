package com.windmotors;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@Configuration
public class GmailConfig {
	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl sender=new JavaMailSenderImpl();
		sender.setDefaultEncoding("utf-8");
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername("windmotor2022@gmail.com");
		sender.setPassword("hlhuwnqxztbggguw");
		Properties props=sender.getJavaMailProperties();
		props.setProperty("mail.transport.protocol","smtp");
		props.setProperty("mail.smtp.auth","true");
		props.setProperty("mail.smtp.starttls.enable","true");
		props.setProperty("mail.debug","true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		return sender;
	}
}