<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/board.css" rel="stylesheet"/>
	<style>
		.view .reply_qna{
			padding: 40px 30px;
			background-color: #f5f8fb; 
		}
		.reply_none {
			padding: 60px 580px !important;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<c:if test="${not empty qnaReplyResult}">
		<script>
			alert('${qnaReplyResult}');
		</script>
	</c:if>
	<c:if test="${qna.qyn eq 'n' and empty admin }">
	<c:if test="${member.id ne qna.id }">
		<script>
			alert('작성자만 열람가능한 글입니다');
			location.href='${conPath}/board/qnaList.do?pageNum=${param.pageNum}';
		</script>
	</c:if>
	</c:if>
	<div id="bbs_wrap">
	    <div class="sub_title">
	    	<br>
	      	<h2>묻고답하기</h2>
	      	<br>
	    </div>
	    <div class="bbs_detail">
	    	<br>
	    	<h2>Q. ${qna.qtitle }</h2>
	    	<span> ${qna.id } | ${qna.qrdate }</span>
	    	<p class="hr"></p>
	    	<div class="view">
		       	${qna.qtext }
	        	<p class="hr"></p>
		          	<span class="bold">관리공원</span>
		          	<span class="normal"><a href="">${qna.parkname }</a></span>
		          	<br>
		          	<br>
				<p class="hr"></p>
				<table>
				<c:choose>
					<c:when test="${qna.qstatus eq 1}">
			       		<tr>
			                <td class="reply_qna reply_none">
			                  <span> &nbsp;&nbsp;&nbsp;관리자가 답변을 준비중입니다. <br>&nbsp;&nbsp;&nbsp;잠시만 기다려 주십시오.</span>
			                </td>
		            	</tr>
		       		</c:when>
		       		<c:otherwise>
						<div class="reply_qna">
				        		&nbsp; &nbsp; &nbsp; <img src="${conPath }/img/enter.png" alt="enter" width="15"/>
				        	<span class="bold">A. ${reply.qtext}</span>
				        	<br>
					       	<br>
			       			<span>${qna.parkname} | ${reply.qrdate }</span>
				       	</div>
			       	</c:otherwise>
		       	</c:choose>
		       	</table>
	      	</div>
	    </div>
	    <br>
	    <div class="button">
	    	<c:if test="${qna.qstatus eq 1 && member.id eq qna.id}">
	    		<button onclick="location.href='${conPath}/board/qnaModify.do?qno=${param.qno }&pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" 
	    			style="cursor:pointer">글수정
	    		</button>
	    		<button onclick="location.href='${conPath}/board/qnaDelete.do?qno=${param.qno }'" 
    				style="cursor:pointer">글 삭제
    			</button>
	    	</c:if>
    		<c:if test="${not empty admin && qna.qstatus ne 2}">
    			<button onclick="location.href='${conPath}/board/qnaDelete.do?qno=${param.qno }'" 
    				style="cursor:pointer">글 삭제
    			</button>
    		</c:if>
	    	<c:if test="${not empty admin }">
	    		<c:if test="${qna.qstatus eq 1 }">
	    			<button onclick="location.href='${conPath}/board/qnaReplyWrite.do?qno=${param.qno }&pageNum=${param.pageNum }'" 
	    				style="cursor:pointer">답변
	    			</button>
	    		</c:if>
	    	</c:if>
			<button onclick="location.href='${conPath}/board/qnaList.do?pageNum=${param.pageNum }&option=${param.option }&search=${param.search }'" 
				style="cursor:pointer">목록
			</button>
	    </div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>