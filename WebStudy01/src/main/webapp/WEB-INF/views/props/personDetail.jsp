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

<form>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
		</thead>
		
		<tbody>
			<c:set var="person" value="${sessionScope.person}" />
			<tr>
				<td>${person.name}</td>
				<td>${person.gender}</td>
				<td>${person.age}</td>
				<td>${person.address}</td>
			</tr>
		</tbody>
	</table>
</form>

</body>
</html>