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
 	<script>
 	$(document).ready(function() {
	  $('#park').change(function() { // 야영장 리스트 반환
	    const park_value = $(this).val();
	       
	     $.ajax({
	       url: '${conPath}/reservation/bookingCampList.do',
	       method: 'get',
	       data: 'parkname=' + park_value,
	       success: function(data, status) {
	         const campSelect = $('#camp');
	         campSelect.empty();
	           
	         const campnoRegex = /campno=(\d+)/g; // 모든 campno 추출
	         const campnameRegex = /campname=([^,]+)/g; // 모든 campname 추출
	         let campnoMatches = data.match(campnoRegex); // 모든 campno 결과를 배열로 저장
	         let campnameMatches = data.match(campnameRegex); // 모든 campname 결과를 배열로 저장
	          
	         if (campnoMatches && campnameMatches) {
	 				   campnoMatches = campnoMatches.map(match => match.split('=')[1]); // '=' 기준으로 값을 추출하여 배열로 저장
       			 campnameMatches = campnameMatches.map(match => match.split('=')[1]); // '=' 기준으로 값을 추출하여 배열로 저장
	              
             console.log("Campno:", campnoMatches);
             console.log("Campname:", campnameMatches);
             
             for (let i = 0; i < campnoMatches.length; i++) {
	             const option = $('<option></option>').attr('value', campnoMatches[i]).text(campnameMatches[i]);
	             campSelect.append(option);
             }
	           }
	       },
	         error: function(xhr, status, error) {
           	 console.error('AJAX 요청 오류:', error);
	         }
	      });
	    });
	 	});
 	</script>
 	
</head>
<body>
	<c:if test="${empty member }">
		<script>
			alert('에약은 회원만 가능합니다.');
			location.href='${conPath}/member/login.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="booking_wrap">
		<div id="res_wrap">
    <div class="campSelector">
      <h3>1. 관리공원 선택</h3>
      <select name="" id="park">
      	<option value="">공원</option>
        <option value="설악산">설악산</option>
        <option value="태백산">태백산</option>
        <option value="지리산">지리산</option>
        <option value="북한산">북한산</option>
      </select>
    </div>
    <div class="campSelector">
      <h3>2. 야영장 선택</h3>
      <select name="" id="camp">
        <option value=""></option>
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
        <input type="button" value="예약하기">
      </div>
    </div>
    </div>
  </div>
  <script>
    function call_confirm() {
      const parkname = $('#park').val();
      const campno = $('#camp').val();
      const bdate = $('.selDate').text();

      const msg = '관리공원: '+ parkname +', 야영장: ' + campno + ', 예약일자: ' + bdate;

      if(parkname == '') {
        alert('공원선택이 안되었습니다. 확인해주세요.');
        return false;
      } else if(campno == '') {
        alert('야영장선택이 안되었습니다. 확인해주세요.');
        return false;
      } else if(bdate == '') {
        alert('예약하실 날짜를 선택해주세요.');
        return false;
      }

      $('#reservationDetails').text(msg); // 모달 내용 설정

      $('#checkModal').modal('show'); // 모달 띄우기
      
      const parkinput = $('<input>').attr({
    	    type: 'hidden',
    	    id: 'parkname',
    	    name: 'parkname',
    	    value: parkname
    	  });
      const campnoinput = $('<input>').attr({
  	    type: 'hidden',
  	    id: 'campno',
  	    name: 'campno',
  	    value: campno
  	  });
      const bdateinput = $('<input>').attr({
  	    type: 'hidden',
  	    id: 'bdate',
  	    name: 'bdate',
  	    value: bdate
   	  });
      const resdateinput = $('<input>').attr({
  	    type: 'hidden',
  	    id: 'resdate',
  	    name: 'resdate',
  	    value: bdate
   	  });
      
      $('#checkModal .modal-footer').append(parkinput);
  	  $('#checkModal .modal-footer').append(campnoinput);
  	  $('#checkModal .modal-footer').append(bdateinput);
  	  $('#checkModal .modal-footer').append(resdateinput);
    }
  </script>
  <div class="modal" id="checkModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
         <h5 class="modal-title">예약 내용을 확인해주세요.</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
         </button>
        </div>
        <div class="modal-body">
          <p id="reservationDetails"></p>
        </div>
        <form action="${conPath}/reservation/reservationCamp.do" method="get">
        	<div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <input type="submit" class="btn btn-secondaty" value="예약하기">
        	</div>
        </form>
      </div>
    </div>
 	</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
	
	<script>
	 	$(document).ready(function() {
	 		$('.selDate').text(''); // 초기 값 설정

	 		$('.btn input[type="button"]').on('click', function() {
	 		  const sel_date = $('.selDate').text();
	 		  const campno = $('#camp').val();
	 		  console.log('sel_date : ' + sel_date);
	 		  console.log('campno : ' + campno);

	 		  $.get('${conPath}/reservation/bookingDate.do', {
	 		    resdate: sel_date,
	 		    campno: campno
	 		  }, function(data) {
	 		    const parser = new DOMParser();
	 		    const parsedHtml = parser.parseFromString(data, 'text/html');
	 		    const bodyContent = parsedHtml.querySelector('body').textContent.trim();
	 		    if (bodyContent === '1') {
	 		    	call_confirm();
	 		    } else if (bodyContent === '0') {
	 		      alert('예약이 불가합니다. 다른 날짜를 선택하세요.');
	 		    } else {
	 		      alert('응답 데이터에 오류가 있습니다.');
	 		    }
	 		  }).fail(function(xhr, status, error) {
	 		    console.error('AJAX 요청 오류:', error);
	 		  });
	 		});
	 	});
 	</script>
</body>
</html>