<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		 body {
	     font-family: Arial, sans-serif;
	     margin: 0;
	     padding: 0;
	     background-color: #f5f5f5;
    }

   #add_wrap {
	   width: 80%;
	   margin: 0 auto;
	   padding: 20px 0;
   }

   .form_container {
	   background-color: #fff;
	   border-radius: 8px;
	   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	   margin-bottom: 20px;
	   padding: 20px;
   }

   h2 {
	   margin-top: 0;
	   font-size: 24px;
	   color: #333;
	   line-height: 100px;
	   text-align: center;
   }

   form {
	   display: flex;
	   flex-direction: column;
	   gap: 10px;
	   max-width: 400px;
	   margin: 0 auto;
   }

   select, input[type="date"], input[type="submit"] {
	   padding: 10px;
	   border-radius: 4px;
	   border: 1px solid #ccc;
	   font-size: 16px;
   }

   input[type="submit"] {
	   background-color: orange;
	   color: white;
	   cursor: pointer;
	   transition: background-color 0.3s;
   }

   input[type="submit"]:hover {
   	background-color: orange;
   }
	</style>	
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${param.addResult eq 2 }">
		<script>
			alert('해당날짜에 등록된 예약일이 존재합니다.');
			history.back();
		</script>
	</c:if>
	<c:if test="${param.addResult eq 1 }">
		<script>
			alert('예약일이 정상적으로 등록되었습니다.');
			history.back();
		</script>
	</c:if>
	
	<div id="add_wrap">
		<div class="form_container">
			<h2>당일 예약일 등록</h2>
			<form action="${conPath }/reservation/todayAdd.do" method="get">
				<c:if test="${not empty campList }">
					<select name="campno" id="">
						<c:forEach items="${campList }" var="camp">
							<option value="${camp.campno }">${camp.campname }
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${not empty shelterList }">
					<select name="shelterno" id="">
						<c:forEach items="${shelterList }" var="shelter">
							<option value="${shelter.shelterno }">${shelter.sheltername }
						</c:forEach>
					</select>
				</c:if>
				<input type="hidden" name="resdate" id="todayDate" />
				<input type="hidden" name="type" value="${param.type }" />
				<input type="submit" value="저장" />
			</form>
		</div>
		<div class="form_container">
			<h2>익일 예약일 등록</h2>
			<form action="${conPath }/reservation/nextdayAdd.do" method="get">
				<c:if test="${not empty campList }">
					<select name="campno" id="">
						<c:forEach items="${campList }" var="camp">
							<option value="${camp.campno }">${camp.campname }
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${not empty shelterList }">
					<select name="shelterno" id="">
						<c:forEach items="${shelterList }" var="shelter">
							<option value="${shelter.shelterno }">${shelter.sheltername }
						</c:forEach>
					</select>
				</c:if>
				<input type="hidden" name="resdate" id="nextdate"/>
				<input type="hidden" name="type" value="${param.type }" />
				<input type="submit" value="저장" />
			</form>
		</div>
		<div class="form_container">
			<h2>지정일자 예약일 등록</h2>
			<form action="${conPath }/reservation/preDateAdd.do" method="get">
				<c:if test="${not empty campList }">
					<select name="campno" id="">
						<c:forEach items="${campList }" var="camp">
							<option value="${camp.campno }">${camp.campname }
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${not empty shelterList }">
					<select name="shelterno" id="">
						<c:forEach items="${shelterList }" var="shelter">
							<option value="${shelter.shelterno }">${shelter.sheltername }
						</c:forEach>
					</select>
				</c:if>
				<input type="hidden" name="type" value="${param.type }" />
				<input type="date" name="resdate"/>
				<input type="submit" value="저장" />
			</form>
		</div>
	</div>
	<script>
	  $(document).ready(function() {
	    var today = new Date();
	    var year = today.getFullYear();
	    var month = (today.getMonth() + 1).toString().padStart(2, '0');
	    var day = today.getDate().toString().padStart(2, '0');
	
	    var todayDateString = year + '-' + month + '-' + day;
	    $('#todayDate').val(todayDateString);
	  });
   </script>
   <script>
	  $(document).ready(function() {
	    var nextday = new Date();
	    nextday.setDate(nextday.getDate() + 1);
	    var year = nextday.getFullYear();
	    var month = (nextday.getMonth() + 1).toString().padStart(2, '0');
	    var day = nextday.getDate().toString().padStart(2, '0');
	
	    var nextdayDateString = year + '-' + month + '-' + day;
	    $('#nextdate').val(nextdayDateString);
	  });
   </script>
   <jsp:include page="../main/footer.jsp"/>
</body>
</html>