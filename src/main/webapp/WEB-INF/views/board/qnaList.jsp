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
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
	
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${qnaWriteResult eq 1 }">
		<script>
			alert('글이 등록되었습니다.');
		</script>
	</c:if>
	<c:if test="${deleteResult eq 1 }">
		<script>
			alert('글이 삭제되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
	    <br>
	    	<div class="sub_title">
	    	<span><a href="${conPath }/" style="text-decoration: none; color: #000; font-weight: 400;">홈</a> > 고객마당 > <span style="font-weight: 600; display: inline-block;"> 묻고답하기</span></span>
	    	<br>
	    		<h2>묻고답하기</h2>
	    		<br>
	    	</div>
	    
	    <div class="search_wrap">
		    <form action="">
			    <select name="option" id="">
				    <option value="all" selected>전체</option>
				    <option value="qtitle">제목</option>
				    <option value="qtext">내용</option>
				    <option value="parkname">공원명</option>
			    </select>
			    <input type="search" name="search">
			    <input type="submit" value="조회">
		    </form>
		    </div>
		    <br>
		    <br>
		    <br>
		<div class="bbs_content">
	  		<h5>총 <span>${qnaCnt }</span> 건
	  		<c:if test="${not empty member }">
	  			<button class="write" onclick="location.href='${conPath}/board/qnaWrite.do'">글쓰기</button>
	  		</c:if>
	  		
	  		</h5>
		  	<table class="table">
		    	<colgroup>
		    		<col width="5%">
		    		<col width="10%">
		    		<col width="10%">
		    		<col width="25%">
		    		<col width="5%">
		    		<col width="10%">
		    		<col width="5%">
		    	</colgroup>
				<tr class="bbs_content_title">
					<th>No</th><th>공원명</th><th>문의유형</th><th>제목</th><th>작성자ID</th><th>등록일</th><th>상태</th>
			    </tr>
			    <c:forEach items="${qnaList }" var="list">
				    <tr class="bbs_content_list">
				       	<td>${list.qno }</td>
				       	<td>${list.parkname }</td>
				       	<td>${list.qtype }</td>
				        <td>
				        	<a class="detail_a" href="${conPath }/board/qnaDetail.do?qno=${list.qno}&pageNum=${paging.currentPage}&option=${param.option}&search=${param.search}&qgroup=${list.qgroup}">
			        			<c:if test="${list.qyn eq 'n' }">
			        				<img alt="비공개" src="${conPath }/img/closekey.jpg" style="width:20px;" >
			        			</c:if>${list.qtitle }
				        	</a>
				        </td>
				        <td>${list.id }</td>
				        <td>${list.qrdate }</td>
				        <td>
					        <c:if test="${list.qstatus eq 1 }">처리중</c:if>
					        <c:if test="${list.qstatus eq 2 }">처리완료</c:if>
				        </td>
					</tr>
		      	</c:forEach>
			</table>
		    <div class="paging">
		    	<c:if test="${paging.startPage>paging.blockSize}">
					[ <a href="${conPath }/board/qnaList.do?pageNum=${paging.startPage-1 }&option=${param.option}&search=${param.search}">이전</a> ]
				</c:if>	
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }"> 
						<b>[ ${i } ]</b> 
						</c:if>
						<c:if test="${paging.currentPage != i }">
							[ <a href="${conPath }/board/qnaList.do?pageNum=${i }&option=${param.option}&search=${param.search}">${i }</a> ]
						</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					[ <a href="${conPath }/board/qnaList.do?pageNum=${paging.endPage+1 }&option=${param.option}&search=${param.search}">다음</a> ]
				</c:if>
	    	</div>
	    </div>
    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>