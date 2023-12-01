<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
		body {
	    background-color: #f4f4f4;
	    margin: 0;
	    padding: 0;
		}
		
		#pw_wrap {
	    width: 100%;
	    max-width: 1400px;
	    margin: 0 auto;
	    padding: 20px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    min-height: 65vh;
		}
		
		.pwinfo {
	    width: 100%;
	    max-width: 400px;
	    height: auto;
	    background-color: #fff;
	    border-radius: 25px;
	    padding: 20px;
	    text-align: center;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		.pwinfo p {
	    font-size: 20px;
	    margin-bottom: 20px;
		}
		
		.pwinfo input[type="text"],
		.pwinfo input[type="submit"] {
	    width: calc(100% - 16px);
	    margin-bottom: 10px;
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
		}
		
		.pwinfo input[type="submit"] {
	    background-color: #007bff;
	    color: #fff;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
		}
		
		.pwinfo input[type="submit"]:hover {
    	background-color: b3;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${not empty pwConfirmResult }">
		<script>
			alert("${pwConfirmResult }");
			history.back();
		</script>
	</c:if>
	<br />
	<br />
	<br />
	<div id="pw_wrap">
		<div class="pwinfo">
			<form action="${conPath }/member/pwConfirm.do" method="post">
				<p>비밀번호 확인</p>
				<input type="hidden" name="id" value="${member.id }">
				<input type="password" name="pw">
				<input type="submit" value="확인">
			</form>
		</div>
	</div>
	<br />
	<br />
	<br />
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>