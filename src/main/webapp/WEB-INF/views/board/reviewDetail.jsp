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
	<link rel="stylesheet" href="${conPath }/css/cmt.css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${not empty reviewModifyResult}">
		<script>
			alert('${reviewModifyResult}');
		</script>
	</c:if>
	<c:if test="${not empty cmtResult}">
		<script>
			alert('${cmtResult}');
		</script>
	</c:if>
	<c:if test="${not empty cmtModifyResult}">
		<script>
			alert('${cmtModifyResult}');
		</script>
	</c:if>
	<c:if test="${cmtDeleteResult eq 1 }">
		<script>
			alert('댓글이 삭제되었습니다.');
		</script>
	</c:if>
	<div id="bbs_wrap">
    <div class="sub_title">
    	<span>홈 > 탐방후기</span>
      <br>
      <h2>탐방후기</h2>
      <br>
    </div>
    <div class="bbs_detail">
      <br>
      <h2>${review.rtitle }</h2>
      <br>
      <span>${review.rrdate } | 조회수 ${review.rhit } | ${review.id }</span>
      <br><br>
      <p class="hr"></p>
      <div class="view">
	       ${review.rtext }
       	<br />
      	<br />
      	<br />
        <p class="hr"></p>
        <br />
      	<div class="cmt">
		      <div class="cmt_write">
						<form action="${conPath }/board/ReviewCmtInsert.do?after=u" method="post">
							<input type="hidden" name="pageNum" value="${param.pageNum }"/>
							<input type="hidden" name="rno" value="${param.rno }"/>
							<input type="hidden" name="cname" value="${member.id }"/>
							<c:if test="${empty member}">
								<input type="text" name="cmemo" disabled placeholder="로그인 하셔야 댓글 달기가 가능합니다.">
								<input type="submit" value="댓글달기" disabled>
							</c:if>
							<c:if test="${not empty member}">
								<input type="text" name="cmemo" required>
								<input type="submit" value="댓글달기">
							</c:if>
		        	
						</form>
		      </div>
		      <table>
			      <c:choose>
			         <c:when test="${empty reviewCmt || reviewCmt == null}">
		            <tr class="cmt_tr">
	                <td>
	                  <span> 등록된 댓글이 없습니다. </span>
	                </td>
		            </tr>
			        </c:when>
			        <c:otherwise>
		            <c:forEach items="${reviewCmt}" var="cmtList">
		            		<tr class="cmt_tr">
			            		<td>
			            			<c:forEach var="i" begin="1" end="${cmtList.cindent }">
			            				<c:if test="${i eq cmtList.cindent }">
			            					&nbsp; &nbsp; &nbsp; <img src="${conPath }/img/enter.png" alt="enter" width="15"/>
			            				</c:if>
			            				<c:if test="${i ne cmtList.cindent }">
					            			&nbsp; &nbsp; &nbsp;
					            		</c:if>
			            			</c:forEach>
			            			<span>${cmtList.cname} (${cmtList.crdate})&nbsp;</span>
			            			<c:if test="${cmtList.cname ne member.id && cmtList.cname ne admin.aid }">
			            				<a class="reply_a" href="">답글쓰기</a>
			            			</c:if>
			            			<c:if test="${cmtList.cname eq member.id || cmtList.cname eq admin.aid  }">
			            				<a class="reply_b" href="">댓글수정</a>&nbsp;<a class="reply_c" href="${conPath }/board/ReviewCmtDelete.do?cno=${cmtList.cno}&rno=${param.rno}&pageNum=${param.pageNum}">댓글삭제</a>
			            			</c:if>
			            			<h5>
				            			<c:forEach var="i" begin="1" end="${cmtList.cindent }">
				            					&nbsp; &nbsp; &nbsp; 
				            			</c:forEach>
				            			${cmtList.cmemo}
				            		</h5>
			            			<form action="${conPath }/board/ReviewCmtMoreInsert.do?after=u" method="post" style="display: none;">
				                <div class="answer_form">
				                	<input type="hidden" name="pageNum" value="${param.pageNum}"/>
				                	<input type="hidden" name="cpageNum" value="${param.cpageNum == null ? 1:param.cpageNum }"/>
				                	<input type="hidden" name="cname" value="${member.id }${admin.aid}" />
			                    <input type="hidden" name="rno" value="${cmtList.rno}" />
			                    <input type="hidden" name="cgroup" value="${cmtList.cgroup}"/>
			                    <input type="hidden" name="cstep" value="${cmtList.cstep}"/>
			                    <input type="hidden" name="cindent" value="${cmtList.cindent}"/>
			                    <input type="text" name="cmemo" required <c:if test="${empty member && empty admin }">disabled placeholder="로그인 하셔야 댓글 달기가 가능합니다."</c:if>>
			                    <input type="submit" value="댓글달기">
				                </div>
						            </form>
						            <form action="${conPath }/board/ReviewCmtModify.do?after=u" method="post" style="display: none;">
					                <div class="answer_form">
					                	<input type="hidden" name="pageNum" value="${param.pageNum }"/>
				                    <input type="hidden" name="rno" value="${cmtList.rno}" />
				                    <input type="hidden" name="cno" value="${cmtList.cno }"/>
				                    <input type="hidden" name="cgroup" value="${cmtList.cgroup}"/>
				                    <input type="hidden" name="cstep" value="${cmtList.cstep}"/>
				                    <input type="hidden" name="cindent" value="${cmtList.cindent}"/>
				                    <input type="text" name="cmemo" required value="${cmtList.cmemo }">
				                    <input type="submit" value="댓글수정">
					                </div>
						            </form>
					            </td>
							    </tr>
		            	</c:forEach>
			        </c:otherwise> 
			    	</c:choose>
		      </table>
		      <script>
		        document.addEventListener("DOMContentLoaded", function() {
		          var replyAdds = document.querySelectorAll(".reply_a");
		          var replyModifys = document.querySelectorAll(".reply_b");
		    
		          replyAdds.forEach(function(link) {
		            link.addEventListener("click", function(event) {
		              event.preventDefault();
		              var form = this.nextElementSibling.nextElementSibling;
		              	
		              if (form.style.display === "none" || form.style.display === "") {
		                form.style.display = "block";
		              } else {
		                form.style.display = "none";
		              }
		            });
		          });
		
		          replyModifys.forEach(function(link) {
		            link.addEventListener("click", function(event) {
		              event.preventDefault();
		              var form = this.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
		    
		              if (form.style.display === "none" || form.style.display === "") {
		                form.style.display = "block";
		              } else {
		                form.style.display = "none";
		              }
		            });
		          });
		        });
		      </script>
		  </div>
		  <div class="paging">
	      <c:if test="${paging.startPage>paging.blockSize}">
					<a href="${conPath }/board/reviewDetail.do?cpageNum=${paging.startPage-1 }&pageNum=${param.pageNum}&rno=${review.rno}&after=u"><img src="${conPath }/img/arrow-left.png" alt="" height="15"/></a>
				</c:if>	
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
					<c:if test="${paging.currentPage==i }"> 
						<b><img src="${conPath }/img/bracket-left-curr.png" alt="" height="15"/> ${i} <img src="${conPath }/img/bracket-right-curr.png" alt="" height="15"/></b>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					<a href="${conPath }/board/reviewDetail.do?cpageNum=${i }&pageNum=${param.pageNum }&rno=${review.rno }&after=u"><img src="${conPath }/img/bracket-left.png" alt="" height="15"/> ${i } <img src="${conPath }/img/bracket-right.png" alt="" height="15"/></a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					&nbsp;<a href="${conPath }/board/reviewList.do?cpageNum=${paging.endPage+1 }&pageNum=${param.pageNum}&rno=${review.rno}&after=u"><img src="${conPath }/img/arrow-right.png" alt="" height="15"/></a>
				</c:if>
			</div>
	    <br />
	    <hr />
	    <br />
    </div>
    <div class="button">
    	<c:if test="${review.id eq member.id }">
    		<button onclick="location.href='${conPath}/board/reviewModify.do?rno=${param.rno }&pageNum=${param.pageNum }'" style="cursor:pointer">글수정</button>
    		<button onclick="location.href='${conPath}/board/reviewDelete.do?rno=${param.rno }'" style="cursor:pointer">글 삭제</button>
    	</c:if>
      <button onclick="location.href='${conPath}/board/reviewList.do?pageNum=${param.pageNum }'" style="cursor:pointer">목록</button>
    </div>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>