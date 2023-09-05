package com.travel.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Member_user;
import com.travel.dto.user.DTO_Member_user;
import com.travel.service.admin.Interface_TravelService;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class Member_FindEmail_Service implements Interface_TravelService {

	SqlSession sqlSession;

	public Member_FindEmail_Service(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model){

		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");

			String m_name = request.getParameter("m_name");
			String m_tel = request.getParameter("m_tel");

			IDao_Member_user dao = sqlSession.getMapper(IDao_Member_user.class);
			DTO_Member_user dto = dao.Member_FindEmail(m_name, m_tel);
			String m_email = dto.getM_email();
			
			if(m_email != null) {
				model.addAttribute("FindID", true);
				
				DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSHJFTWFAA7RMDV", "9K2XXZVFSF73BCJMTUICHZFVBVTZAENF", "https://api.coolsms.co.kr");
				// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
				Message message = new Message();
				message.setFrom("01039106352");
				message.setTo(m_tel);
				message.setText(m_name+"님의 이메일은 "+m_email+"입니다.");

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
			
			}else {
				model.addAttribute("FindID", false);		
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

	}

}
