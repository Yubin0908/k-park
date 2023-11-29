<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<head>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width" , initial-scale=1.0>
  	<link rel="stylesheet" href="${conPath }/css/list.css">
  	<title>Document</title>
</head>
	
<body>
	<jsp:include page="../main/header.jsp"/>
  	<div id="camp_wrap">
	    <div class="page-location">
	      	<span>홈 > 이용안내 > 야영장</span>
	    </div>
	    <div class="infomation">
	      	<h3 class="title">야영장 이용안내</h3>
	      	<div class="sub_title">
	        	<p class="sub1">소중한 사람들과 함께 마음의 여유와 캠핑을 즐기는 공간</p>
	        	<p class="sub2">우리나라 대표 휴양공간인 국립공원 야영장에서 사랑하는 사람들과 함께 야영을 하며, 계절에 따라 변화하는 자연의 풍광을 만끽하세요.</p>
			</div>
			<div class="map_wrap">
				<div class="button">
				<button href="" id="m1-4" class="btn" 
					onclick="location.href='${conPath}/guidance/guidance.do?park=taebaek'">태백산<br>(소도)</button>
				<button href="" id="m1-3" class="btn" 
					onclick="location.href='${conPath}/guidance/guidance.do?park=jeeri'">지리산<br>(백무동)</button>
				<button href="" id="m1-2" class="btn" 
					onclick="location.href='${conPath}/guidance/guidance.do?park=bukhan'">북한산<br>(사기막)</button>
				<button href="" id="m1-1" class="btn" 
					onclick="location.href='${conPath}/guidance/guidance.do?park=seolak'">설악산<br>(설악동)</button>
			</div>
				<img src="${conPath }/img/campMap1.png" alt="야영장 지도" usemap="#img-map" class="img">
				<map name="img-map">
	        		<area target="_self" alt="태백산" title="태백산" href="#m1-4" coords="625,275,732,349" shape="rect" class="link"
	        				onclick="location.href='${conPath}/guidance/guidance.do?park=taebaek'">
	        		<area target="_self" alt="지리산" title="지리산" href="#m1-3" coords="321,679,432,752" shape="rect" class="link"
	        				onclick="location.href='${conPath}/guidance/guidance.do?park=jeeri'">
					<area target="_self" alt="북한산" title="북한산" href="#m1-2" coords="181,163,294,233" shape="rect" class="link"
							onclick="location.href='${conPath}/guidance/guidance.do?park=bukhan'">
		          	<area target="_self" alt="설악산" title="설악산" href="#m1-1" coords="491,36,606,111" shape="rect" class="link"
		          			onclick="location.href='${conPath}/guidance/guidance.do?park=seolak'">
				</map>
			</div>
    	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>