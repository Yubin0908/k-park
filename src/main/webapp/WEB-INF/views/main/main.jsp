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
</head>
<body>
	<%-- <c:if test="${param.result ne '로그인 성공'}">
		<script>
			alert('${param.result}');
			history.back();
		</script>
	</c:if> --%>
	<c:if test="${modifyResult eq 1 }">
		<script>alert('정보 수정이 완료되었습니다.');</script>
	</c:if>
	<c:if test="${withdrawal eq 1 }">
		<script>alert('회원 탈퇴가 완료되었습니다.')</script>
	</c:if>
	<jsp:include page="header.jsp"/>
	<br>
  <br>
  <br>
  <a href="${conPath }/main/map.do">지도 테스트</a>
  <div id="main_wrap">
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="${conPath }/img/1.jpg" style="position:relative;"></div>
        <div class="swiper-slide"><img src="${conPath }/img/2.jpg"></div>
        <div class="swiper-slide"><img src="${conPath }/img/생태탐방원_가야산.jpg"></div>
        <div class="swiper-slide"><img src="${conPath }/img/생태탐방원_한려해상.jpg"></div>
        <div class="swiper-slide"><img src="${conPath }/img/야영장_오대산.jpg"></div>
      </div>
      <div class="swiper-pagination"></div>
    </div>

    <div class="news">
      <div class="container">
        <div class="sub_title">
        	<div class="kkomi"></div>
      		<div class="bandal"></div>
          <h2>
            K-공원
            <span>새소식</span>
          </h2>
          <p>대한민국 구석구석 국립공원의 최신 소식을 빠르게 전달해드립니다.</p>
        </div>
        <div class="notice">
          <h3>공지사항</h3>
          <ul>
          	<c:forEach var="notice" items="${notice }" begin="0" end="4" step="1">
          		<li>
	              <a href="${conPath}/board/noticeDetail.do?nno=${notice.nno}&pageNum=1">${notice.ntitle } </a>
	              <time lang="ko">${notice.ndate }</time>
            	</li>
          	</c:forEach>
          </ul>
          <small lang="ko">
            <a href="${conPath }/board/noticeList.do?pageNum=1">더보기</a>
          </small>
        </div>
        <div class="notice">
          <h3>묻고 답하기</h3>
          <ul>
          	<c:forEach var="qna" items="${qna }" begin="0" end="4" step="1">
          		<li>
	              <a href="${conPath }/board/qnaDetail.do?qno=${qna.qno}&qgroup=${qna.qgroup}&pageNum=1">${qna.qtitle }</a>
	              <time lang="lo">${qna.qrdate }</time>
            	</li>
          	</c:forEach>
          </ul>
          <small lang="ko">
            <a href="${conPath }/board/qnaList.do?pageNum=1">더보기</a>
          </small>
        </div>
        <div class="notice">
          <h3>건의 합니다</h3>
          <ul>
          	<c:forEach var="sug" items="${sug }" begin="0" end="4" step="1">
          		<li>
	              <a href="${conPath }/board/sugDetail.do?sno=${sug.sno}&pageNum=1">${sug.stitle }</a>
	              <time lang="lo">${sug.srdate }</time>
	            </li>
          	</c:forEach>
          </ul>
          <small lang="ko">
            <a href="${conPath }/board/sugList.do?pageNum=1">더보기</a>
          </small>
        </div>
      </div>
    </div>
  </div>

  <script>
    var swiper = new Swiper('.swiper-container', {
      direction: 'vertical',
      speed: 1000,
      pagination: true,
      spaceBetween: 0,
      slidesPerView: 1,
      centeredSlides: true,
      autoplay: {
        delay: 3500,
        disableOnInteraction: false,
      },
      loop: true,
      loopAdditionalSlides: 1,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  </script>
  <jsp:include page="footer.jsp"/>
</body>
</html>