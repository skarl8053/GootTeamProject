<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰등록</title>
</head>
<body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- serviece 단의 gubun 을 가져와서 뿌림 -->

<!-- 쿠폰이 등록되었을 때 -->
<c:if test="${param.gubun eq 1}">
	<script>
		alert("${param.msg}");
		location.replace("couponlist");
	</script>
</c:if>
<!-- 등록하려는 쿠폰이 중복일 때 -->
<c:if test="${param.gubun eq 2}">
	<script>
		alert("${param.msg}");
	</script>
</c:if>
<!-- 쿠폰 가격이 입력되지 않았을 때 -->
<c:if test="${param.gubun eq 3}">
	<script>
		alert("${param.msg}");
	</script>
</c:if>

<script>

	function insertCheck(){
		
		var coupon_no = $("#coupon_no").val();
		var coupon_detail = $("#coupon_detail").val();		
		var coupon_flag = $("#coupon_flag").val();
		var coupon_qty = $("#coupon_qty").val();
		
		if(coupon_no.length < 1){
			alert("쿠폰 번호/금액 을 입력해주세요");
			return false;
		}
		
		if(coupon_detail.length < 1){
			alert("쿠폰 내용을 입력해주세요");
			return false;
		}
		
		if(coupon_flag == "N")
		{
			if(coupon_qty.length < 1){
				alert("쿠폰 수량을 입력해주세요");
				return false;
			}
		}
	}
	
	function coupon_number_change(target){
		
		if(target.value == ""){
			alert("쿠폰 수량을 입력해주세요");
			
			return false;
		}
		
		if(isFinite(parseInt(target.value)) == false){
			
	        alert("쿠폰 수량은 숫자로 입력해주세요");
	        target.value = "";
	        
	        return false;
	    }
	}
	
	function handleRadioButton(radioButton){
		 var couponQtyInput = document.getElementById("coupon_qty");
		 
		 if (radioButton.value == "Y") {
			 couponQtyInput.value = "999";
			 couponQtyInput.disabled = true;
		 }else{
			 couponQtyInput.value = ""; 
		     couponQtyInput.disabled = false;
		 }
	}

</script>

<form action="couponinsert" method="post" onsubmit="return insertCheck();">
	<input type="hidden" name="" />
	
	<table width="500" border="1">
		<tr>
			<td>쿠폰가격</td>
			
			<c:if test="${empty param.gubun}">
				<td><input type="text" id="coupon_no" name="coupon_no" onchange="return coupon_number_change(this)" autocomplete="off"/></td>
			</c:if>
			<c:if test="${param.gubun eq 2}">
				<td><input type="text" id="coupon_no"  name="coupon_no" value="${param.coupon_no}" onchange="return coupon_number_change(this)" autocomplete="off"/></td>
			</c:if>
			
		</tr>
		<tr>
			<td>쿠폰내용</td>
			
			<c:if test="${empty param.gubun}">
				<td><input type="text" id="coupon_detail" name="coupon_detail" size="50" autocomplete="off"/></td>
			</c:if>
			<c:if test="${param.gubun eq 2}">
				<td><input type="text" id="coupon_detail"  name="coupon_detail" size="50" value="${param.coupon_detail}" autocomplete="off"/></td>
			</c:if>
				
		</tr>
		<tr>
			<td>무제한 여부</td>
			<td>
				<c:if test="${empty param.gubun}">
					<input type="radio" class="coupon_flag" name="coupon_flag" value="Y" onclick="handleRadioButton(this)"/>Y
					<input type="radio" id="coupon_flag" class="coupon_flag" name="coupon_flag" value="N" onclick="handleRadioButton(this)" checked/>N
<!-- 				<input type="radio" class="coupon_flag" name="coupon_flag" value="Y" onclick="this.form.coupon_qty.disabled=true"/>Y -->
<!-- 				<input type="radio" class="coupon_flag" name="coupon_flag" value="N" onclick="this.form.coupon_qty.disabled=false" checked/>N -->
				</c:if>
				<c:if test="${param.gubun eq 2}">
					<c:if test="${param.coupon_flag eq 'Y' }">
						<input type="radio" name="coupon_flag" value="Y" checked/>Y
						<input type="radio" name="coupon_flag" value="N"/>N
					</c:if>
					<c:if test="${param.coupon_flag eq 'N' }">
						<input type="radio" name="coupon_flag" value="Y"/>Y
						<input type="radio" name="coupon_flag" value="N" checked/>N
					</c:if>
				</c:if>
				
			</td>
		</tr>
		<tr>
			<td>쿠폰수량</td>
			<td>
				<c:if test="${empty param.gubun}">
					<input type="text" id="coupon_qty" name="coupon_qty" onchange="return coupon_number_change(this)" autocomplete="off"/>
				</c:if>
				<c:if test="${param.gubun eq 2}">
					<input type="text" id="coupon_qty" name="coupon_qty" value="${param.coupon_qty}"  onchange="return coupon_number_change(this)" autocomplete="off"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td><span><input type="submit" class="button" value="쿠폰등록"></span>
			<br/>
			<a href="couponlist">쿠폰목록</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>