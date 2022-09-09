package com.cabhiering.entities;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public String getRandom()
	{
		Random random=new Random();
		int num=random.nextInt(999999);
		return String.format("%06d", num);
	}
	
	public boolean sendMail(Traveller traveller)
	{
		boolean test=false;
		
		
		String from="cabhiringforcab@gmail.com";
		
		String host="smtp.gmail.com";
		
		
		
		
		
		try {
			
			
			
			Properties properties=System.getProperties();
			
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", "465");
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.auth", "true");
					
			
			
			Session session=Session.getInstance(properties, new Authenticator() {
				
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication("cabhiringforcab@gmail.com", "zwtwbuocxcrvbpmj");
				}
			});
			session.setDebug(true);
			
			MimeMessage m=new MimeMessage(session);
			
			m.setRecipient(Message.RecipientType.TO, new InternetAddress(traveller.gettEmail()));
			m.setFrom(from);
			m.setSubject("otp regarding");
                        
			m.setText("your verification code is"+traveller.getCode() );
			
			Transport.send(m);
			test=true;
			System.out.println("sucees");
			
			
			
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return test;
	}
        
        
        public boolean sendMail(Driver d)
	{
		boolean test=false;
		
		
		String from="cabhiringforcab@gmail.com";
		
		String host="smtp.gmail.com";
		
		
		
		
		
		try {
			
			
			
			Properties properties=System.getProperties();
			
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", "465");
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.auth", "true");
					
			
			
			Session session=Session.getInstance(properties, new Authenticator() {
				
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication("cabhiringforcab@gmail.com", "zwtwbuocxcrvbpmj");
				}
			});
			session.setDebug(true);
			
			MimeMessage m=new MimeMessage(session);
			
			m.setRecipient(Message.RecipientType.TO, new InternetAddress(d.getdEmail()));
			m.setFrom(from);
			m.setSubject("otp regarding");
                        
			m.setText("your verification code is"+d.getCode() );
			
			Transport.send(m);
			test=true;
			System.out.println("sucees");
			
			
			
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return test;
	}
	
	
}
