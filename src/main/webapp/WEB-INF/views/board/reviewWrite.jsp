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
			alert('로그인 하셔야 글쓰기가 가능합니다.');
			location.href = '${conPath}/member/login.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
      <h2>탐방 후기 작성</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/reviewWrite.do" method="post" id="reviewForm">
      <table class="writeTable">
        <tr class="RH_title">
          <td>제목</td>
          <td><input type="text" name="rtitle" id="rtitle"></td>
        </tr>
        <tr class="RH_writer">
          <td>작성자</td>
          <td><input type="text" name="id" value="${member.id }"></td>
        </tr>
        <tr class="RH_text">
          <td>내용</td>
          <td>
          	<input type="hidden" name="rtext" id="rtext"/>
						<div id="editor">
							
  					</div>
					</td>
        </tr>

        <tr>
          <td class="submit_btn" colspan="2">
            <input type="button" value="후기작성" onclick="submitForm()" style="cursor:pointer">
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
  		const rtitle = document.getElementById("rtitle").value.trim();
  		const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
      document.getElementById("rtext").value = markdown;
  		if(rtitle !== "" && markdown !== "") {
  			
 	      document.getElementById("reviewForm").submit();
  		} else {
  			alert('빈칸이 존재합니다.');
  			e.preventDefault();
  		}
    }
  </script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>