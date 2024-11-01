<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action='<c:url value="/props/personUpdate.do?who=${person.id}" />' method="POST">
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
		</thead>
		
		<tbody>
			<c:set var="person" value="${sessionScope.person}" />
			<tr>
				<td><input name="id" value="${person.id}" /></td>
				<td><input name="name" value="${person.name}" /></td>
				<td><input name="gender" value="${person.gender}" /></td>
				<td><input name="age" value="${person.age}" /></td>
				<td><input name="address" value="${person.address}" /></td>
			</tr>
		</tbody>
	</table>
	<button type="submit">수정</button>
	<button type="button" onclick="location='<c:url value="/props/personDelete.do?who=${person.id}" />'">삭제</button>
</form>

</body>
</html>