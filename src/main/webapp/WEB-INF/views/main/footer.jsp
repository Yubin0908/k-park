<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	@font-face {
	    font-family: 'GangwonEduHyeonokT_OTFMediumA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduHyeonokT_OTFMediumA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{margin: 0; padding: 0;}
	footer {
		font-family: 'GangwonEduHyeonokT_OTFMediumA';
		width: 100%;
		height:60px; background-color: white;
		margin:0 auto;
 	}
	footer #content {
		color: black;
		font-weight: blod;
		height: 60px;		
		font-size:25px;
		text-align: center; 
		border-top: 2px solid gray;
		margin-top: 20px;
		padding:10px 50px 0;
</style>
<body>
	<footer>
	    <div id="content">
	    	(국립공원공단) 서울특별시 서대문로 189 (우)24456&nbsp;&nbsp;/ 
			사업자등록번호: 947-82-54321&nbsp;&nbsp;/
			예약안내: 7870-7520 (평일 09-18시, 점심시간 12-13시)&nbsp;&nbsp;/
	        FAX: 02-578-0101&nbsp;&nbsp;/
			이메일: kpark&#64;kpark.or.kr
			<br>
			Copyright@Korea National Park Service. All Rights Reserved.
			<a href="${conPath}/main/copyrightPolicy.do" class="btn" 
				style="font-weight: bold; color: blue; background: lightgray;
	        	">저작권정책</a><!-- text-decoration: none; -->
	        <a href="http://www.knps.or.kr/portal/main/contents.do?menuNo=7020135" class="btn" target="_blank" 
	        	rel="noopener noreferrer" style="font-weight: bold; color: blue; background: lightgray;
	        	">개인정보처리방침</a><!-- text-decoration: none; -->
	        <a href="${conPath }/admin/adminLogin.do" class="btn" 
				style="font-weight: bold; color: blue; background: yellow;
	        	text-decoration: none;">관리자</a>
	    </div>
	</footer>
</body>
</html>