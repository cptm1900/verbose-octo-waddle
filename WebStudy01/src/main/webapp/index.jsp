<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>웰컴 페이지</h4>
<!-- 현재 사용자가 인증된 상태라면 신원 정보를 출력하고, -->
<!-- 인증되지 않은 사용자에게는 로그인 페이지 링크를 출력함 -->

<%
	Principal userPrincipal = request.getUserPrincipal();
	if(userPrincipal==null) {
%>
		<%-- 이엘 안에서는 request 같은 객체들 지원이 안 되고 pageContext만 가능 (pageContext 안에 다 있음) --%>
		<%-- pageContext는 getter 안 쓰고 직접 가져옴 --%>
		<a href="${pageContext.request.contextPath}/login/loginForm.jsp">로그인</a>
<%
	}else {
%>
		<h4>현재 사용자 : <%=userPrincipal%></h4>
		<form id="logoutForm" method="post" action="${pageContext.request.contextPath}/login/logout.do">
		</form>
		<%-- submit 버튼 안 만들고 a링크를 이용해 get방식이 아닌 post방식으로 보내기 --%>
		<a href="javascript:logoutForm.requestSubmit()">로그아웃</a>
<%
	}
%>

</body>
</html>