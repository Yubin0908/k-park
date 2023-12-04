<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${conPath }/css/reservationList.css">
</head>
<body>
	<c:if test="${reservationCancle eq 1 }">
		<script>
			alert('예약이 정상적으로 취소되었습니다.');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<br />
	<br />
	<div id="reserved_wrap">
    <h3>나의 예약목록</h3>

    <div class="reserved_board">
      <table>
        <colgroup>
          <col style="width: 12%;">
          <col style="width: 12%;">
          <col>
          <col style="width: 20%;">
          <col style="width: 20%;">
        </colgroup>
        <tr>
          <th>예약상태</th>
          <th>구분</th>
          <th>상품명</th>
          <th>예약일자</th>
          <th>예약취소</th>
        </tr>
        <c:if test="${ reservedList.size() eq 0}">
        	<tr>
        		<td colspan="5">예약내역이 존재하지 않습니다.</td>
        	</tr>
        </c:if>
        <c:forEach items="${reservedList }" var="list">
        	<tr>
        		<td>
        			<c:if test="${list.status eq 0 }"><span style="color:red; font-weight: 700;">예약취소</span></c:if>
        			<c:if test="${list.status eq 1 }"><span style="color:blue; font-weight: 700;">예약확정</span></c:if>
        		</td>
        		<td>
        			<c:if test="${list.shelterno eq '' and list.exploreno eq '' }">야영장</c:if>
        			<c:if test="${list.campno eq '' and list.exploreno eq '' }">대피소</c:if>
        			<c:if test="${list.campno eq '' and list.shelterno eq '' }">생태탐방원</c:if>
        		</td>
        		<td>
        			[${list.camp_parkname }${list.shelter_parkname }${list.explore_parkname }]${list.campname }${list.sheltername }${list.explorename }
        		</td>
        		<td>
        			${list.bdate }
        		</td>
        		<td>
        			<c:if test="${list.status eq 1 }">
							  <a href="javascript:void(0)" onclick="cancelReservation('${list.bno}', '${list.campno}', '${list.shelterno}', '${member.id}', '${list.bdate}')">예약취소하기</a>
							</c:if>
        		</td>
        	</tr>
        </c:forEach>
      </table>
    </div>
  </div>
  <br />
	<br />
	<script>
		function cancelReservation(bno, campno, shelterno, id, bdate) {
			var result = confirm('정말로 예약을 취소하시겠습니까?');
			if(result) {
				location.href = '${conPath}/reservation/cancleReservation.do?bno='+bno+'&campno='+campno+'&shelterno='+shelterno+'&id='+id+'&resdate='+bdate;
			} 
		}
	</script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>