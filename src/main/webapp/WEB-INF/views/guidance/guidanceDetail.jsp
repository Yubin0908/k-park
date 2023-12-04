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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
	<style>
		.button button {
			padding: 10px 25px;
			background-color: transparent;
		  	border-color: #0042a2;
		  	border-radius: 5px;
		  	color: #0042a2;
		  	font-weight: bold;
		  	font-size: 0.8em;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<br />
	<br />
	<img alt="" src="${conPath }/img/${park}.jpg" width="55%">
	<br />
	<br />
	<div class="button">
		<button onclick="history.back();" 
					style="cursor:pointer">뒤로가기</button>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>