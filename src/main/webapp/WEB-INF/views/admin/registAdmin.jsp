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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.aidconfirm').click(function(){
				$.ajax({
					url : '${conPath}/admin/aidConfirm.do',
					datatype : 'html',
					data : "aid="+$('#aid').val(),
					success : function(data, status){
						$('#aidConfirmMsg').html(data);
					}
				});
			});
			$('#aid').keyup(function(){
				var aid = $(this).val();
				var patternId = /^[a-zA-Z0-9_]+$/; // macth함수 사용
				if(aid.length<2){
					$('#aidConfirmMsg').text('아이디는 2글자 이상 입력 하세요.');
				}else if(!aid.match(patternId)){
					$('#aidConfirmMsg').text('아이디는 영문자와 숫자 _만 들어갈 수 있습니다.');
				}else {
					$.ajax({
						url : '${conPath}/admin/aidConfirm.do',
						datatype : 'html',
						data : "aid="+$('#aid').val(),
						success : function(data, status){
							$('#aidConfirmMsg').html(data);
						}
					});
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="join_wrap">
    <div id="title">
      <h2>관리자 회원가입</h2>
    </div>
    <br>
    <br>
    <hr>
    <div id="content">
      <form action="${conPath }/admin/insertAdmin.do" method="post">
      <table class="join_table">
        <tr>
          <td>아이디</td>
          <td>
            <input type="text" name="aid" id="aid" class="input" required>
            <input type="button" class="aidconfirm" value="중복확인"><br>
            <span id="aidConfirmMsg"></span>
          </td>
        </tr>
        <tr><td>비밀번호</td><td><input type="password" name="apw" class="input" required></td></tr>
        <tr><td>이름</td><td><input type="text" name="aname"  class="input" required></td></tr>
        <tr>
        	<td>소속</td>
        	<td>
        		<select name="agroup" required>
        			<option value="설악산">설악산</option>
        			<option value="태백산">태백산</option>
        			<option value="북한산">북한산</option>
        			<option value="지리산">지리산</option>
        			<option value="덕유산">덕유산</option>
        			<option value="소백산">소백산</option>
        			<option value="무등산">무등산</option>
        		</select>
        	</td>
        </tr>
        <tr><td colspan="2">
          <p style="text-align:center;">
            <input type="submit" value="등록하기">
            <input type="button" value="로그인" onclick="location='${conPath}/admin/adminLogin.do'">
          </p>
        </td></tr>
      </table>
      </form>
    </div>
  </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>