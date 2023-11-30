<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${conPath }/css/map.css" />
</head>
<body>
	<div id="map_wrap" style="width: 1400px; margin: 0 auto;">
		<div id="map" style="width: 1400px; height: 600px; position: relative; overflow: hidden;"></div>
		<div class="custom_typecontrol radius_border">
			<span id="btnRoadMap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
			<span id="btnRoadMap" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
		</div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=346b0719c3857c31089acaaaf9905633"></script>
	<script src="${conPath }/js/kakaoMaps.js"></script>
</body>
</html>