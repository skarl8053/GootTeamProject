package com.travel.service.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.travel.dao.user.IDao_Payment_user;
import com.travel.service.admin.Interface_TravelService;
import com.travel.usetools.CryptoUtil;

@Service
@Transactional
public class Service_Payment_Insert_Service  implements Interface_TravelService {
	
	IDao_Payment_user dao = null;
	
	public Service_Payment_Insert_Service(SqlSession sqlSession) {
		dao = sqlSession.getMapper(IDao_Payment_user.class);
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 사용자 관련
		String m_no = request.getParameter("m_no");
		
		// 예약 숙소 / 객실
		String stay_no = request.getParameter("s_no");
		String[] room_no_str = request.getParameter("r_no").split("_");
		
		// 체크인 체크아웃
		String checkindate = request.getParameter("checkindate");
		String checkoutdate = request.getParameter("checkoutdate");
		
		// 계산 금액
		String totalAllPrice = request.getParameter("totalAllPrice");
		String totalDiscountPrice = request.getParameter("totalDiscountPrice");
		String totalResultPrice = request.getParameter("totalResultPrice");
		
		// 사용 쿠폰번호
		String coupon_no = request.getParameter("coupon_no");
		
		// 사용 포인트
		int totalUsePoint = Integer.parseInt(request.getParameter("totalUsePoint") != null ? request.getParameter("totalUsePoint") : "0");
		
		// 적립 포인트
		int totalEarnPoint = Integer.parseInt(request.getParameter("totalEarnPoint") != null ? request.getParameter("totalEarnPoint") : "0");
		
		
		
		// 결제 방식
		String pay_type = request.getParameter("pay_type");
		String cardNumber = request.getParameter("cardNumber"); // 암호화 시켜서 저장할 것
		
		String encryptedCardNumber = "";
		if(pay_type == "1") {
			
			// 카드로 결제했을 경우에만 카드번호 투입
			try {
				// 카드 암호화 키 (임의 배정)
				encryptedCardNumber = CryptoUtil.encryptAES256(cardNumber, "4ijSJVEVCrT6w24ds");
			} 
			catch(Exception ex) {
				ex.printStackTrace();
				return;
			}
			
		}
		// 주문번호 생성
		int create_order_no = dao.selectOrderNo();
		
		List<Integer> room_no = new ArrayList<Integer>();
		
        for (int i = 0; i < room_no_str.length; i++) {
        	room_no.add(Integer.parseInt(room_no_str[i]));
        }
		
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("order_no", create_order_no);
		mp.put("m_no", m_no);
		mp.put("s_no", stay_no);
		mp.put("r_no", room_no); // room_no를 _로 split하여 집어넣음
		mp.put("coupon_no", coupon_no);
		mp.put("total_price", totalAllPrice);
		mp.put("discount_price", totalDiscountPrice);
		mp.put("payment_price", totalResultPrice);
		mp.put("payment_method", pay_type);
		mp.put("payment_cardno", encryptedCardNumber);
		mp.put("payment_flag", "Y");
		mp.put("deal_flag", "N");
		mp.put("checkindate", checkindate);
		mp.put("checkoutdate", checkoutdate);
		
		// 숙소 결제 / 예약 내역 / 매출 테이블에 넣음..
		dao.insertTotalOrder(mp);
		
		// 상세 내역 테이블에 넣음..
		dao.insertDetailOrder(mp);  // ORDERDTL
		
		// 쿠폰을 사용한 경우
		if(! coupon_no.equals("")) {
			
			// 사용자 쿠폰 개수 차감
			dao.updateMemberCoupon(m_no, coupon_no);
			
			// 쿠폰 사용 이력 추가
			dao.insertMemberCouponList(m_no, coupon_no);
			
		}
		
		int updatePoint = totalEarnPoint - totalUsePoint;
		
		// 사용자 포인트 업데이트
		dao.updateMemberPoint(m_no, updatePoint);
		dao.insertMemberPointList(m_no, create_order_no, totalEarnPoint, totalUsePoint);
		
		// 알림 이력에 추가
		dao.insertPushAL(m_no, create_order_no, "숙소 결제가 완료되었습니다.");
		
		model.addAttribute("msg", "결제가 완료되었습니다. 예약 정보를 확인해주세요");
		
	}
}
