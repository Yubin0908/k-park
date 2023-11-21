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
<style>
    * { margin: 0; padding: 0;}
    #header_wrap li {list-style: none;}
    nav a, .user a { text-decoration: none; font-size: 1.2em; color: ##1e1e1e;}
    #header_wrap {
      width: 100%;
      background-color: #FFFF;
      height: 100px;
      border-bottom: groove;
    }
    #header_wrap nav > a{
    	float: left;
    }
    .user a{
     	display: flex;
     	text-align: center;
     	position: inherit;
     	float: right;
     	line-height: 57px;
     	padding: 22px; 	
    }
    /********* header 메뉴 *********/
    .menu{
    	width: 800px;
    	margin: 0px auto;
    }
    .menu > li {
    	width: 20%;
    	height:50px;
    	float: left;
    	text-align: center;
    	line-height: 5;
    	background-color: #FFFF;
    }
    .menu a {
    	color: #1e1e1e;
    }
    .submenu {
  		height: 0; /*ul의 높이를 안보이게 처리*/
 	 	overflow: hidden;
	}
	.menu > li:hover  {
  		background-color: #FFFF;
  		transition-duration: 0.5s;
	}
	.menu > li:hover .submenu {
  		height: 300px; /*서브메뉴 li한개의 높이 50*5*/
  		transition-duration: 1s;
  		
  	}
  	.menu .submenu > li a{
  		color: #ccc;
  	}
  	.menu .submenu li > a:hover{
  		color: #009eff;
  	}
  	.menu .submenu li > a{
  		position: relative;
  		display: block;
  		line-height: 50px;
  	}
  	nav img {
  		display: inline-block;
  		width: 200px;
  		height: 92px;
  		padding: 5px;
  		margin-left: 46px;
  	}
</style>
</head>
<body>
	<div id="header_wrap">
	    <nav>
	    	<a href="${conPath }/main.do"><img src="${conPath }/img/k.n.park.png" alt="logo" width="50"></a>
			<ul class="menu">
				<li>
	        		<a href="">이용안내</a>
		      		<ul class="submenu">
						<li><a href="#">야영장</a></li>
				        <li><a href="#">대피소</a></li>
				        <li><a href="#">생태탐방원</a></li>
				        <li><a href="#">민박촌</a></li>
		      		</ul>
		      	</li>	
				<li>
			    	<a href="">예약하기</a>
			    	<ul class="submenu">
			    		<li><a href="#">야영장</a></li>
				        <li><a href="#">대피소</a></li>
				        <li><a href="#">생태탐방원</a></li>
				        <li><a href="#">민박촌</a></li>
			    	</ul>
			    </li>
	     		<li>
	       	 		<a href="">고객마당</a>
	       	 		<ul class="submenu">
	       	 			<li><a href="${conPath }/board/noticeList.do">공지사항</a></li>
				        <li><a href="${conPath }/board/faqList.do">자주하는 질문</a></li>
				        <li><a href="${conPath }/board/qnaList.do">묻고답하기</a></li>
				        <li><a href="${conPath }/board/sugList.do">건의합니다</a></li>
				        <li><a href="${conPath }/board/reviewList.do">탐방후기</a></li>
				        <li><a href="${conPath }/board/infoList.do">예약방법안내</a></li>
	       	 		</ul>
	      		</li>
	      		<li>
	        		<a href="${conPath }/reservation/List.do">마이페이지</a>
	        		<ul class="submenu">
	        			<li><a href="#">야영장</a></li>
	        		</ul>
	      		</li>
	   		</ul>
	    </nav>
		<div class="user">
		<c:if test="${empty member and empty admin}">
	    	<ul>
			    <li><a href="${conPath }/member/join.do">회원가입</a></li>	      	
	    		<li><a href="${conPath }/member/login.do"><span>로그인</span></a></li>
	      	</ul>
	    </c:if>
	    <c:if test="${not empty member or not empty admin }">
	    	<li><a href="${conPath }/member/pwConfirm.do">정보수정</a></li>	      	
	    	<li><a href="${conPath }/member/logout.do">로그아웃</a></li>
	    	<li><a> ${member.name }님</a></li>
	    </c:if>
    	</div>
	</div>
</body>
</html>