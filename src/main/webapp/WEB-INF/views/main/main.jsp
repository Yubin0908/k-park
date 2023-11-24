<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@5/swiper-bundle.min.css"> <!-- swiper css -->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script><!-- swiper js -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- jQuery js -->
  <link rel="stylesheet" href="${conPath }/css/main.css">
  <style>
    .main-swiper {
      width: 450px;
      height: 650px;
      background-color: #333;
      border-radius: 25px 0 0 25px;
      border: 1px solid #000;
      overflow: hidden;
    }
    .notice_title {
      color: #fff;
      font-weight: bold;
      font-size: 30px;
      margin: 15px 0 -40px 25px;
    }
    
    .main-swiper .swiper-slide {
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 500px;
    }
    
    .main-swiper .swiper-slide img {
      object-fit: cover;
      height: 80%;
      width: 85%;
    }
  </style>
  <script>
    $(document).ready(function() {
      $('ul.content_nav li').on('click', 'a', function(e) {
        e.preventDefault();
        var tabId = $(this).parent().data('tabid');
        var jspFile = '${conPath}/main/' + tabId + '.do';

        $.ajax({
          url: jspFile,
          type: 'GET',
          dataType: 'html',
          success: function(response) {
	          $('.content_tab').html(response);
           var swiper2 = new Swiper('.second-swiper', {
             loop: true,
             slidesPerView: 1,
             spaceBetween: 40,
             slidesPerGroup: 1,
             navigation: {
               nextEl: '.swiper-button-nextA',
               prevEl: '.swiper-button-prevA',
             },
       		});
         }	
     	 });
      });
    });
  </script>
</head>
<body>
	<c:if test="${modifyResult eq 1 }">
		<script>alert('정보 수정이 완료되었습니다.');</script>
	</c:if>
	<c:if test="${withdrawal eq 1 }">
		<script>alert('회원 탈퇴가 완료되었습니다.')</script>
	</c:if>
	<jsp:include page="header.jsp"/>
	<div id="main_wrap">
    <div class="swiper-container main-swiper">
      <div class="notice_title">주요공지</div>
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="${conPath }/img/1.jpg"></div>
        <div class="swiper-slide"><img src="${conPath }/img/2.jpg"></div>
        <div class="swiper-slide"><img src="${conPath }/img/3.jpg"></div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
    <div class="content">
      <ul class="content_nav">
        <li data-tabid="tab1"><a href="#tab1">야영장</a></li>
        <li data-tabid="tab2"><a href="#tab2">대피소</a></li>
        <li data-tabid="tab3"><a href="#tab3">생태탐방원</a></li>
      </ul>
      <div class="content_tab">
      	
      </div>
    </div>
  </div>


  <script>
    // photo Scape
    var swiper = new Swiper('.main-swiper', {
      direction: 'vertical',
      pagination: true,
      spaceBetween: 0, // slide 여백
      slidesPerView: 1, // one slide 출력갯수
      centeredSlides: true, // 센터모드
      autoplay: { // 자동슬라이드
        delay: 2500, // 시간
        disableOnInteraction: false, // 스와이프 후 자동재생(false), 비활성화(true)
      },
      loop: false, // slide loop
      loopAdditionalSlides: 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 방지
      
    });
  </script>
  <jsp:include page="footer.jsp"/>
</body>
</html>