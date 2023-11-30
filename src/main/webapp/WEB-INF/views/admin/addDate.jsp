<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#selector1').change(function() {
				const value = $(this).val();
				
				$.ajax({
					url: '${conPath}/reservation/addDate.do',
					method: 'get',
					data: 'type=', value,
					success: function(data) {
						$('#selector1') = data;
					}
				});
			});
		});
	</script>	

	<style>
		#add_wrap {
			width: 1400px;
			margin: 0 auto;
		}
		.first {
			width: 100%;
			height: 150px;
			background-color: #eee;
			border-radius: 15px;
		}
	</style>	
</head>
<body>
	<div id="add_wrap">
		<div class="first">
			<form action="">
				<select name="option" id="selector1">
					<option value="">시설구분</option>
					<option value="camp">야영장</option>
					<option value="shelter">대피소</option>
				</select>
				
				<c:if test="${shelterList ne null || shelterList ne '' }">
					<select name="campno">
						<option value="">대피소 선택</option>
						<c:forEach items="${shelterList }" var="shelter">
							<option value="${shelter.shelterno }">${shelter.sheltername }</option>
						</c:forEach>
					</select>
				</c:if>
				<input type="date" name="resdate"/>
				<input type="submit" value="저장" />
			</form>
		</div>
		<div class="second">
		
		</div>
		<div class="last">
		
		</div>
	</div>
</body>
</html>