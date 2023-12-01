<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/header.css" rel="stylesheet"/>
</head>
<body>
	<div id="header_wrap">
	    <nav>
	    	<a href="${conPath }/main.do"><img src="${conPath }/img/k.n.park.png" alt="logo" width="50"></a>
			<ul class="menu">
				<li>
	        		<a href="#">이용안내</a>
		      		<ul class="submenu">
						<li><a href="${conPath }/guidance/campList.do">야영장</a></li>
				        <li><a href="${conPath }/guidance/shelterList.do">대피소</a></li>
				        <li><a href="${conPath }/guidance/exploreList.do">생태탐방원</a></li>
				        <li><a href="${conPath}/main/map.do">지도로보기</a></li>
		      		</ul>
		      	</li>	
				<li>
			    	<a href="#">예약하기</a>
			    	<ul class="submenu">
			    		<li><a href="${conPath }/reservation/bookingCamp.do">야영장</a></li>
				        <li><a href="${conPath }/reservation/bookingShelter.do">대피소</a></li>
				        <li><a href="${conPath }/reservation/bookingExplore.do">생태탐방원</a></li>
			    	</ul>
			    </li>
	     		<li>
	       	 		<a href="#">고객마당</a>
	       	 		<ul class="submenu">
				        <li><a href="${conPath }/board/qnaList.do">묻고답하기</a></li>
				        <li><a href="${conPath }/board/sugList.do">건의합니다</a></li>
				        <li><a href="${conPath }/board/reviewList.do">탐방후기</a></li>
	       	 		</ul>
	      		</li>
	      		<li>
	       	 		<a href="#">알림마당</a>
	       	 		<ul class="submenu">
	       	 			<li><a href="${conPath }/board/noticeList.do">공지사항</a></li>
				        <li><a href="${conPath }/board/faqList.do">자주하는 질문</a></li>
				        <li><a href="${conPath }/board/infoList.do">예약방법안내</a></li>
	       	 		</ul>
	      		</li>
	      		<c:if test="${not empty member.id }">
		      		<li>
		        		<a href="#">마이페이지</a>
		        		<ul class="submenu">
		        			<li><a href="${conPath }/reservation/reservationList.do?id=${member.id}">나의 예약목록</a></li>
		        		</ul>
		      		</li>
	      		</c:if>
	      		<c:if test="${not empty admin.aid }">
	      			<li>
	      				<a href="#">관리자 메뉴</a>
	      				<ul class="submenu">
	      					<li><a href="${conPath }/reservation/adminList.do?parkname=${admin.agroup }">예약현황</a></li>
	      					<li><a href="${conPath }/admin/memberList.do">회원관리</a></li>
	      				</ul>
	      			</li>
	      		</c:if>
	   		</ul>
	    </nav>
		<div class="user">
		<c:if test="${empty member.id and empty admin.aid}">
	    	<ul>
			    <li><a href="${conPath }/member/join.do"><img src="${conPath }/img/join.png" alt="joinImg" > 회원가입</a></li>	      	
	    		<li><a href="${conPath }/member/login.do"><img src="${conPath }/img/login.png" alt="loginImg" > 로그인</a></li>
	      	</ul>
	    </c:if>
	    <c:if test="${not empty member.id or not empty admin.aid }">
	    	<li><a href="${conPath }/member/logout.do"><img src="${conPath }/img/logout.png" alt="logoutImg" > 로그아웃</a></li>
	    	<c:if test="${empty member.id }">
	    		<li><a><img src="${conPath }/img/admin.png" alt="adminImg" > ${admin.aname }님 환영합니다.</a></li>
	    	</c:if>
	    	<c:if test="${empty admin.aid }">
	    		<li><a href="${conPath }/member/pwConfirm.do"><img src="${conPath }/img/memberModify.png" alt="modifyImg" >정보수정</a></li>	
	    		<li><a><img src="${conPath }/img/member.png" alt="memberImg" > ${member.name }님 환영합니다.</a></li>
	    	</c:if>
	    </c:if>
    	</div>
	</div>
</body>
</html>