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
  		input[name="stitle"] {
			width: 95%;
		  	padding: 5px;
		 	border-radius: 5px;
		  	outline: none !important;
		}
  	</style>
<body>
	<jsp:include page="../main/header.jsp"/>
	<!-- model의 suggest(원글정보), param.sno, rparam.pageNum -->
	<form action="${conPath }/board/suggestReplyWrite.do" method="post" id="suggestForm">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="sno" value="${param.sno }">
		<input type="hidden" name="sgroup" value="${suggest.sgroup }">
		<input type="hidden" name="sstep" value="${suggest.sstep }">
		<input type="hidden" name="sindent" value="${suggest.sindent }">
		<table class="writeTable">
			<caption style="font-size: 40px;">${param.sno }번글의 답변글 쓰기</caption>
			<tr class="RH_title">
				<th>글제목</th>
				<td>
					<input type="text" name="stitle" id="stitle"
						required="required" value="[답변]${suggest.stitle }">
				</td>
		    </tr>
		    <tr class="RH_writer">
			<tr>
				<!-- <th>작성자</th> -->
				<td><input type="hidden" name="aid" required="required" autofocus="autofocus"></td>
			</tr>
			<tr class="RH_text">
			<td>내용</td>
			<td>
          	<input type="hidden" name="stext" id="stext" value="${suggest.stext }"/>
				<div id="editor">
						
				</div>
			</td>
        </tr>
			<tr>
				<td class="submit_btn" colspan="3">
					<!-- <input type="submit" value="답변쓰기" class="btn"> -->
					<input type="button" value="답변글쓰기" onclick="submitForm()" style="cursor:pointer">
					<input type="reset" value="초기화" class="button" style="cursor:pointer">
				</td>
			</tr>
		</table>
	</form>
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
  	  const stitle = document.getElementById("stitle").value.trim();
      const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
      document.getElementById("stext").value = markdown;
      if(stitle !== "" && markdown !== ""){
      	document.getElementById("suggestForm").submit();
      }else{
    	  alert('빈칸이 존재합니다.');
			e.preventDefault(); 
      }
    }
  </script>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>



















