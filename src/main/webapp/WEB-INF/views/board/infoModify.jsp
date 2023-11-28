<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/board.css" rel="stylesheet"/>
	<style>
  		input[name="ititle"] {
			width: 95%;
		  	padding: 5px;
		 	border-radius: 5px;
		  	outline: none !important;
		}
		select[name="itype"], input[name="iparkname"] {
		  	width: 15%;
		  	padding: 5px;
		  	border-radius: 5px;
		  	outline: none !important;
		}
  	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
   		<div class="sub_title">
     		<h2>자주하는질문 글수정</h2>
   		</div>
	   	<br>
	   	<hr>
		<br>
		<form action="${conPath }/board/infoModify.do?after=u" method="post">
			<input type="hidden" name="ino" value="${param.ino }"/>
			<input type="hidden" name="search" value="${param.search }"/>
			<input type="hidden" name="option" value="${param.option }" />
			<input type="hidden" name="pageNum" value="${param.pageNum }" />
			<table class="writeTable">
	  			<tr class="RH_title">
	    			<td>제목</td>
	    			<td><input type="text" name="ititle" value="${infomation.ititle }"></td>
				</tr>
				<tr class="RH_writer">
	  				<td>작성자</td>
	  				<td><input type="text" name="aid" value="${infomation.aid }" readonly="readonly"></td>
				</tr>
				<tr>
					<td >공원명</td>
					<td><input type="text" name="iparkname" value="${infomation.iparkname }"></td>
				</tr>
				<tr>
					<td>문의유형</td>
					<td>
						<select name="itype">
							<option value="야영장">탐방</option>
							<option value="대피소">대피소</option>
							<option value="생태탐방원">생태탐방원</option>
						</select>
					</td>
				</tr>
				<tr class="RH_text">
	  				<td>내용</td>
	  				<td><textarea name="itext" id="" cols="30" rows="10">${infomation.itext }</textarea></td>
				</tr>
	      		<tr>
	        		<td class="submit_btn" colspan="2">
	          			<input type="submit" value="글수정">
	        		</td>
	      		</tr>
	    	</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>