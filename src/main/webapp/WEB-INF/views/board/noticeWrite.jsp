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
    <form action="${conPath }/board/noticeWrite.do" method="post" id="noticeForm">
      <table class="writeTable">
        <tr class="RH_title">
          <td>제목</td>
          <td><input type="text" name="ntitle" id="rtitle"></td>
        </tr>
        <tr class="RH_writer">
          <td>작성자</td>
          <td><input type="text" name="aid" value="${admin.aid }" readOnly></td>
        </tr>
        <tr>
        	<td>주요공지 여부</td>
        	<td>
	        	<label for="ntop_1">
	        		<input type="radio" name="ntop" id="ntop_1" value="1" />주요공지
	        	</label>
		        	
		        <label for="ntop_0">
		        	<input type="radio" name="ntop" value="0" id="ntop_0" checked/>일반공지
		        </label>	
        	</td>
        </tr>
        <tr class="RH_text">
          <td>내용</td>
          <td>
        	  <input type="hidden" name="ntext" id="ntext"/>
						<div id="editor">
							
  					</div>
					</td>
        </tr>
        <tr>
          <td>소속</td>
          <td><input type="text" name="parkname" value="${admin.agroup }" readOnly></td>
        </tr>
        <tr>
          <td class="submit_btn" colspan="2">
            <input type="button" value="글쓰기" onclick="submitForm()">
          </td>
        </tr>
      </table>
    </form>
  </div>
  <!-- <script>
	  const fetchUploadImage = async (blob) => {
		  try {
		    // 이미지를 업로드하고 업로드된 경로를 반환하는 로직을 작성해야 합니다.
		    // 예를 들어, fetch를 사용하여 이미지를 서버로 업로드하고, 서버가 반환한 이미지 경로를 받아올 수 있습니다.
		    const response = await fetch('${conPath}/upload/', {
		      method: 'POST',
		      body: blob,
		    });
	
		    if (response.ok) {
		      const data = await response.json();
		      return data.imageUrl; // 업로드된 이미지의 경로 또는 서버에서 받은 이미지 URL
		    } else {
		      throw new Error('Image upload failed');
		    }
		  } catch (error) {
		    throw new Error(`Image upload failed: ${error.message}`);
		  }
		};
  </script>
  <script>
	  const onUploadImage = async (blob, callback) => {
		  console.log(blob);
		  try {
		    const path = await fetchUploadImage(blob);
		    console.log(path);
		    callback(path, blob.name);
		  } catch (error) {
		    console.error('Image upload failed:', error);
		  }
		  return false;
		};
  </script> -->
  <script>
    const Editor = toastui.Editor;
    const editor = new Editor({
      el: document.querySelector('#editor'),
      height: '500px',
      initialEditType: 'wysiwyg',
      
    });

    editor.getMarkdown();
  </script>
  <script>
  	function submitForm() {
  		const markdown = editor.getMarkdown().replace(/\n/g, "<br>");
      document.getElementById("ntext").value = markdown;
  		const ntitle = document.getElementById("rtitle").value.trim();
  		if(ntitle !== "" && markdown !== "") {
 	      document.getElementById("noticeForm").submit();
  		} else {
  			alert('빈칸이 존재합니다.');
  			e.preventDefault();
  		}
    }
  </script>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>