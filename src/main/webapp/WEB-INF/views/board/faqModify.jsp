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
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs_wrap">
    <div class="sub_title">
      <h2>자주하는질문 글수정</h2>
    </div>
    <br>
    <hr>
    <br>
    <form action="${conPath }/board/faqModify.do?after=u" method="post">
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
          <td>작성자</td>
          <td><input type="text" name="aid" value="${faq.aid }"></td>
        </tr>
        <tr class="RH_text">
          <td>내용</td>
          <td><textarea name="ftext" id="" cols="30" rows="10">${faq.ftext }</textarea></td>
        </tr>
        <tr>
          <td>공원명</td>
          <td><input type="text" name="parkname" value="${faq.parkname }"></td>
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
















