<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/requestData.jsp</title>
</head>
<body>
<h4>요청 데이터의 종류</h4>
<a href="?key1=한글&key2=value2">GET 전송</a>
<form method="post" enctype="application/x-www-form-urlencoded">
	<input type="text" name="key3" value="한글" />
	<input type="text" name="key4" value="value4" />
	<button type="submit">POST 전송</button>
</form>
<pre>
	1. query string : request line 을 통해 전달되는 문자열 집합
		<%=request.getQueryString()%> 
	2. body content
		1) 파라미터 form-data(****) : application/x-www-form-urlencoded
		urlencoded : 웹상에서 문자열의 형태로 특수문자를 전송할때 사용되는 인코딩 방식(url encoding)으로 인코딩된 텍스트
		ex) key1=value1 --> key1=<%=URLEncoder.encode("value1","utf-8")%>
			key2=한글value2 --> key2=<%=URLEncoder.encode("한글value2","utf-8")%>
			==> 요청 파라미터로 통일화된 방식을 확보 : 문자열의 형태로만 전송됨
				String value = getParameter(name);
				String[] values = getParameterValues(name); - 동일한 이름으로 전달되는 여러 값들을 반환
				Map&lt;String,String[]&gt; map = getParameterMap(); - 파라미터 전체가 관리되는 map 반환
				Enumeration&lt;String&gt; value = getParameterNames();
				<%
					request.setCharacterEncoding("utf-8");
				%>
				key1 (line) : <%=request.getParameter("key1")%>
				key3 (body) : <%=request.getParameter("key3")%>
		2) 멀티파트 form-data : <a hfef=<%=request.getContextPath()%>"/03/multipartDesc.jsp">Multipart content</a>
		3) json[xml] payload : <a href="<%=request.getContextPath()%>/03/jsonAndRest.jsp">JSON and Rest</a>
</pre>
<pre>
	key1 : <%=request.getParameter("key1")%>
	key2 : <%=request.getParameter("key2")%>
	key3 : <%=Arrays.toString(request.getParameterValues("key3"))%>
</pre>
</body>
</html>