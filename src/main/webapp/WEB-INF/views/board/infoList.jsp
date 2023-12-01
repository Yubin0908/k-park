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
	<c:if test="${infoWriteResult eq 1 }">
		<script>
			alert('예약안내글이 등록되었습니다.');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 1 }">
		<script>
			alert('예약안내글이 삭제되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <br>
    <div class="sub_title">
    	<span><a href="${conPath }/" style="text-decoration: none; color: #000; font-weight: 400;">홈</a> > 알림마당 > <span style="font-weight: 600; display: inline-block;"> 예약방법안내</span></span>
	    <br>
	    <h2>예약방법안내</h2>
	    <br>
    </div>
    <div class="search_wrap">
		<form action="">
  			<select name="option" id="">
    			<option value="all" selected>전체</option>
    			<option value="ntitle">제목</option>
    			<option value="ntext">내용</option>
  			</select>
  			<input type="search" name="search">
  			<input type="submit" value="조회">
		</form>
    </div>
    <br>
    <br>
    <br>
    <div class="bbs_content">
    	<h5>총 <span>${cnt }</span> 건
    	<c:if test="${not empty admin }">
    		<button class="write" onclick="location.href='${conPath}/board/infoWrite.do'">글쓰기</button>
      	</c:if></h5>
      	<table class="table">
	      	<colgroup>
	      		<col width="8%">
	      		<col width="8%">
	      		<col width="8%">
	      		<col width="25%">
	      		<col width="15%">
	      	</colgroup>
        	<tr class="bbs_content_title">
          		<th>No</th><th>공원명</th><th>유형</th><th>제목</th><th>등록일</th>
        	</tr>
        	<c:forEach items="${infoList }" var="list">
	        	<tr class="bbs_content_list">
		          	<td>${list.ino }</td>
		          	<td>${list.parkname }</td>
		          	<td>${list.itype }</td>
		          	<td><a class="detail_a" href="${conPath }/board/infoDetail.do?ino=${list.ino}&pageNum=${paging.currentPage}&option=${param.option}&search=${param.search}">${list.ititle }</a></td>
		          	<td>${list.irdate }</td>
	        	</tr>
        	</c:forEach>
      	</table>
    </div>
    <div class="paging">
      <c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/board/infoList.do?pageNum=${paging.startPage-1 }&option=${param.option}&search=${param.search}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/board/infoList.do?pageNum=${i }&option=${param.option}&search=${param.search}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/board/infoList.do?pageNum=${paging.endPage+1 }&option=${param.option}&search=${param.search}">다음</a> ]
			</c:if>
    	</div>
  	</div>
  	<jsp:include page="../main/footer.jsp"/>
</body>
</html>