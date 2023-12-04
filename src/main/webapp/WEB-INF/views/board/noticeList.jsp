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
	<c:if test="${not empty successMessage}">
		<script>
			alert('${successMessage}');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 1 }">
		<script>
			alert('공지사항이 삭제되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
      <span><a href="${conPath }/" style="text-decoration: none; color: #000; font-weight: 400;">홈</a> > 알림마당 > <span style="font-weight: 600; display: inline-block;">공지사항</span></span>
      <br>
      <h2>공지사항</h2>
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
      <h5>총 <span>${cnt }</span> 건<c:if test="${not empty admin }"><button class="write" onclick="location.href='${conPath}/board/noticeWrite.do'">글쓰기</button></c:if></h5>
      
      <table class="table">
      	<colgroup>
      		<col width="10%">
      		<col width="15%">
      		<col>
      		<col width="15%">
      		<col width="15%">
      	</colgroup>
        <tr class="bbs_content_title">
          <th>No</th><th>공원명</th><th>제목</th><th>조회수</th><th>등록일</th>
        </tr>
        <c:forEach items="${noticeList }" var="list">
        	<tr class="bbs_content_list">
	          <td>
	          	<c:if test="${list.ntop eq 1}">
	          		주요공지
	          	</c:if>
	          	<c:if test="${list.ntop eq 0 }">
	          		${list.nno }
	          	</c:if>
	          </td>
	          <td>${list.parkname }</td>
	          <td><a class="detail_a" href="${conPath }/board/noticeDetail.do?nno=${list.nno}&pageNum=${paging.currentPage}&option=${param.option}&search=${param.search}">${list.ntitle }</a></td>
	          <td>${list.nhit }</td>
	          <td>${list.ndate }</td>
        	</tr>
        </c:forEach>
      </table>
    </div>
    <div class="paging">
      <c:if test="${paging.startPage>paging.blockSize}">
				<a href="${conPath }/board/noticeList.do?pageNum=${paging.startPage-1 }&option=${param.option}&search=${param.search}"><img src="${conPath }/img/arrow-left.png" alt="" height="15"/></a>&nbsp;
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b><img src="${conPath }/img/bracket-left-curr.png" alt="" height="15"/> ${i} <img src="${conPath }/img/bracket-right-curr.png" alt="" height="15"/></b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					<a href="${conPath }/board/noticeList.do?pageNum=${i }&option=${param.option}&search=${param.search}"><img src="${conPath }/img/bracket-left.png" alt="" height="15"/> ${i } <img src="${conPath }/img/bracket-right.png" alt="" height="15"/></a>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				&nbsp;<a href="${conPath }/board/noticeList.do?pageNum=${paging.endPage+1 }&option=${param.option}&search=${param.search}"><img src="${conPath }/img/arrow-right.png" alt="" height="15"/></a>
			</c:if>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>