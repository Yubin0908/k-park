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
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
  	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<style>
		input[name="qtitle"] {
			width: 95%;
		  	padding: 5px;
		 	border-radius: 5px;
		  	outline: none !important;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<%-- <c:if test="${modifyResult eq 1 }">
		<script>
			alert('답변 수정이 완료되었습니다.');
		</script>
	</c:if> --%>
	<!-- model의 suggest(원글정보), param.sno, rparam.pageNum -->
	<div id="bbs_wrap">
		<form action="${conPath }/board/qnaReplyWrite.do" method="post" id="qnaForm">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="qno" value="${param.qno }">
			<input type="hidden" name="qgroup" value="${qna.qgroup }">
			<input type="hidden" name="qstep" value="${qna.qstep }">
			<input type="hidden" name="qindent" value="${qna.qindent }">
			<table class="writeTable">
				<caption style="font-size: 40px;">${param.qno }번글의 답변글 쓰기</caption>
				<tr class="RH_title">
					<td>글제목</td>
					<td>
						<input type="text" name="qtitle" 
							required="required" value="[답변]${qna.qtitle }" id="qtitle">
					</td>
			    </tr>
			    <tr class="RH_writer">
					<td>작성자</td>
					<td><input type="text" name="aid" required="required" autofocus="autofocus" value="${admin.aid }" readonly="readonly"></td>
				</tr>	
					<tr>
				     	<td>소속</td>
				     	<td><input type="text" name="parkname" value="${admin.agroup }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="qyn" value="y" checked="checked">
						</td>
					</tr>
					<tr>
						<td><input type="hidden" name="qstatus" value="0"></td>
					</tr>
					<tr class="RH_text">
						<td>내용</td>
						<td>
				          	<input type="hidden" name="qtext" id="qtext"/>
								<div id="editor">
							
								</div>
						</td>
					</tr>
					<tr>
						<td class="submit_btn" colspan="3">
							<input type="button" value="답변쓰기" class="btn" style="cursor:pointer"
								onclick="submitForm()">
							<input type="reset" value="초기화" class="btn" style="cursor:pointer">
							<input type="button" value="목록" class="btn" style="cursor:pointer"
										onclick="location.href='${conPath}/board/qnaList.do?pageNum=${param.pageNum }'">
						</td>
					</tr>
			</table>
		</form>
	</div>
	<script>
    	const Editor = toastui.Editor;
    	const editor = new Editor({
     	el: document.querySelector('#editor'),
     	height: '500px',
      	initialEditType: 'wysiwyg',
      	language: 'ko',
    	});
  	</script>
  	<script>
		function submitForm() {
		  	const qtitle = document.getElementById("qtitle").value.trim();
		   	const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
		   	document.getElementById("qtext").value = markdown;
		   	if(qtitle !== "" && markdown !== ""){
		   	document.getElementById("qnaForm").submit();
      	}else{
    	  	alert('빈칸이 존재합니다.');
			e.preventDefault(); 
      		}
    	}
  	</script>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>