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
	<c:if test="${not empty reviewWriteResult}">
		<script>
			alert('${reviewWriteResult}');
		</script>
	</c:if>
	<c:if test="${reviewDeleteResult eq 1 }">
		<script>
			alert('리뷰가 삭제되었습니다.');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>

	<div id="bbs_wrap">
    <div class="sub_title">
      <span><a href="${conPath }/" style="text-decoration: none; color: #000; font-weight: 400;">홈</a> > 고객마당 > <span style="font-weight: 600; display: inline-block;">탐방후기</span></span>
      <br>
      <h2>탐방 후기</h2>
      <br>
    </div>
    <br>
    <br>
    <br>
    <div class="bbs_content">
      <h5>총 <span>${cnt }</span> 건<button class="write" onclick="location.href='${conPath}/board/reviewWrite.do'">글쓰기</button></h5>
      
      <table class="table">
      	<colgroup>
      		<col width="10%">
      		<col width="15%">
      		<col>
      		<col width="15%">
      		<col width="15%">
      	</colgroup>
        <tr class="bbs_content_title">
          <th>No</th><th>작성자</th><th>제목</th><th>조회수</th><th>등록일</th>
        </tr>
        <c:forEach items="${reviewList }" var="list">
        	<tr class="bbs_content_list">
	          <td>
	          	${list.rno }
	          </td>
	          <td>${list.id }</td>
	          <td><a class="detail_a" href="${conPath }/board/reviewDetail.do?rno=${list.rno}&pageNum=${paging.currentPage}">${list.rtitle }</a></td>
	          <td>${list.rhit }</td>
	          <td>${list.rrdate }</td>
        	</tr>
        </c:forEach>
      </table>
    </div>
    <div class="paging">
      <c:if test="${paging.startPage>paging.blockSize}">
				<a href="${conPath }/board/reviewList.do?pageNum=${paging.startPage-1 }"><img src="${conPath }/img/arrow-left.png" alt="" height="15"/></a>
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b><img src="${conPath }/img/bracket-left-curr.png" alt="" height="15"/> ${i} <img src="${conPath }/img/bracket-right-curr.png" alt="" height="15"/></b>
				</c:if>
				<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/board/reviewList.do?pageNum=${i }"><img src="${conPath }/img/bracket-left.png" alt="" height="15"/> ${i } <img src="${conPath }/img/bracket-right.png" alt="" height="15"/></a>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				&nbsp;<a href="${conPath }/board/reviewList.do?pageNum=${paging.endPage+1 }"><img src="${conPath }/img/arrow-right.png" alt="" height="15"/></a>
			</c:if>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>