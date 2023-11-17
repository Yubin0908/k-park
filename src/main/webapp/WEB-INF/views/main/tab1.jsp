<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<style>
    * {
      margin: 0;
      padding: 0;
    }
    #tab1_wrap {
      width: 750px;
      background-color: #555;
      height: auto;
    }
    .tab1_search {
      width: 250px;
      height: 655px;
      border-right: 1px solid #fff;
    }

    .tab1_search p {
      padding-top: 100%;
      text-align: center;
      font-size: 25px;
      font-weight: bold;
      color: #fff;
    }
    .tab1_search select {
      width: 150px;
      border-radius: 15px;
      padding: 5px 15px;
      text-align: center;
      margin-top: 45px;
      margin-left: 50px;
    }
    .tab1_search input[type="submit"] {
      padding: 5px 20px;
      border: none;
      border-radius: 15px;
      margin-top: 10px;
      margin-left: 75px;
    }
    .tab1_content {
      margin-top: -670px;
      margin-left: 260px;
      height: 650px;
    }
    .tab1_content p {
      font-size: 25px;
      font-weight: bold;
      color: #fff;
      margin: 15px 0 0 5px;
    }
    .tab1_content img {
      margin: 5px 0 0 5px;
    }
    .tab1_content span {
      color: #fff;
      font-weight: 600;
      margin-left: 45px;
    }
    .tab1_btn {
      padding: 10px 100px;
      border-radius: 30px;
      border: none;
      box-shadow: 3px 3px 1px #777;
      margin: 70px 0 0 110px;
    }
  </style>
</head>
<body>
	<div id="tab1_wrap">
	  <div class="tab1_search">
	    <p>야영장 조회</p>
	    <form action="">
	      <select name="camp_list">
	        <option value="sulak">설악산</option>
	        <option value="bukhan">북한산</option>
	        <option value="jiri">지리산</option>
	        <option value="tebak">태백산</option>
	      </select>
	      <input type="submit" value="조     회">
	    </form>
	  </div>
	  <div class="tab1_content">
	    <p>야영장 안내도</p>
	    <img src="https://reservation.knps.or.kr/cntnts/camp/B031005/B031005_001.jpg" alt="" width="95%">
	    <br>
	    <span>주소 : 강원도 속초시 청봉로 25</span>
	    <span>(Tel. 033-801-0903)</span>
	    
	    <button class="tab1_btn">예약 하러 가기</button>    
	  </div>
	</div>
</body>
</html>