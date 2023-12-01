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
		#copy_wrap {
			position: relative;
			width: 1400px;
			padding: 20px 0 10px;
			height: 750px;
		}
		.page_location {
			display: flex;
			flex-wrap: wrap;
			align-items: center;
		}
		.page_location span {
			color: #707070;
		}
		.policy {
			margin: 0;
	    padding: 0;
	    border: 0;
	    outline: 0;
	    font-size: 16px;
	    vertical-align: baseline;
	    background: transparent;
	    font-weight: 400;
	    box-sizing: border-box;
	    color: var(--color-default);
	    font-family: var(--font-family);
		}
		.title {
			display: block;
	    width: 100%;
	    padding: 30px 0;
	    color: var(--color-default);
	    --font-family: Gyeonggi Cheonnyeon, Robot;
	    font-size: 24px;
	    font-weight: 600;
	    text-align: center;
		}
		.color-point {
   		color: #ff2929;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="copy_wrap">
		<div class="page_location">
			<span>홈 > 저작권 정책 </span>
		</div>
		<div class="policy">
    <h3 class="title">저작권 정책</h3>
    <p>본 정책의 목적은 국립공원공단 홈페이지를 통하여 제공되는 정보와 정보출처를 밝히지 않고 무단사용, 변조, 상업적인 용도 등으로 사용되어 정보 이용자에게 피해를 끼치는 사례를 방지하지 위함입니다.</p>
    <p>국립공원공단 홈페이지에서 제공하는 모든 자료는 저작권법에 의하여 보호받는 저작물로써 이용자는 아래의 저작권 보호정책을 준수하여야 합니다.</p>
    <p>① 저작권법 제24조의2에 따라 국립공원공단에서 저작재산권의 전부를 보유한 저작물의 경우에는 별도의 이용허락 없이 무료로 자유이용이 가능합니다.</p>
    <p class="color-point">단, 자유이용이 가능한 저작물은 “공공저작물 자유이용허락 표시 기준(공공누리,KOGL) 제1유형과 제4유형”을 부착하여 개방하고 있으므로 공공 누리표시가 부착된 저작물인지를 확인한 이후에 자유이용하시기 바랍니다. 자유이용의 경우에는 반드시 저작물의 출처를 구체적으로 표시하여야 합니다.</p>
    <ul class="img-list">
	    <li>
	      <img src="https://reservation.knps.or.kr/assets/img/img-opencode1.png" alt="(제1유형)">
	      <span>(제1유형)</span>
	    </li>
	   <li>
	      <img src="https://reservation.knps.or.kr/assets/img/img-opencode1.png" alt="(제4유형)">
	      <span>(제4유형)</span>
	    </li>
    </ul>
    <p>② 국립공원공단 홈페이지에는 국립공원공단이 저작권 전부를 갖고 있지 아니한 자료도 제공되고 있습니다. 또한 국립공원에 대한 관심과 애정, 공원관리활동에 동참하고자 개인이나 기관, 단체 등에서 무상으로 제공한 자료들도 많이 있으므로 이러한 자료를 자유롭게 이용하기 위해서는 반드시 해당 저작권자의 허락을 받으셔야 합니다.</p>
    <p class="color-point">즉, 공공누리가 부착되지 않은 자료들을 사용하고자 할 경우에는 담당자와 사전에 협의한 이후에 이용하여 주시기 바랍니다.</p>
    <p>③ 다른 인터넷 사이트 상의 화면에서 국립공원공단 홈페이지의 저작물을 직접 링크시킬 경우에는 링크 이용자가 본 인터넷 저작권 정책을 간과할 수 있으므로 본 인터넷 저작권 정책도 함께 링크해 주시기 바랍니다.</p>
    <p>④ 홈페이지에서 개방 중인 자료 중 국립공원공단이 저작권 전부를 갖고 있지 아니한 자료(다른 저작자와 저작권을 공유한 자료 등)의 경우에는 저작권 침해의 소지가 있으므로 단순 열람 외에 무단 변경, 복제·배포, 개작 등의 이용은 금지되며 이를 위반할 경우 관련법에 의거 법적 처벌을 받을 수 있음을 알려드립니다. 국립공원공단은 모든 국민이 안전하게 국립공원관련 정보를 활용하실 수 있도록 지속적으로 노력하겠습니다.</p>
    <a href="https://www.law.go.kr/LSW/lsSc.do?y=0&x=0&p1=&menuId=0&query=%EC%A0%80%EC%9E%91%EA%B6%8C%EB%B2%95&subMenu=1#liBgcolor0" target="_blank" rel="noopener noreferrer" class="btn btn-link">국가법령정보센터 저작권법 바로가기</a>
	</div>
</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>