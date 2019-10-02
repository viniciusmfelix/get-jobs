package com.email;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMail {
	
	public boolean sendMailtoUser(String email,String name, int jo_code, String name_jobopening) {
		boolean send = false;
	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.office365.com");
	    //props.put("mail.smtp.socketFactory.port", "587");
	    //props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.port", "587");
	 
	    String email_stmp, password;
	    
	    email_stmp = "projectbayer.snipercontractorv1.0@outlook.com";
	    password = "noreply!projectbayerfiap";
	    
	    Session session = Session.getDefaultInstance(props,
	      new javax.mail.Authenticator() {
	           protected PasswordAuthentication getPasswordAuthentication() 
	           {
	                 return new PasswordAuthentication(email_stmp, password);
	           }
	      });
	    
	    session.setDebug(true);
	    
	    try {
	 
	      Message message = new MimeMessage(session);
	      message.setFrom(new InternetAddress(email_stmp));
	 
	      Address[] toUser = InternetAddress.parse(email);  
	 
	      message.setRecipients(Message.RecipientType.TO, toUser);
	      message.setSubject("Feedback of your application in the Job Opening n� " +jo_code+" - " + name_jobopening);
	      message.setText("Dear " + name +", a Recruiter gave you a feedback about your application, check it out on our portal!\n\n\nCheers,\nSniper Contractor Inc.");
	      Transport.send(message);
	      send = true;
	     } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }
	    return send;
	 }
}	