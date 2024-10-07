<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method='get' action='../streaming.hw'>
	<!-- 상대 경로의 위치는 요청을 한 클라이언트의 위치 -->
	<select name='movie' onchange='this.form.submit()'>
		<%=request.getAttribute("options")%>
	</select>
</form>
</body>
</html>