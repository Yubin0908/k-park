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
 		  $('#park').change(function() {
 		    const park_value = $(this).val();
 		       
 		    $.ajax({
 		      url: '${conPath}/reservation/bookingShelterList.do',
 		      method: 'get',
 		      data: 'parkname=' + park_value,
 		      success: function(data, status) {
 		        const shelterSelect = $('#shelter');
 		        shelterSelect.empty();
 		           
 		        const shelternoRegex = /shelterno=(\d+)/g; // 수정된 정규식: 숫자만을 추출
 		        const shelternameRegex = /sheltername=([^,]+)/g;
 		        let shelternoMatches = [...data.matchAll(shelternoRegex)]; // 수정된 부분: 모든 숫자 매치를 배열로 저장
 		        let shelternameMatches = data.match(shelternameRegex);

 		        if (shelternoMatches.length > 0 && shelternameMatches) {
 		          shelternoMatches = shelternoMatches.map(match => match[1]); // 매치된 숫자만 추출하여 배열로 저장
 		          shelternameMatches = shelternameMatches.map(match => match.split('=')[1]);
 		          
 		          console.log("shelterno:", shelternoMatches);
 		          console.log("sheltername:", shelternameMatches);
 		          
 		          for (let i = 0; i < shelternoMatches.length; i++) {
 		            const option = $('<option></option>').attr('value', shelternoMatches[i]).text(shelternameMatches[i]);
 		            shelterSelect.append(option);
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
        <option value="지리산">지리산</option>
        <option value="덕유산">덕유산</option>
        <option value="소백산">소백산</option>
      </select>
    </div>
    <div class="campSelector">
      <h3>2. 대피소 선택</h3>
      <select name="" id="shelter">
        <option value=""></option>
      </select>
    </div>
    <div class="dateSelector">
      <h3>3. 이용 일자 선택</h3>
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
      const shelterno = $('#shelter').val();
      const bdate = $('.selDate').text();

      const msg = '관리공원: '+ parkname +', 대피소: ' + shelterno + ', 예약일자: ' + bdate;

      if(parkname == '') {
        alert('공원선택이 안되었습니다. 확인해주세요.');
        return false;
      } else if(shelterno == '') {
        alert('대피소선택이 안되었습니다. 확인해주세요.');
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
      const shelternoinput = $('<input>').attr({
  	    type: 'hidden',
  	    id: 'shelterno',
  	    name: 'shelterno',
  	    value: shelterno
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
  	  $('#checkModal .modal-footer').append(shelternoinput);
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
        <form action="${conPath}/reservation/reservationShelter.do" method="get">
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
	 		  const shelterno = $('#shelter').val();
	 		  console.log('sel_date : ' + sel_date);
	 		  console.log('shelterno : ' + shelterno);

	 		  $.get('${conPath}/reservation/bookingShelterDate.do', {
	 		    resdate: sel_date,
	 		   	shelterno: shelterno
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