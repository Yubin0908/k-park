<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<style>
		#content table{ border: pink solid 2px; margin: 10px auto 0;}
		#content tr {background-color: #FFE271; }
		#content tr:HOVER { background-color: orange; cursor: pointer; }
		#content td, #content th { text-align: center; padding: 5px;}
		#content caption { font-size: 1.3em; text-align: center;}
		#content h2 {text-align: center; color:red;}
		#content div { text-align: center; }
		#content .left { text-align: left; }
		#content .curr{color:red;}
	</style>
</head>
<body>
	<c:if test="${joinResult eq 1 }">
		<!-- <script>alert('${mDto} 회원가입 감사합니다.');</script> -->
		<script>alert('회원 가입을 진심으로 축하 드립니다.');</script>
	</c:if>
	<c:if test="${not empty loginResult}">
		<script>alert('${loginResult}');</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			location.href='${conPath}/main.do';
		</script>
	</c:if>
	<c:if test="${empty param.after }">
		<c:set var="after" value="main.do"/>
	</c:if>
	<c:if test="${not empty param.after and not empty param.pageNum}">
		<c:set var="after" value="${param.after }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}"/>
	</c:if>
	<c:if test="${not empty param.after and empty param.pageNum}">
		<c:set var="after" value="${param.after }"/>
	</c:if>
	
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member/login.do" method="post">
		<input type="hidden" name="after" value="${after}">
		<table>
			<caption>로그인 화면</caption>
			<tr><th>아이디</th><td><input type="text" name="id" required="required" value="${id }"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw" required="required" value="${pw }"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="로그인">
			</td></tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>