<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Reserved List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }
    #List_wrap {
    	width: 1400px;
      margin: 20px auto;
      text-align: center;
      min-height: 630px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f7f7f7;
      font-weight: bold;
    }
    tr:hover {
      background-color: #f4f4f4;
    }
    .camping {
      color: #007bff;
    }
    .camping:hover {
      color: #0056b3;
    }
    .campground {
      color: #28a745;
    }
    .campground:hover {
      color: #1a741a;
    }
    .explore {
      color: #ffc107;
    }
    .explore:hover {
      color: #d39e00;
    }
    .adjust-link {
    	text-align: right;
    	margin-right: 15px;
      text-decoration: none;
      color: #fff;
      background-color: orange;
      padding: 8px 16px;
      border-radius: 4px;
      float: inline-end;
      border: none;
    }
    .adjust-link:hover {
      background-color: #ffa500;
    }
    input[name="rem"] {
    	text-align: center;
    	padding: 5px;
    	width: 45px;
    	display: inline-block;
    	float: inline-end;
    }
    .search_wrap {
    	text-align: left;
    }
    .search_wrap input[type="submit"] {
    	padding: 5px;
    	border: none;
    	border-radius: 15px;
    	background-color: orange;
    }
    .search_wrap input[type="date"] {
    	padding: 5px;
    	
    }
    .plus {
    	width: 30px;
    	height: 30px;
    	float: right;
    	margin: 5px;
    	cursor: pointer;
    }
  </style>
</head>
<body>
<c:if test="${ControlResult eq 1 }">
	<script>
		alert('예약가능한 잔여량이 수정되었습니다.');
	</script>
</c:if>
	<jsp:include page="../main/header.jsp"/>
	<br /><br /><br />
  <div id="List_wrap">
  	<div class="search_wrap">
  		<form action="">
  			<input type="hidden" name="parkname" value="${param.parkname }">
  			<input type="date" name="search" placeholder="2023-11-30" required/>
  			<input type="submit" value="조회"/>
  		</form>
  		<span style="color: red; font-weight: 700;">※ 이전 날짜 확인은 검색을 이용하여 주시기 바랍니다.</span>
  	</div>
  	<form action="${conPath }/reservation/addDate.do" method="get" id="addForm">
  		<input type="hidden" name="parkname" value="${param.parkname }" />
  		<select name="type" style="margin-left: 1250px; margin-top: 10px;">
  			<option value="camp">아영장</option>
  			<option value="shelter">대피소</option>
  		</select>
  		<img src="${conPath }/img/plus.png" alt="" class="plus" id="submitBtn" />
  	</form>
  	
    <table>
      <tr>
        <th>날짜</th>
        <th>관리번호</th>
        <th>시설타입</th>
        <th>시설명</th>
        <th>예약가능한 자리</th>
      </tr>
      <c:forEach items="${reservedList}" var="list">
        <tr>
          <td>${list.resdate}</td>
          <td>
						<c:if test="${list.campno eq '' && list.exploreno eq '' }">${list.shelterno }</c:if>
						<c:if test="${list.shelterno eq '' && list.exploreno eq '' }">${list.campno }</c:if>
						<c:if test="${list.campno eq '' && list.shelterno eq '' }">${list.exploreno }</c:if>
					</td>
          <td>
            <c:if test="${list.campno eq '' && list.exploreno eq ''}">
              <span class="camping">대피소</span>
            </c:if>
            <c:if test="${list.shelterno eq '' && list.exploreno eq ''}">
              <span class="campground">야영장</span>
            </c:if>
            <c:if test="${list.shelterno eq '' && list.campno eq ''}">
              <span class="explore">생태탐방원</span>
            </c:if>
          </td>
          <td>${list.campname}${list.sheltername}${list.explorename}</td>
          <td>
			      <span style="float: inline-start;">${list.rem}</span>
			      <form action="${conPath }/reservation/adminRemControl.do" method="post">
			      	<input type="hidden" name="resno" value="${list.resno }" />
			      	<input type="hidden" name="resdate" value="${list.resdate }" />
			      	<input type="hidden" name="parkname" value="${param.parkname }" />
			        <input type="number" name="rem" id="rem" placeholder="변경값" required min="0"/>
			        <input type="submit" value="조정" class="adjust-link"/>
			      </form>
				   </td>
        </tr>
      </c:forEach>
    </table>
  </div>
	<script>
	  document.getElementById('submitBtn').addEventListener('click', function() {
	    document.getElementById('addForm').submit();
	  });
</script>
  <br /><br /><br />
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>
