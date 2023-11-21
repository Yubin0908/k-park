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
	<link rel="stylesheet" href="${conPath }/css/cmt.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${reviewModifyResult eq 1 }">
		<script>
			alert('탐방후기가 수정되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
      <br>
      <h2>탐방후기</h2>
      <br>
    </div>
    <div class="bbs_detail">
      <br>
      <h2>${review.rtitle }</h2>
      <br>
      <span>${review.rrdate } | 조회수 ${review.rhit } | ${review.rip }</span>
      <br><br>
      <p class="hr"></p>
      <div class="view">
	       ${review.rtext }
          <br>
       	<br />
      	<br />
      	<br />
        <p class="hr"></p>
        <br />
      	<div class="cmt">
      			<table>
      				<c:forEach items="${reviewCmt }" var="cmt">  				
      				<tr class="cmt_tr">
      					<td><span> ${cmt.cname } (${cmt.crdate })&nbsp;</span></td>
      					<td><h5>${cmt.cmemo }</h5></td>
      				</tr>
      				</c:forEach>
      			</table>
      	</div>
      	<div class="paging">
		      <c:if test="${paging.startPage>paging.blockSize}">
						[ <a href="${conPath }/board/reviewDetail.do?cpageNum=${paging.startPage-1 }&pageNum=${param.pageNum}&rno=${param.rno}&after=u">이전</a> ]
					</c:if>	
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						<c:if test="${paging.currentPage==i }"> 
							<b>[ ${i } ]</b> 
						</c:if>
						<c:if test="${paging.currentPage != i }">
							[ <a href="${conPath }/board/reviewDetail.do?cpageNum=${i }&pageNum=${param.pageNum}&rno=${param.rno}&after=u">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage<paging.pageCnt }">
						[ <a href="${conPath }/board/reviewList.do?cpageNum=${paging.endPage+1 }&pageNum=${param.pageNum}&rno=${param.rno}&after=u">다음</a> ]
					</c:if>
		    </div>
		    <br />
		    <hr />
		    <br />
      </div>
    </div>
    <div class="button">
    	<button onclick="location.href='${conPath}/board/reviewModify.do?rno=${param.rno }&pageNum=${param.pageNum }'">글수정</button>
    	<button onclick="location.href='${conPath}/board/reviewDelete.do?rno=${param.rno }'">글 삭제</button>
      <button onclick="location.href='${conPath}/board/reviewList.do?pageNum=${param.pageNum }'" style="cursor:pointer">목록</button>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>