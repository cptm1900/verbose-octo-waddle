<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- action은 Tomcat이 받아야함 -->
<form action="j_security_check" method="post">
<pre>
	<!-- jusername, jpassword 정해져있는 name임 -->
	<input type="text" name="j_username" placeholder="username" />
	<input type="password" name="j_password" placeholder="password" />
	<button type="submit">로그인</button>
</pre>
</form>
</body>
</html>