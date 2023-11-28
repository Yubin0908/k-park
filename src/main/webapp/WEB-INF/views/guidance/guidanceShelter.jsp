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
	      	<span>홈 > 이용안내 > 대피소</span>
	    </div>
	    <div class="infomation">
	      	<h3 class="title">대피소 이용안내</h3>
	      	<div class="sub_title">
	        	<p class="sub1">구름도 바람도 잠시 머무르는 작은 쉼터</p>
	        	<p class="sub2">긴 길끝에 지친 몸을 쉬어갈 수 있는 안전시설인 국립공원 대피소에서 건강 상태와 이동 동선을 체크하고, 안전한 산행을 위해 휴식을 취해보세요.</p>
			</div>
			<div class="map_wrap">
				<div class="button">
				<button href="" id="m2-1" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=seolakshelter'">설악산</button>
				<button href="" id="m2-2" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=dukyoushelter'">덕유산</button>
				<button href="" id="m2-3" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=jeerishelter'">지리산</button>
				<button href="" id="m2-4" class="btn" onclick="location.href='${conPath}/guidance/guidance.do?park=sobaekshelter'">소백산</button>
			</div><
				<img src="${conPath }/img/shelterMap.png" alt="대피소 지도" usemap="#img-map" class="img">
				<map name="img-map">
		          	<area target="_self" alt="설악산" title="설악산" href="#m2-1" coords="440,36,555,108" shape="rect" class="link"
		          			onclick="location.href='${conPath}/guidance/guidance.do?park=seolakshelter'">
					<area target="_self" alt="덕유산" title="덕유산" href="#m2-2" coords="304,524,423,598" shape="rect" class="link"
							onclick="location.href='${conPath}/guidance/guidance.do?park=dukyoushelter'">
	        		<area target="_self" alt="지리산" title="지리산" href="#m2-3" coords="270,680,384,754" shape="rect" class="link"
	        				onclick="location.href='${conPath}/guidance/guidance.do?park=jeerishelter'">
	        		<area target="_self" alt="소백산" title="소백산" href="#m2-4" coords="461,289,575,362" shape="rect" class="link"
	        				onclick="location.href='${conPath}/guidance/guidance.do?park=sobaekshelter'">
				</map>
			</div>
    	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>