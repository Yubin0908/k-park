<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/join.css" rel="stylesheet">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.idconfirm').click(function(){
				$.ajax({
					url : '${conPath}/member/idConfirm.do',
					datatype : 'html',
					data : "id="+$('#id').val(),
					success : function(data, status){
						$('#idConfirmMsg').html(data);
					}
				});
			});
			$('#id').keyup(function(){
				var id = $(this).val();
				var patternId = /^[a-zA-Z0-9_]+$/; // macth함수 사용
				if(id.length<2){
					$('#idConfirmMsg').text('아이디는 2글자 이상 입력 하세요.');
				}else if(!id.match(patternId)){
					$('#idConfirmMsg').text('아이디는 영문자와 숫자 _만 들어갈 수 있습니다.');
				}else {
					$.ajax({
						url : '${conPath}/member/idConfirm.do',
						datatype : 'html',
						data : "id="+$('#id').val(),
						success : function(data, status){
							$('#idConfirmMsg').html(data);
						}
					});
				}
			});
			$('form').submit(function(){
				var idConfirmResult = $('#idConfirmMsg').text().trim();
				var email = $('input[name="email"]');
				var patternMmail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
				if(idConfirmResult!='사용가능한 ID입니다.'){
					alert('사용가능한 ID인지 중복확인 후 가입이 가능 합니다.');
					$('input[name="id"]').focus();
					return false;
				}else if(!email.val()){
					alert('메일은 필수입력 사항입니다. 메일을 입력하세요.');
					email.focus();
					return false;
				}else if(!email.val().match(patternEmail)){
					alert('메일 형식이 맞지 않습니다.');
					email.focus();
					return false;
				}
			});
		});
		$('#mail-Check-Btn').click(function() {
			const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function (data) {
					console.log("data : " +  data);
					checkInput.attr('disabled',false);
					code =data;
					alert('인증번호가 전송되었습니다.')
				}			
			}); // end ajax
		}); // end send eamil
	</script>

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="join_wrap">
	    <div id="title">
			<h2>회원가입</h2>
	    </div>
	    <br>
	    <br>
	    <hr>
	    <div id="content">
			<form action="${conPath }/member/join.do" method="post">
			<table class="join_table">
        		<tr>
          			<td>아이디</td>
          			<td>
			            <input type="text" name="id" id="id" class="input">
			            <input type="button" class="idconfirm" value="중복확인"><br>
			            <span id="idConfirmMsg"></span>
					</td>
				</tr>
		        <tr><td>비밀번호</td><td><input type="password" name="pw" class="input"></td></tr>
		        <tr><td>이름</td><td><input type="text" name="name"  class="input"></td></tr>
		        <tr>
		          	<td>우편번호</td>
		          	<td>	
            			<input type="text" id="sample4_postcode" name="mpost"
                			class="text_box"  placeholder="우편번호" required="required">
            			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
          			</td>
        		</tr>
        		<tr>
          			<td>주소</td>
          			<td>
			            <input type="text" id="sample4_roadAddress" name="address"  placeholder="도로명주소" class="input">
			            <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
          			</td>
		        </tr>
		        <tr><td>전화번호</td><td><input type="text" name="phone" required="required" class="input"></td></tr>
		        <tr><td>메일</td>
		        	<td>
		        		<input type="text" name="email" required="required" class="input">
		        	</td>
		        </tr>
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
		        <tr><td>생일</td><td><input type="date" name="birth" required="required"></td></tr>
		        <tr><td colspan="2">
          			<p style="text-align:center;">
						<input type="submit" value="회원가입">
            			<input type="button" value="로그인" onclick="location='${conPath}/login.do'">
          			</p>
        			</td>
        		</tr>
			</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>