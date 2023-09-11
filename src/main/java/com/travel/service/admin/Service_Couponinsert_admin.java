package com.travel.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.travel.dao.admin.IDao_coupon_admin;

public class Service_Couponinsert_admin implements Interface_TravelService {
	private SqlSession sqlSession;

	public Service_Couponinsert_admin(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		IDao_coupon_admin dao = sqlSession.getMapper(IDao_coupon_admin.class);
		

		int coupon_no = Integer.parseInt(request.getParameter("coupon_no"));
		String coupon_detail = request.getParameter("coupon_detail");
		String coupon_flag = request.getParameter("coupon_flag");
		String coupon_qty_q = request.getParameter("coupon_qty");
		
		if(coupon_qty_q == null) {
//			String 값도 순수 숫자로 표시해주세요
			coupon_qty_q = "999";
		}
		int coupon_qty = Integer.parseInt(coupon_qty_q);

		
		

		System.out.println(coupon_no + "," + coupon_detail + "," + coupon_flag + "," + coupon_qty);



//		쿠폰번호/금액의 데이터를 가져와서 카운트 한 뒤 중복 값이 있으면 등록이 안되게끔 함
		int coupon_no_cnt = dao.getCouponCount(coupon_no);

//		쿠폰 무제한 여부에 따라 Y를 선택할 경우 텍스트를 비활성화 시켜놨기 떄문에
//		데이터에 null 값이 전송되어 오류가 발생하므로 이를 방지함
		int gubun = -1;
		if (coupon_no_cnt == 0) {

			dao.couponinsert(coupon_no, coupon_detail, coupon_flag, coupon_qty);
			
//			쿠폰이 등록되었을 때
			
			gubun = 1;
			model.addAttribute("gubun", 1);
			model.addAttribute("msg", "쿠폰이 등록되었습니다.");
			model.addAttribute("coupon_no", "");

		} else {
			
//			중복된 쿠폰번호/금액 이 있을 때
			
			gubun = 2;
			model.addAttribute("gubun", 2);
			model.addAttribute("msg", "쿠폰번호/금액 이 중복된 쿠폰이 있습니다. 다시 입력해주세요");
			model.addAttribute("coupon_no", coupon_no);
			model.addAttribute("coupon_detail", coupon_detail);
			model.addAttribute("coupon_flag", coupon_flag);
			model.addAttribute("coupon_qty", coupon_qty);

		}
		System.out.println(gubun);
	}
}
