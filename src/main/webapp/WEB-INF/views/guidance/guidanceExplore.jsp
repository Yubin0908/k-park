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
	      	<span>홈 > 이용안내 > 생태탐방원 </span>
	    </div>
	    <div class="infomation">
	      	<h3 class="title">생태탐방원 이용안내</h3>
	      	<div class="sub_title">
	        	<p class="sub1">자연과 사람이 서로 교감하고 이해하는 체험</p>
	        	<p class="sub2">연과 문화를 함께 즐기고 배우는 생태복지 시설인 생태탐방원에서 체류형 특화프로그램과 숙박, 교육과 회의시설을 이용해보세요.</p>
			</div>
			<div class="map_wrap">
				<div class="button">
				<button href="" id="m3-1" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=moodeungexplore'">무등산</button>
				<button href="" id="m3-2" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=naejangexplore'">내장산</button>
				<button href="" id="m3-3" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=sobaekexplore'">소백산</button>
			</div>
				<img src="${conPath }/img/exploreMap.png" alt="생태탐방원 지도" usemap="#img-map" class="img">
				<map name="img-map">
					<area target="_self" alt="무등산" title="무등산" href="#m3-1" coords="154,718,268,791" shape="rect" class="link"
							onclick="location.href='${conPath}/guidance/guidance.do?park=moodeungexplore'">
	        		<area target="_self" alt="내장산" title="내장산" href="#m3-2" coords="142,636,257,710" shape="rect" class="link"
	        				onclick="location.href='${conPath}/guidance/guidance.do?park=naejangexplore'">
	        		<area target="_self" alt="소백산" title="소백산" href="#m3-3" coords="461,287,576,360" shape="rect" class="link"
	        				onclick="location.href='${conPath}/guidance/guidance.do?park=sobaekexplore'">
				</map>
			</div>
    	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>