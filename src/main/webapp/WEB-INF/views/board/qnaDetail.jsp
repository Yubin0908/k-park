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
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('묻고답하기 수정이 완료되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
    	<br>
      	<h2>묻고답하기</h2>
      	<br>
    </div>
    <div class="bbs_detail">
    	<br>
    	<h2>Q. ${qna.qtitle }</h2>
    	<span> ${qna.id } | ${qna.qrdate }</span>
    	<p class="hr"></p>
    	<div class="view">
	       	${qna.qtext }
        	<p class="hr"></p>
	          	<span class="bold">관리공원</span>
	          	<span class="normal"><a href="">${qna.parkname }</a></span>
	          	<br>
	          	<br>
			<p class="hr"></p>
			<c:forEach var="i" begin="1" end="${qna.qindent }">
        		<c:if test="${i eq qna.qindent }">
        			&nbsp; &nbsp; &nbsp; <img src="${conPath }/img/enter.png" alt="enter" width="15"/>
        		</c:if>
        		<c:if test="${i != qna.qindent }">
        			&nbsp; &nbsp; &nbsp;
        		</c:if>
        	</c:forEach>
        	<span class="bold">A</span>
	        <span class="normal"><a href="">${qna.qtitle }</a></span>
	        <br>
	       	<br>
      	</div>
    </div>
    <div class="button">
    	<c:if test="${qna.id eq member.id }">
    		<button onclick="location.href='${conPath}/board/qnaModify.do?qno=${param.qno }&pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'">글수정</button>
    		<button onclick="location.href='${conPath}/board/qnaDelete.do?qno=${param.qno }'">글 삭제</button>
    	</c:if>
    	<c:if test="${not empty admin and admin.aid eq qna.aid }">
    		<button onclick="location.href='${conPath}/board/qnaReplyWrite.do?qno=${param.qno }&pageNum=${param.pageNum }'">답변</button>
    		<button onclick="location.href='${conPath}/board/qnaDelete.do?qno=${param.qno }'">글 삭제</button>
    	</c:if>
		<button onclick="location.href='${conPath}/board/qnaList.do?pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" style="cursor:pointer">목록</button>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>