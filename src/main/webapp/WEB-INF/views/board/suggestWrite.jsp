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
	<c:if test="${empty member }">
		<script>
			alert('로그인 후 글쓰기가 가능합니다');
			location.href = '${conPath}/member/login.do?after=board/suggestWrite.do?sno=${param.sno}&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
      <h2>건의합니다 작성</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/suggestWrite.do" method="post" id="suggestForm">
	<table class="writeTable">
        <tr class="RH_title">
		<td>제목</td>
		<td><input type="text" name="stitle"></td>
        </tr>
        <tr class="RH_writer">
        <td>작성자</td>
			<td><input type="text" name="id" value="${member.id }"></td>
			<%-- <td><input type="hidden" name="aid" value="${admin.id }"></td> --%>
        </tr>
        <tr class="RH_text">
			<td>내용</td>
			<td>
          	<input type="hidden" name="stext" id="stext"/>
				<div id="editor">
							
				</div>
			</td>
        </tr>

        <tr>
			<td class="submit_btn" colspan="2">
            	<input type="button" value="제출" onclick="submitForm()">
            	<!-- <input type="submit" value="답변쓰기" class="btn"> -->
				<input type="reset" value="초기화" class="btn">
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
      document.getElementById("stext").value = markdown;
      document.getElementById("suggestForm").submit();
    }
  </script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>