<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

#new-person {
	background-color: yellow;
}

</style>

</head>
<body>
<%-- ${list} --%>
<a href="<c:url value='/props/personInsert.do'/>">신규등록</a>
<table>
	<thead>
		<tr>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty list}">
			<c:forEach items="${list}" var="person">
			
				<%-- eq만 쓰면 알아서 equals 메소드를 호출해줌 --%>
<%-- 				<c:set var="idValue" value='${person eq newPerson ? "id='new-person'" : ""}' /> --%>
				<%-- 따옴표를 3개 이상 써야되어서 삼항연산자가 동작을 못하므로 if문으로 --%>
				<c:choose>
					<c:when test="${person eq newPerson}">
						<c:set var="idValue" value="id='new-person'" />
						<c:remove var="newPerson" scope="session" />	<%-- 꺼내면 필요없으니 지워줌 (flash attribute(한번 사용하고 지우는 방식) --%>
					</c:when>
					<c:otherwise>
						<c:set var="idValue" value="" />
					</c:otherwise>
				</c:choose>
				
				<tr ${idValue}>
					<td>
						<c:url value="/props/personDetail.do?who=${person.id}" var="detailUrl">	<%--경로 앞에 contextPath까지 붙여줌--%>
							<c:param name="who" value="${person.id}"></c:param>
						</c:url>
						<a href="${detailUrl}">${person.name}</a>
					</td>
					<td>${person.gender}</td>
					<td>${person.age}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="3">등록된 person이 없음</td>
			</tr>
		</c:if>
	</tbody>
</table>

</body>
</html>