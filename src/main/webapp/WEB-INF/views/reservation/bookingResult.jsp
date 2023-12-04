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
    #result_wrap {
      width: 1400px;
      margin: 50px auto;
      text-align: center;
    }

    #result_wrap a {
      padding: 5px;
      background-color: #dddd;
      border-radius: 15px;
      text-decoration: none;
      color: #000;
    }
  </style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>

  <div id="result_wrap">
    <h2>${reservationResult }예약이 완료되었습니다.</h2>
	  <h4>자세한 예약내역을 확인 하시려면 아래 버튼을 누르세요.</h4>
	  <br />
	  <a href="${conPath }/reservation/reservationList.do?id=${member.id}">예약내역확인</a>
  </div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>