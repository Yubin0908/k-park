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
	<c:if test="${not empty member }">
		<script>
			alert('잘못된 접근 입니다.');
			location.href='${conPath}/main.do';
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp"/>
	<div id="login_wrap">
	<form action="${conPath }/admin/login.do" method="post">
		<input type="hidden" name="after" value="${after}">
		<div id="title">
	      <h2>관리자 로그인</h2>
	      <br>
	      <br>
	      <hr>
	      <br>
	    </div>
		<table class="login_table">
			<tr>
	          <td>아이디</td>
	          <td>
	            <input type="text" name="aid" id="aid" class="input" value="${aid }">
	          </td>
	        </tr>
	        <tr>
	        	<td>비밀번호</td>
	        	<td>
	        		<input type="password" name="apw" class="input" value="${apw }">
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