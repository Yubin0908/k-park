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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){

		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${suggestWriteResult eq 1 }">
		<script>
			alert('건의사항이 등록되었습니다.');
		</script>
	</c:if>
	<c:if test="${suggestDeleteResult eq 1 }">
		<script>
			alert('건의사항이 삭제되었습니다.');
		</script>
	</c:if>
	
	<div id="bbs_wrap">
    <br>
    <div class="sub_title">
    	<span>홈 >건의합니다</span>
      	<br>
      	<h2>건의합니다</h2>
      	<br>
    </div>
    <div class="search_wrap">
		<form action="">
			<select name="option" id="">
				<option value="all" selected>전체</option>
	          	<option value="stitle">제목</option>
	          	<option value="stext">내용</option>
			</select>
        <input type="search" name="search">
        <input type="submit" value="검색">
      </form>
    </div>
    <br>
    <br>
    <br>
    <div class="bbs_content">
      	<h5>총 <span>${cnt }</span> 건<button class="write" onclick="location.href='${conPath}/board/suggestWrite.do'">글쓰기</button></h5>
      
      	<table class="table">
	      	<colgroup>
	      		<col width="10%">
	      		<col width="15%">
	      		<col>
	      	</colgroup>
	        <tr class="bbs_content_title">
	          	<th>NO</th><th>작성자</th><th>제목</th><th>작성일</th><th>조회수</th>
	        </tr>
        <c:forEach items="${suggestList }" var="list">
        	<tr class="bbs_content_list">
        		<td>${list.sno }</td>
	          	<td>${list.writer }</td>
	          	
	          	<td>
	          	<c:forEach var="i" begin="1" end="${list.sindent }">
		          	<c:if test="${i eq list.sindent }">
	      				&nbsp; &nbsp; &nbsp; <img src="${conPath }/img/enter.png" alt="enter" width="15"/>
	     			</c:if>
	        		<c:if test="${i ne list.sindent }">
	          			&nbsp; &nbsp; &nbsp;
	          		</c:if>
          		</c:forEach>
	          	<a class="detail_a" href="${conPath }/board/sugDetail.do?sno=${list.sno}&pageNum=${paging.currentPage}&option=${param.option}&search=${param.search}">${list.stitle }</a></td>
	          	<td>${list.srdate }</td>
	          	<td>${list.shit }</td>
        	</tr>
        </c:forEach>
      </table>
    </div>
    <div class="paging">
      <c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/board/sugList.do?pageNum=${paging.startPage-1 }&option=${param.option}&search=${param.search}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/board/sugList.do?pageNum=${i }&option=${param.option}&search=${param.search}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/board/sugList.do?pageNum=${paging.endPage+1 }&option=${param.option}&search=${param.search}">다음</a> ]
			</c:if>
    </div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>