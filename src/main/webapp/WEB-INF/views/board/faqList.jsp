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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${faqWriteResult eq 1 }">
		<script>
			alert('자주하는 질문이 등록되었습니다.');
		</script>
	</c:if>
	<c:if test="${fagDeleteResult eq 1 }">
		<script>
			alert('자주하는 질문이 삭제되었습니다.');
		</script>
	</c:if>
	
	<div id="bbs_wrap">
    <br>
    <div class="sub_title">
    	<span>홈 > 자주하는 질문</span>
      	<br>
      	<h2>자주하는 질문</h2>
      	<br>
    </div>
    <div class="search_wrap">
		<form action="">
			<select name="option" id="">
				<option value="all" selected>전체</option>
	          	<option value="ftitle">제목</option>
	          	<option value="ftext">답변</option>
			</select>
        <input type="search" name="search">
        <input type="submit" value="검색">
      </form>
    </div>
    <br>
    <br>
    <br>
    <div class="bbs_content">
      	<h5>총 <span>${cnt }</span> 건<c:if test="${not empty admin}" ><button class="write" onclick="location.href='${conPath}/board/faqWrite.do'">글쓰기</button></c:if></h5>
      
      	<table class="table">
      	<colgroup>
      		<col width="10%">
      		<col width="15%">
      		<col>
      	</colgroup>
        <tr class="bbs_content_title">
          	<th>순서</th><th>관리공원</th><th>제목</th>
        </tr>
        <c:forEach items="${faqList }" var="list">
        	<tr class="bbs_content_list">
        		<td>${list.fno }</td>
	          	<td>${list.parkname }</td>
	          	<td><a class="detail_a" href="${conPath }/board/faqDetail.do?fno=${list.fno}&pageNum=${paging.currentPage}&option=${param.option}&search=${param.search}">${list.ftitle }</a></td>
        	</tr>
        </c:forEach>
      </table>
    </div>
    <div class="paging">
      <c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/board/faqList.do?pageNum=${paging.startPage-1 }&option=${param.option}&search=${param.search}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/board/faqList.do?pageNum=${i }&option=${param.option}&search=${param.search}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/board/faqList.do?pageNum=${paging.endPage+1 }&option=${param.option}&search=${param.search}">다음</a> ]
			</c:if>
    </div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>













