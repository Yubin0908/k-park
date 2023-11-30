<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/board.css" rel="stylesheet">
	<style>
		.button button{
			cursor:pointer;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('자주하는 질문 수정이 완료되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
      <br>
      <h2>자주하는 질문</h2>
      <br>
    </div>
    <div class="bbs_detail">
      <p class="hr"></p>
      <div class="view">
      	   Q. ${faq.ftitle }
      	   <br>
	       A. ${faq.ftext }
        <p class="hr"></p>
          <span class="bold">관리공원</span>
          <span class="normal"><a href="">${faq.parkname }</a></span>
          <br>
          <br>
        <p class="hr"></p>
      </div>
    </div>
    <div class="button">
    	<c:if test="${not empty admin}" >
    		<button onclick="location.href='${conPath}/board/faqModify.do?fno=${param.fno }&pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'">글수정</button>
    	</c:if>
    	<c:if test="${not empty admin}" >
    		<button onclick="location.href='${conPath}/board/faqDelete.do?fno=${param.fno }'">글 삭제</button>
    	</c:if>
		<button onclick="location.href='${conPath}/board/faqList.do?pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'">목록</button>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>
















