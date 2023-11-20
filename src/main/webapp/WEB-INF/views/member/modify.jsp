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
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/member/login.do?after=member/modify.do';
		</script>
	</c:if>
	<%-- <jsp:include page="../main/header.jsp"/> --%>
	<div id="content">
	<form action="${conPath }/member/modify.do" method="post">
		<input type="hidden" name="id" value="${member.id }">
		<table>
			<tr><td>아이디</td><td>${member.id }</td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pw" value="${member.pw }"></td></tr>
			<tr><td>이름</td><td><input type="text" name="name" value="${member.name }"></td></tr>
			<tr><td>주소</td><td>
						<input type="text" id="sample4_roadAddress" name="address" value="${member.address }">
						<input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소">
						<span id="guide"></span>
				</td></tr>
			<tr><td>전화번호</td><td><input type="text" name="phone" value="${member.phone }"></td></tr>
			<tr><td>메일</td><td><input type="text" name="email" value="${member.email }"></td></tr>
			<tr><td>성별</td><td><input type="text" name="gender" value="${member.gender }"></td></tr>
			<tr><td>생일</td><td><input type="date" name="birth" value="${member.birth }"></td></tr>
			<tr><td>가입일</td><td><input type="date" name="mRdate" value="${member.mRdate }"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="정보수정">
			</td></tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>