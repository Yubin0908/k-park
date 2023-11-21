<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<link rel="stylesheet" href="${conPath }/css/join.css" />
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/member/login.do?after=member/modify.do';
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp"/>
	
	<div id="modify_wrap">
		<div id="title">
	      <h2>정보수정</h2>
	    </div>
	    <br>
	    <br>
	    <hr>
		<div id="content">
		<form action="${conPath }/member/modify.do" method="post">
			<input type="hidden" name="id" value="${member.id }">
			<table class="join_table">
				<tr><td>아이디</td><td>${member.id }</td></tr>
				<tr><td>비밀번호</td><td><input type="password" name="pw" value="${member.pw }" class="input"></td></tr>
				<tr><td>이름</td><td><input type="text" name="name" value="${member.name }" class="input"></td></tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="sample4_postcode" name="mpost" 
								class="text_box"  placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr><td>주소</td><td>
							<input type="text" id="sample4_roadAddress" name="address" value="${member.address }"  class="input">
							<input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소">
							<span id="guide"></span>
					</td></tr>
				<tr><td>전화번호</td><td><input type="text" name="phone" value="${member.phone }" class="input"></td></tr>
				<tr><td>메일</td><td><input type="text" name="email" value="${member.email }" class="input"></td></tr>
				<tr>
					<td>성별</td>
		          	<td class="gender_radio">
			        	<label for="male">
			              <input type="radio" id="male" name="gender" value="m" required="required">남
			            </label>
			            <label for="female">
			              <input type="radio" id="female" name="gender" value="f">여
			            </label>
		          	</td>
				</tr>
				<tr><td>생일</td><td><input type="date" name="birth" value="${member.birth }"></td></tr>
				<tr><td colspan="2">
					<p style="text-align:center;">
						<input type="submit" value="정보수정">
					<input type="button" value="회원탈퇴" onclick="location.href='withdrawal.do?id=${member.id}'">
					</p>				
				</td></tr>
			</table>
		</form>
	</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>