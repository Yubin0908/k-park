<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  		input[name="ftitle"] {
			width: 95%;
		  	padding: 5px;
		 	border-radius: 5px;
		  	outline: none !important;
		}
  	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
      <h2>자주하는질문 글수정</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/faqModify.do?after=u" method="post" id="faqForm">
    	<input type="hidden" name="fno" value="${param.fno }"/>
    	<input type="hidden" name="search" value="${param.search }"/>
    	<input type="hidden" name="option" value="${param.option }" />
    	<input type="hidden" name="pageNum" value="${param.pageNum }" />
      <table class="writeTable">
        <tr class="RH_title">
          <td>제목</td>
          <td><input type="text" name="ftitle" value="${faq.ftitle }"></td>
        </tr>
        <tr class="RH_writer">
          <!-- <td>작성자</td> -->
          <td><input type="hidden" name="aid" value="${faq.aid }"></td>
        </tr>
        <tr class="RH_text">
				<td>내용</td>
				<td>
	          	<input type="hidden" name="ftext" id="ftext"/>
					<div id="editor">
						${faq.ftext }	
					</div>
				</td>
	        </tr>
        <tr>
          <td>공원명</td>
          <td><input type="text" name="parkname" value="${faq.parkname }"></td>
        </tr>
        <tr>
          <td class="submit_btn" colspan="2">
            <input type="button" value="글수정" onclick="submitForm()">
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
	      const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
	      document.getElementById("ftext").value = markdown;
	      document.getElementById("faqForm").submit();
	    }
	</script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>
















