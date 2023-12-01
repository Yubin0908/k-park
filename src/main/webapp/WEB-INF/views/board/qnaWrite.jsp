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
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
  	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
  	<style>
  		input[name="qtitle"] {
			width: 95%;
		  	padding: 5px;
		 	border-radius: 5px;
		  	outline: none !important;
		}
		select[name="qtype"], select[name="parkname"] {
		  	width: 15%;
		  	padding: 5px;
		  	border-radius: 5px;
		  	outline: none !important;
		  	margin-bottom: 5px;
		  	font-size: 20px;
		}
  	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
		<div id="bbs_wrap">
			<div class="sub_title">
    			<h2>묻고답하기 글쓰기</h2>
			</div>
			<br>
			<hr>
			<br>
			<form action="${conPath }/board/qnaWrite.do" method="post" id="qnaForm">
				<table class="writeTable">
	  				<tr class="RH_title">
					    <td>제목</td>
					    <td><input type="text" name="qtitle" id="qtitle"></td>
	 				</tr>
	  
	  				<tr class="RH_writer">
	    				<td>작성자</td>
	    				<td><input type="text" name="id" value="${member.id }" readonly="readonly"></td>
	     			</tr>
	     			<tr>
				     	<td>공원명</td>
				     	<td>
				     		<select name="parkname">
				     			<option value="설악산">설악산</option>
				     			<option value="북한산">북한산</option>
				     			<option value="지리산">지리산</option>
				     			<option value="태백산">태백산</option>
				     			<option value="덕유산">덕유산</option>
				     			<option value="소백산">소백산</option>
				     			<option value="무등산">무등산</option>
				     			<option value="내장산">내장산</option>
				     		</select>
				     	</td>
					</tr>
					<tr>
						<td>공개</td>
						<td>
							<input type="radio" name="qyn" value="y" checked="checked" > 공개 &nbsp;&nbsp;
							<input type="radio" name="qyn" value="n"> 비공개
						</td>
					</tr>
					<tr>
						<td>문의유형</td>
						<td>
							<select name="qtype">
								<option value="야영장">야영장</option>
								<option value="대피소">대피소</option>
								<option value="생태탐방원">생태탐방원</option>
							</select>
						</td>
					</tr>
	     			<tr class="RH_text">
				    	<td>내용</td>
				       	<td>
	     	  				<input type="hidden" name="qtext" id="qtext" />
							<div id="editor">
							
							</div>
						</td>
	     			</tr>
					<tr>
						<td class="submit_btn" colspan="2">
							<input type="button" value="등록" onclick="submitForm()" style="cursor:pointer">
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
	
	/* editor.getMarkdown(); */
</script>
<script>
	function submitForm() {
	   const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
	   document.getElementById("qtext").value = markdown;
	   document.getElementById("qnaForm").submit();
	 }
</script>
<script>
	function submitForm() {
	    const qtitle = document.getElementById("qtitle").value.trim();
	    const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
      	document.getElementById("qtext").value = markdown;
	    if(qtitle !== "" && markdown !== "") {
	      	document.getElementById("qnaForm").submit();
	    } else {
	       	alert('빈칸이 존재합니다.');
	       	e.preventDefault();
	    }
	}
</script>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>