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
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	<script>
		$(document).ready(function(){
			$('.idconfirm').click(function(){
				$.ajax({
					url : '${conPath}/member/idConfirm.do',
					type : 'get',
					data : "id="+$('#id').val(),
					datatype : 'html',
					success : function(data, status){
						$('#idConfirmMsg').html(data);
					}
				});
			});
			$('#id').keyup(function(){
				var id = $(this).val();
				var patternId = /^[a-zA-Z0-9_]+$/; // macth함수 사용
				if(id.length<5 || id.length>20 ){
					$('#idConfirmMsg').text('아이디는 5글자 이상 , 20글자 이하로 입력 하세요.');
					$('#idConfirmMsg').css('color','red');
				}else if(!id.match(patternId)){
					$('#idConfirmMsg').text('아이디는 영문자와 숫자 _만 들어갈 수 있습니다.');
				}else {
					$.ajax({
						url : '${conPath}/member/idConfirm.do',
						type : 'get',
						data : "id="+$('#id').val(),
						datatype : 'html',
						success : function(data, status){
							$('#idConfirmMsg').html(data);
						}
					});
				}
			});
			$('.pw, .pwChk').keyup(function(){
				var pw = $('input[name="pw"]').val();
				var pwChk = $('input[name="pwChk"]').val();
				if(!pw && !pwChk){
					$('#pwChkResult').text(' &nbsp; ');
				}else if(pw == pwChk){
					$('#pwChkResult').text('비밀번호가 일치합니다');
					$('#pwChkResult').css('color','blue');
				}else{
					$('#pwChkResult').html('<b>비밀번호가 일치하지 않습니다</b>');
					$('#pwChkResult').css('color','red');
				}
			}); // keyup 이벤트 (비밀번호 일치 확인용)
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
						alert('인증번호가 전송되었습니다.')
					}			
				}); // end ajax
				$('.checkinput').blur(function() {
					const inputcode = $(this).val();
					const msgArea = $('#mail-check-warn');
					
					if(inputcode === code) {
						msgArea.html('인증번호가 일치합니다.');
						msgArea.css('color', 'green');
						$('#mail-Check-Btn').attr('disabled', true);
						$('.checkinput').attr('readonly', true);
					} else {
						msgArea.html('인증번호가 일치하지 않습니다.');
						msgArea.css('color', 'red');
					}
				});
			});
			$('form').submit(function(){
				var idConfirmResult = $('#idConfirmMsg').text().trim();
				var email = $('input[name="email"]');
				var patternMmail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
				var checkmail = $('#mail-check-warn');
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
				} else if(checkmail != '인증번호가 일치합니다.') {
					alert('메일인증을 해주세요.');
					return false;
				}
			});
		});
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
			            <input type="text" name="id" id="id" class="input"><br>
			            <span style="font-size: 0.9em;" id="idConfirmMsg"></span>
					</td>&nbsp; &nbsp; &nbsp; 
				</tr>
		        <tr>
		        	<td>비밀번호<br><br>확인입력</td>
		        	<td>
		        		<input type="password" name="pw" id="pw" class="pw input">
		        		<input type="password" name="pwChk" id="pwChk" class="pwChk input"><br>
		        		<span style="font-size: 0.9em;" id="pwChkResult"></span>
	        		</td>
		        </tr>
		       <!-- <tr>
		        	<td>비번확인</td>
		        	<td>
		        		<input type="password" name="pwChk" id="pwChk" class="pwChk input"><br>
		        		<span style="font-size: 0.9em;" id="pwChkResult"></span>
		        	</td>
		        </tr> -->
		        
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
		        		<input type="text" name="email" required="required" class="input" id="email">
		        		<input type="number" name="checkNum" class="checkinput" disabled maxlength="6"/>&nbsp;<input type="button" value="인증번호 발송" id="mail-Check-Btn"/>
		        		<span id="mail-check-warn"></span>
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
		        <tr><td>생일</td><td><input id="datepicker" name="birth" placeholder="생일을 입력하세요" required="required" width="360px"></td></tr>
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
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
  
  <script>
	  $(document).ready(function() {
		  $('#datepicker').datepicker({
			  format: 'yyyy-mm-dd'
		  });
		});
  </script>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>