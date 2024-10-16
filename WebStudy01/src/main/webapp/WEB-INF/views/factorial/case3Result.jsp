<%@page import="kr.or.ddit.servlet08.FactorialVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
연산 처리 결과
<%
	FactorialVO facVO = (FactorialVO)request.getAttribute("facVO");
%>
<h1><%=facVO.getOperand()%> ! = <%=facVO.getExpression()%> = <%=facVO.getResult()%></h1>
</body>
</html>