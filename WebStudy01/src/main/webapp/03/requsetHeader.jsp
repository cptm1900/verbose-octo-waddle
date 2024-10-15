<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/requsetHeader.jsp</title>
</head>
<body>
<h4> request header </h4>
<form method="post">
	<input type="text" name="key1" value="value1" />
	<input type="text" name="key2" value="한글값" />
	<button type="submit">POST 전술</button>
</form>
<pre>
	accept : <%=request.getHeader("Accept")%>
	accept-encoding : <%=request.getHeader("Accept-Encoding")%>
	accept-language : <%=request.getHeader("Accept-Language")%>
	content-type : <%=request.getHeader("Content-Type")%>
	content-length : <%=request.getHeader("Content-Length")%>
</pre>
<table>
	<thead>
		<tr>
			<th>헤더이름</th>
			<th>헤더값</th>
		</tr>
	</thead>
	<tbody>
		<%
// 			Collection : List, Set, Map
// 			Collection view : 순차접근이 불가능한 컬렉션에 대해서 순차적인 접근방법을 정의하고 있는 객체 (Iterator, Enumeration)
			
			Enumeration<String> headerNames = request.getHeaderNames();
			while(headerNames.hasMoreElements()) {
				String name = headerNames.nextElement();
				String value = request.getHeader(name);
		%>
				<tr>
					<td><%=name%></td>
					<td><%=value%></td>
				</tr>
		<%
			}
		%>
	</tbody>
</table>
</body>
</html>