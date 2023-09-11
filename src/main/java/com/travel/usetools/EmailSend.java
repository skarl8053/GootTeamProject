package com.travel.usetools;

import java.security.MessageDigest;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSend extends Authenticator{
	
	private String toEmail;
	
	
	private final String host = "http://localhost:8090/travel/";
	private final String fromEmail = "bpple9392@gmail.com";
	private final String password = "uhbutuyshjypnuxn";
	
	/**
	 * 이메일 인증메일 전송 메서드
	 * @param toEmail 보내는 이메일
	 */
	public EmailSend(String toEmail) {
		this.toEmail = toEmail;
	}
	
	/**
	 * 호스트 정보 가져오는 메서드
	 * @return
	 */
	public String getHost() {
		return host;
	}
	
	/**
	 * 보내는 이메일 가져오는 메서드
	 * @return
	 */
	public String getFromEmail() {
		return fromEmail;
	}
	
	/**
	 * 인증 메세지 보냄..
	 * @return boolean
	 */
	public boolean emailSendAction() {
		
		try{
			String from=fromEmail;
			
			String to= toEmail;
			String code= emailEncrypted(to);
			String subject="회원가입 인증을 위한 메일입니다.";
			String content="다음 링크 클릭 이메일 인증을 진행하세요."+"<a href='"+host+"member/emailCheck?code="+code+"&m_email="+to+"'><br><b>이메일 인증하기</b></a>";
			
			// 진행중 메세지
			
			System.out.println("인증 메세지 전송중...");
			System.out.println("발신 이메일 : " + fromEmail);
			System.out.println("수신 이메일 : " + toEmail);
			
			Properties p=new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
		
			Authenticator auth=new Authenticator() {
				
				
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
				
			};
			
			Session ses=Session.getInstance(p,auth);
			/* ses.setDebug(true); */
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
			
			System.out.println("리턴 트루");
			return true;
			
		} 
		catch(AuthenticationFailedException e) {	
			System.out.println("전송 실패 : EmailSend 메서드의 fromEmail과 password 정보가 잘못되었습니다.");
			return false;
		}
		catch (Exception e){
			
			System.out.println("전송 실패 : " + e.getMessage());
			return false;
		}
	}
	public boolean PwSendAction(String m_name,String t_pw) {
		
		
		try {
	
			String from=fromEmail;
			String to= toEmail;
			String code= emailEncrypted(to);
			String subject="여기어때 임시 비밀번호입니다.";
			String content=m_name+"님의 임시 비밀번호는 '"+t_pw+"' 입니다.";
			
			// 진행중 메세지
			
			System.out.println("인증 메세지 전송중...");
			System.out.println("발신 이메일 : " + fromEmail);
			System.out.println("수신 이메일 : " + toEmail);
			
			Properties p=new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			
			Authenticator auth=new Authenticator() {
				
				
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
				
			};
			
			Session ses=Session.getInstance(p,auth);
			/* ses.setDebug(true); */
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
			
			System.out.println("리턴 트루");
			return true;
			
		} 
		catch(AuthenticationFailedException e) {	
			System.out.println("전송 실패 : EmailSend 메서드의 fromEmail과 password 정보가 잘못되었습니다.");
			return false;
		}
		catch (Exception e){
			
			System.out.println("전송 실패 : " + e.getMessage());
			return false;
		}
	}
	
	/**
	 * emailEncryption : 이메일 암호화
	 * @param input 이메일 주소
	 * @return 암호화 String
	 */
	
	public String emailEncrypted(String input){
		
		StringBuffer result=new StringBuffer();
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] salt = "Hello! This is Salt.".getBytes();
			digest.reset();
			digest.update(salt);
			byte[] chars=digest.digest(input.getBytes("UTF-8"));
			for (int i = 0; i < chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length()==1)result.append("0");
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result.toString();
	}
}
