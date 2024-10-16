<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method='post' enctype="application/x-www-form-urlencoded">
	<input type="number" name="operand" onchange="this.form.requestSubmit();" required />
</form>

</body>
</html>