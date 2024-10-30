<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" enctype="application/x-www-form-urlencoded">
	<table>
		<tr>
			<td><input type="text" name="id" placeholder="아이디" required /></td>
		</tr>
		<tr>
			<td><input type="text" name="name" placeholder="이름" required /></td>
		</tr>
		<tr>
			<td>
				남<input type="radio" name="gender" value="M" checked />
				여<input type="radio" name="gender" value="F" />
			</td>
		</tr>
		<tr>
			<td><input type="text" name="age" placeholder="나이" required /></td>
		</tr>
		<tr>
			<td><input type="text" name="address" placeholder="주소" required /></td>
		</tr>
	</table>
	<button type="submit">전송</button>
</form>
</body>
</html>