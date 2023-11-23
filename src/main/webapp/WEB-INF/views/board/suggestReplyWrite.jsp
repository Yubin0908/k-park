<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/board.css" rel="stylesheet">
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('답변 수정이 완료되었습니다.');
		</script>
	</c:if>
	<!-- model의 suggest(원글정보), param.sno, rparam.pageNum -->
	<form action="${conPath }/board/suggestReplyWrite.do" method="post">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="sno" value="${param.sno }">
		<input type="hidden" name="sgroup" value="${suggest.sgroup }">
		<input type="hidden" name="sstep" value="${suggest.sstep }">
		<input type="hidden" name="sindent" value="${suggest.sindent }">
		<table class="writeTable">
			<caption>${param.sno }번글의 답변글 쓰기</caption>
			<tr class="RH_title">
				<th>글제목</th>
				<td><input type="text" name="stitle" required="required" value="[답변]${suggest.stitle }">
		    </tr>
		    <tr class="RH_writer">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="aid" required="required" autofocus="autofocus"></td>
			</tr>
			<tr class="RH_text">
				<th>내용</th>
				<td><textarea rows="5" name="stext"></textarea></td>
			</tr>
			<tr>
				<td class="submit_btn" colspan="3">
					<input type="submit" value="답변쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" class="btn" 
								onclick="location.href='${conPath}/board/suglist.do?pageNum=${param.pageNum }'">
				</td>
			</tr>
		</table>
	
	
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>


















