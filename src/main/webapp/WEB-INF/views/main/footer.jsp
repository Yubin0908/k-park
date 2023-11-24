<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		font-size:0.8em;
		text-align: center; 
		border-top: 2px solid gray;
		margin-top: 20px;
		padding:10px 50px 0;
</style>
<body>
	<footer>
	    <div id="content">
	    	(국립공원공단) 강원도 원주시 혁신로 22 (우)26466&nbsp;&nbsp;/ 
			사업자등록번호: 211-82-06541&nbsp;&nbsp;/
			예약안내: 1670-9201 (평일 09-18시, 점심시간 12-13시)&nbsp;&nbsp;/
	        FAX: 033-769-9579&nbsp;&nbsp;/
			이메일: csnp&#64;knps.or.kr
			<br>
			Copyright@Korea National Park Service. All Rights Reserved.
			<a href="https://reservation.knps.or.kr/contents/copyrightPolicy.do" class="btn" 
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