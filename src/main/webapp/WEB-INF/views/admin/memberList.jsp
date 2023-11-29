<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		* {
			margin: 0;
			padding: 0;
		}
		
		#memberList {
			width: 1400;
			margin: 0 auto;
		}
		
   #memberList table {
       width: 100%;
       border-collapse: collapse;
       margin-bottom: 20px;
       text-align: center;
       margin-left: 150px;
   }

   #memberList th,
   #memberList td {
       padding: 8px;
       text-align: left;
       border: 1px solid #ccc;
   }

   #memberList th {
       background-color: #f2f2f2;
       font-weight: bold;
   }

   #memberList td {
       background-color: #fff;
   }

   #memberList tr:nth-child(even) td {
       background-color: #f9f9f9;
   }
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<br />
	<br />
	<br />
	<span style="margin-left: 150px; color: #aaa;">총 가입 수 : ${cnt } 명</span>
	<div id="memberList">
		<table>
			<colgroup>
				<col width="15%">
				<col width="10%">
				<col>
				<col width="10%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<tr>
				<th>ID</th>
				<th>회원 이름</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
				<c:forEach items="${memberList }" var="list">
					</tr>
						<td>${list.id }</td>
						<td>${list.name }</td>
						<td>${list.address }</td>
						<td>${list.phone }</td>
						<td>${list.email }</td>
					<tr>
				</c:forEach>
			</tr>
		</table>
	</div>
	<div class="paging" style="text-align: center;">
    <c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/admin/memberList.do?pageNum=${paging.startPage-1 }">이전</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/admin/memberList.do?pageNum=${i }">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/admin/memberList.do?pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
  </div>
	<br />
	<br />
	<br />
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>