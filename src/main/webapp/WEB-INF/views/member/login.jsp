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
	<c:if test="${joinResult eq 1 }">
		<!-- <script>alert('${mDto} 회원가입 감사합니다.');</script> -->
		<script>alert('회원 가입을 진심으로 축하 드립니다.');</script>
	</c:if>
	<c:if test="${not empty loginResult}">
		<script>alert('${loginResult}');</script>
	</c:if>
	<c:if test="${not empty findId}">
		<script>alert('아이디는 ${findId}입니다.');</script>
	</c:if>
	<c:if test="${not empty findPw}">
		<script>alert('입력하신 이메일로 회원님의 비밀번호가 전송되었습니다.');</script>
	</c:if>
	<c:if test="${not empty admin }">
      <script>
         alert('이미 로그인되어 있습니다.');
         history.back();
      </script>
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
	<div id="login_wrap">
		<form action="${conPath }/member/login.do" method="post">
			<input type="hidden" name="after" value="${after}">
			<div id="title">
		      <h2>로그인</h2>
		      <br>
		      <br>
		      <hr>
		      <br>
		    </div>
			<table class="login_table">
				<tr>
		          <td>아이디</td>
		          <td>
		            <input type="text" name="id" id="id" class="input" value="${id }">
		          </td>
		        </tr>
		        <tr>
		        	<td>비밀번호</td>
		        	<td>
		        		<input type="password" name="pw" class="input" value="${pw }">
		        	</td>
		        </tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="submit" value="로그인">
						<input type="button" value="아이디찾기" onclick="location.href='${conPath}/member/accountId.do'">
						<input type="button" value="비밀번호찾기" onclick="location.href='${conPath}/member/accountPw.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>