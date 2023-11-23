<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${conPath }/css/board.css" />
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
      <h2>공지사항 글수정</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/reviewModify.do?after=u" method="post" id="reviewForm">
    	<input type="hidden" name="rno" value="${param.rno }"/>
    	<input type="hidden" name="pageNum" value="${param.pageNum }" />
      <table class="writeTable">
        <tr class="RH_title">
          <td>제목</td>
          <td><input type="text" name="rtitle" value="${review.rtitle }"></td>
        </tr>
        <tr class="RH_writer">
          <td>작성자</td>
          <td><input type="text" name="id" value="${member.id }"></td>
        </tr>
        <tr class="RH_text">
		<td>내용</td>
		<td>
			<input type="hidden" name="rtext" id="rtext"/>
			<div id="editor">${review.rtext }</div>
		</td>
        </tr>
        <tr>
          <td class="submit_btn" colspan="2">
            <input type="button" value="후기작성" onclick="submitForm()">
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
      document.getElementById("rtext").value = markdown;
      document.getElementById("reviewForm").submit();
    }
  </script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>