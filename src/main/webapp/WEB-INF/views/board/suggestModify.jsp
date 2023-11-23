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
	
</head>
<body>
	<c:if test="${empty member and empty admin}">
		<script>
			alert('로그인 후 글수정이 가능합니다');
			location.href = '${conPath}/member/login.do?after=board/suggestModify.do?sno=${param.sno}&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
      <h2>건의합니다 글수정</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/suggestModify.do?after=u" method="post">
    	<input type="hidden" name="sno" value="${param.sno }"/>
    	<input type="hidden" name="search" value="${param.search }"/>
    	<input type="hidden" name="option" value="${param.option }" />
    	<input type="hidden" name="pageNum" value="${param.pageNum }" />
      <table class="writeTable">
        <tr class="RH_title">
          <td>제목</td>
          <td><input type="text" name="stitle" value="${suggest.stitle }"></td>
        </tr>
        <tr class="RH_writer">
          <td>작성자</td>
          <c:if test="${not empty member }">
          	<td><input type="text" name="id" value="${suggest.id }"></td>
          	<td><input type="hidden" name="aid" value="${suggest.aid }"></td>
          </c:if>
          <c:if test="${not empty admin }">
          	<td><input type="hidden" name="id" value="${suggest.id }"></td>
          	<td><input type="text" name="aid" value="${suggest.aid }"></td>
          </c:if>
        </tr>
        <tr class="RH_text">
          <td>내용</td>
          <td><textarea name="stext" id="stext" cols="30" rows="10">${suggest.stext }</textarea></td>
        </tr>
        <tr>
          <td class="submit_btn" colspan="2">
            <input type="submit" value="글수정">
          </td>
        </tr>
      </table>
    </form>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>
















