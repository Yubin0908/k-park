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
      <h2>공지사항 글쓰기</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/noticeWrite.do" method="post">
      <table class="writeTable">
        <tr class="RH_title">
          <td>제목</td>
          <td><input type="text" name="ntitle"></td>
        </tr>
        <tr class="RH_writer">
          <td>작성자</td>
          <td><input type="text" name="aid" value="${admin.aid }"></td>
        </tr>
        <tr class="RH_text">
          <td>내용</td>
          <td>
			<div id="editor">

			</div>
		</td>
        </tr>
        <tr>
          <td>소속</td>
          <td><input type="text" name="parkname" value="${admin.parkname }"></td>
        </tr>
        <tr>
          <td class="submit_btn" colspan="2">
            <input type="submit" value="글쓰기">
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
      initialEditType: 'markdown',
    });

    editor.getMarkdown();
  </script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>