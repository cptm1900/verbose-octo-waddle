<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.error {
		color: red;
	}
</style>

<c:if test="${not empty message}">
	<script type="text/javascript">
		alert("${message}");
	</script>
	<c:remove var="message" scope="session" />
</c:if>

</head>
<body>
<!-- action은 Tomcat이 받아야함 -->
<!-- <form action="/login/loginCheck.do" method="post"> -->
<form action="<c:url value='/login/loginCheck.do' />" method="post">
<pre>
	<!-- jusername, jpassword 정해져있는 name임 -->
<!-- 	<input type="text" name="j_username" placeholder="username" /> -->
<!-- 	<input type="password" name="j_password" placeholder="password" /> -->
<!-- 	<button type="submit">로그인</button> -->
	
	
	<input type="text" name="memId" placeholder="username" /><span class="error">${errors.memId}</span>
	<input type="password" name="memPass" placeholder="password" /><span class="error">${errors.memPass}</span>
	<c:remove var="errors" scope="session"/>
	<button type="submit">로그인</button>
</pre>
</form>
</body>
</html>