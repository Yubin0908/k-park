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
  		input[name="ititle"] {
			width: 95%;
		  	padding: 5px;
		 	border-radius: 5px;
		  	outline: none !important;
		}
		select[name="itype"], input[name="iparkname"] {
		  	width: 15%;
		  	padding: 5px;
		  	border-radius: 5px;
		  	outline: none !important;
		  	font-size: 20px;
		}
  	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
    	<h2>예약방법안내 글쓰기</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/infoWrite.do" method="post" id="infoForm">
    	<table class="writeTable">
	        <tr class="RH_title">
		          <td>제목</td>
		          <td><input type="text" name="ititle" id="ititle"></td>
	        </tr>
	        <tr class="RH_writer">
		          <td>작성자</td>
		          <td><input type="text" name="aid" value="${admin.aid }" readonly="readonly"></td>
	        </tr>
	        <tr>
	        	<td>공원명</td>
	        	<td><input type="text" name="iparkname" id="iparkname" value="${admin.agroup }" readonly="readonly">
	        </tr>
	        <tr>
				<td>문의유형</td>
				<td>
					<select name="itype">
						<option value="야영장">야영장</option>
						<option value="대피소">대피소</option>
						<option value="생태탐방원">생태탐방원</option>
					</select>
				</td>
			</tr>
	        <tr class="RH_text">
				<td>내용</td>
				<td>
					<input type="hidden" name="itext" id="itext"/>
					<div id="editor">
								
	  				</div>
				</td>
	        </tr>
	        <tr>
	          	<td class="submit_btn" colspan="2">
	            	<input type="button" value="글쓰기" onclick="submitForm()" style="cursor:pointer">
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
		    const ititle = document.getElementById("ititle").value.trim();
		    const iparkname = document.getElementById("iparkname").value.trim();
		    const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
	      	document.getElementById("itext").value = markdown;
		    if(ititle !== "" && iparkname !== "" && markdown !== "") {
		      	document.getElementById("infoForm").submit();
		    } else {
		       	alert('빈칸이 존재합니다.');
		       	e.preventDefault();
		    }
		}
	</script>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>