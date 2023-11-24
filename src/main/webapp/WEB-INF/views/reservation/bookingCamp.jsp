<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${conPath }/css/reservation.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="${conPath }/js/calendar.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="booking_wrap">
		<div id="res_wrap">
    <div class="campSelector">
      <h3>1. 관리공원 선택</h3>
      <select name="" id="park">
        <option value="설악산">설악산</option>
        <option value="태백산">태백산</option>
        <option value="지리산">지리산</option>
        <option value="북한산">북한산</option>
      </select>
    </div>
    <div class="campSelector">
      <h3>2. 야영장 선택</h3>
      <select name="" id="camp">
        <option value="1번 야영장">1번 야영장</option>
        <option value="2번 야영장">2번 야영장</option>
        <option value="3번 야영장">3번 야영장</option>
        <option value="4번 야영장">4번 야영장</option>
      </select>
    </div>
    <div class="dateSelector">
      <h3>3. 야영 날짜 선택</h3>
      <div class="wrapper">
        <div class="nav">
          <button class="material-icons none" id="prev"> &lt; </button>
          <p class="current-date"></p>
          <button class="material-icons" id="next"> &gt; </button>
        </div>
      <div class="calendar">
        <ul class="weeks">
          <li>일</li>
          <li>월</li>
          <li>화</li>
          <li>수</li>
          <li>목</li>
          <li>금</li>
          <li>토</li>
        </ul>
        <ul class="days">
          
        </ul>
      </div>
      <div class="btn">
        <span>선택한 날짜 : </span><span class="selDate"></span><br>
        <input type="button" value="예약하기" onclick="call_confirm()">
      </div>
    </div>
    </div>
  </div>
  <script>
    function call_confirm() {
      const park = $('#park').val();
      const camp = $('#camp').val();
      const selDate = $('.selDate').text();

      const msg = `관리공원: ${park}, 야영장: ${camp}, 예약일자: ${selDate}`;

      if(park == '') {
        alert('공원선택이 안되었습니다. 확인해주세요.');
        return false;
      } else if(camp == '') {
        alert('야영장선택이 안되었습니다. 확인해주세요.');
        return false;
      } else if(selDate == '') {
        alert('예약하실 날짜를 선택해주세요.');
        return false;
      }

      $('#reservationDetails').text(msg); // 모달 내용 설정

      $('#checkModal').modal('show'); // 모달 띄우기
    }
  </script>
  <div class="modal" id="checkModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
         <h5 class="modal-title">예약 확인</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
         </button>
        </div>
        <div class="modal-body">
          <p id="reservationDetails"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-secondaty">예약하기</button>
        </div>
      </div>
    </div>
 	</div>
	</div>
</body>
</html>