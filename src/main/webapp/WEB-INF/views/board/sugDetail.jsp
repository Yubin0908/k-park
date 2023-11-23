<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('건의사항 수정이 완료되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
      <br>
      <h2>건의사항</h2>
      <br>
    </div>
		<h3>${param.sno }번 글의 상세보기</h3>
    <div class="bbs_detail">
      <p class="hr"></p>
      <div class="view">
		 제목 : ${suggest.stitle }
      	<br>
      	<br>
      	<hr>
      	<br>
		내용 : ${suggest.stext }
	       
        <p class="hr"></p>
          <span class="bold">작성자</span>
          <span class="normal"><a href="">${suggest.id } ${suggest.aid }</a></span>
          <br>
          <br>
        <p class="hr"></p>
      </div>
    </div>
    <div class="button">
    	<button onclick="location.href='${conPath}/board/suggestModify.do?sno=${param.sno }&pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'">글수정</button>
    	<button onclick="location.href='${conPath}/board/suggestReplyWrite.do?sno=${param.sno}&pageNum=${param.pageNum}'">답변</button>
    	<button onclick="location.href='${conPath}/board/suggestDelete.do?sno=${param.sno }'">글 삭제</button>
		<button onclick="location.href='${conPath}/board/sugList.do?pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" style="cursor:pointer">목록</button>
    </div>
  	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>

