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
		/* * {
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		  font-family: Arial, sans-serif;
		} */
		#tab2_wrap {
		  width: 750px;
		  background-color: #555;
		  color: #fff;
		  font-size: 20px;
		  font-weight: bold;
		  display: flex;
		  border-radius: 15px;
		  overflow: hidden;
    	height: 650px;
		}
		.tab2_search {
		  width: 250px;
		  border-right: 1px solid #fff;
		  padding: 20px;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: center;
		  text-align: center;
		}
		
		.tab2_search p {
		  margin-bottom: 20px;
		}
		
		.tab2_search select {
		  width: 100%;
		  border-radius: 15px;
		  padding: 10px 15px;
		  text-align: center;
		  margin-bottom: 20px;
		  background-color: #333;
		  color: #fff;
		  border: none;
		}
		.tab2_search input[type="submit"] {
		  width: 100%;
		  padding: 10px 20px;
		  border-radius: 15px;
		  margin-bottom: 20px;
		  background-color: #333;
		  color: #fff;
		  border: none;
		  cursor: pointer;
		}
		.tab2_content {
		  width: calc(100% - 250px);
		  padding: 15px 20px;
		  height: auto;
		}
		.tab2_content p {
		  font-size: 25px;
		  font-weight: bold;
		  margin-bottom: 10px;
		}
		.tab2_content img {
		  width: 100%;
		  border-radius: 10px;
		  margin-bottom: 10px;
		}
		.tab2_content span {
		  display: block;
		  font-weight: 600;
		  margin-bottom: 5px;
		}
		.tab2_content a {
		  display: block;
		  color: #fff;
		  text-decoration: none;
		  margin-bottom: 15px;
		}
		.tab2_content a:hover {
		  text-decoration: underline;
		}
		.tab2_btn {
		  width: 100%;
		  padding: 10px;
		  border-radius: 15px;
		  box-shadow: 3px 3px 1px #777;
		  background-color: #333;
		  color: #fff;
		  border: none;
		  cursor: pointer;
		}
		.second-swiper {
		  width: 100%;
		  height: 100%;
		  margin: 20px 0;
		  overflow: hidden;
		}
		.second-swiper > .swiper-slide {
		  text-align: center;
		  font-size: 18px;
		  background: #555;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		.swiper-button-nextA,
		.swiper-button-prevA {
		    margin-left: 13%;
		    margin-right: 60.6%;
		}
		
		.swiper-button-nextA::after,
		.swiper-button-prevA::after {
		    font-size: 24px;
		    line-height: 1.5;
		}
		.swiper-button-nextA {
		    right: 10px;
		}
		.swiper-button-prevA {
		    left: 10px;
		}
   
	</style>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"><!-- swiper css -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script><!-- swiper js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- jQuery js -->
</head>
<body>
	<div id="tab2_wrap">
      <div class="tab2_search">
        <p>대피소 조회</p>
        <form action="">
          <select name="camp_list">
            <option value="jiri">지리산</option>
            <option value="sulak">설악산</option>
            <option value="dukyu">덕유산</option>
            <option value="sobeck">소백산</option>
          </select>
          <input type="submit" value="조 회">
        </form>
      </div>
      <div class="tab2_content">
        <div class="swiper-container second-swiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <p>대피소 안내</p>
              <img src="https://reservation.knps.or.kr/cntnts/shelter0102_1.jpg" alt="">
              <span>[ 세석 대피소 ]</span>
              <p>이용 문의</p>
              <a href="#">경남 산청군 시천면 내대리</a>
              <a href="#">010-3346-1601 / 055-970-1000</a>
              <button class="tab2_btn">예약 하러 가기</button>
            </div>
            <div class="swiper-slide">
              <p>대피소 안내</p>
              <img src="https://reservation.knps.or.kr/cntnts/shelter0102_1.jpg" alt="">
              <span>[ 장터목 대피소 ]</span>
              <p>이용 문의</p>
              <a href="#">경남 함양군 마천면 강청리 산100번지 일원</a>
              <a href="#">010-2883-1750 / 055-970-1000</a>
              <button class="tab2_btn">예약 하러 가기</button>
            </div>
            <div class="swiper-slide">
              <p>대피소 안내</p>
              <img src="https://reservation.knps.or.kr/cntnts/shelter0102_1.jpg" alt="">
              <span>[ 세석 대피소11 ]</span>
              <p>이용 문의</p>
              <a href="#">경남 산청군 시천면 내대리</a>
              <a href="#">010-3346-1601 / 055-970-1000</a>
              <button class="tab2_btn">예약 하러 가기</button>
            </div>
            <div class="swiper-slide">
              <p>대피소 안내</p>
              <img src="https://reservation.knps.or.kr/cntnts/shelter0102_1.jpg" alt="">
              <span>[ 세석 대피소313 ]</span>
              <p>이용 문의</p>
              <a href="#">경남 산청군 시천면 내대리</a>
              <a href="#">010-3346-1601 / 055-970-1000</a>
              <button class="tab2_btn">예약 하러 가기</button>
            </div>
          </div>
        </div>
        <div class="swiper-button-nextA"></div>
        <div class="swiper-button-prevA"></div>
      </div>
    </div>
  <script>
    
  </script>
</body>
</html>