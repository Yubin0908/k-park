<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${conPath }/css/board.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${not empty successMessage }">
		<script>
			alert('${successMessage}');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
      <br>
      <h2>공지사항</h2>
      <br>
    </div>
    <div class="bbs_detail">
      <br>
      <h2>${notice.ntitle }</h2>
      <br>
      <span>${notice.ndate } | 조회수 ${notice.nhit }</span>
      <br><br>
      <p class="hr"></p>
      <div class="view">
	       ${notice.ntext }
        <p class="hr"></p>
          <span class="bold">관리공원</span>
          <span class="normal"><a href="">${notice.parkname }</a></span>
          <br>
          <br>
        <p class="hr"></p>
      </div>
    </div>
    <div class="button">
    	<c:if test="${not empty admin }">
    		<button onclick="location.href='${conPath}/board/noticeModify.do?nno=${param.nno }&pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" style="cursor:pointer">글수정</button>
    		<button onclick="location.href='${conPath}/board/noticeDelete.do?nno=${param.nno }'" style="cursor:pointer">글 삭제</button>
    	</c:if>
      <button onclick="location.href='${conPath}/board/noticeList.do?pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" style="cursor:pointer">목록</button>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>