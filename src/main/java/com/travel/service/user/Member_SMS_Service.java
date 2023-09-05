package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class Member_SMS_Service implements Interface_MemberService {

	SqlSession sqlSession;

	public Member_SMS_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public String execute(Model model) throws Exception{
		
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSHJFTWFAA7RMDV", "9K2XXZVFSF73BCJMTUICHZFVBVTZAENF", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01039106352");
		message.setTo("수신번호 입력");
		message.setText("SMS는 한글 45자, 영자 90자까지 입력할 수 있습니다.");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		return null;
		
		
	}
}
