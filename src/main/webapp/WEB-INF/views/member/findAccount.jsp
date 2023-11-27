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
	<link href="${conPath }/css/login.css" rel="stylesheet">
</head>
<body>
	
	<jsp:include page="../main/header.jsp"/>
	<div id="login_wrap">
	<form action="${conPath }/member/account.do" method="post">
		<div id="title">
	      <h2>아이디 찾기</h2>
	      <br>
	      <br>
	      <hr>
	      <br>
	    </div>
		<table class="login_table">
			<tr>
	          <td>이름</td>
	          <td>
	            <input type="text" name="name" class="input">
	          </td>
	        </tr>
	        <tr>
	        	<td>이메일</td>
	        	<td>
	        		<input type="email" name="email" class="input">
	        	</td>
	        </tr>
			<tr>
				<td colspan="2" style="text-align:center;"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>