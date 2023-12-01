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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${not empty modifyResult}">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
    	<br>
      	<h2>예약방법안내</h2>
      	<br>
    </div>
    <div class="bbs_detail">
    	<br>
    	<h2>Q. ${infomation.ititle }</h2>
    	<p class="hr"></p>
    	<div class="view">
	       	${infomation.itext }
        	<p class="hr"></p>
	          	<span class="bold">관리공원</span>
	          	<span class="normal"><a href="">${qna.parkname }</a></span>
	          	<br>
	          	<br>
			<p class="hr"></p>
      	</div>
    </div>
    <div class="button">
    	<c:if test="${not empty admin }">
    		<button onclick="location.href='${conPath}/board/infoModify.do?ino=${param.ino }&pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" 
    			style="cursor:pointer">글수정
    		</button>
    	</c:if>
    	<c:if test="${not empty admin }">
    		<button onclick="location.href='${conPath}/board/infoDelete.do?ino=${param.ino }'" 
    			style="cursor:pointer">글 삭제
    		</button>
    	</c:if>
		<button onclick="location.href='${conPath}/board/infoList.do?pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" style="cursor:pointer">목록</button>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>