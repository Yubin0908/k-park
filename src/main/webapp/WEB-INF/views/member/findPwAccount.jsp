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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#mail-Check-Btn').on('click', function() {
				const email = $('#email').val(); // 이메일 주소값 얻어오기!
				console.log('전송된 이메일 : ' + email); // 이메일 오는지 확인
				const checkInput = $('.checkinput') // 인증번호 입력하는곳 
				
				$.ajax({
					url : '${conPath}/member/emailConfirm.do',
					type : 'post',
					data : 'email='+email,
					success : function (data) {
						console.log("인증번호 : ", data);
						checkInput.attr('disabled',false);
						code = data.trim();
						alert('비밀번호가 전송되었습니다.');
					}			
				});
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty findPw}">
		<script>alert('${findPw}');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="login_wrap">
	<form action="${conPath }/member/accountPw.do" method="post">
		<div id="title">
	      <h2>비밀번호 찾기</h2>
	      <br>
	      <br>
	      <hr>
	      <br>
	    </div>
		<table class="login_table">
			<tr>
	          <td>이름</td>
	          <td>
	            <input type="text" name="name" class="input" placeholder="이름을 입력하세요">
	          </td>
	        </tr>
	        <tr>
	        	<td>아이디</td>
	        	<td>
	        		<input type="text" name="id" class="input" placeholder="아이디를 입력하세요" required="required">
	        		
	        	</td>
	        </tr>
	        <tr>
	        	<td>이메일</td>
	        	<td>
	        		<input type="email" name="email" class="input" id="email" placeholder="이메일을 입력하세요" >
	        	</td>
	        </tr>
			<tr>
				<td colspan="2" style="text-align:center;"><input type="submit" value="찾기"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>