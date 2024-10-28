<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 모듈 페이지에서는 전체 화면을 구성하면 안 됨 --%>
<%-- A, B 페이지가 합쳐져서 나오기 떄문에 A페이지에서 jQuery 선언하면 B페이지에서도 사용가능 --%>
<%-- 맨 위에 있는 설정 부분은 지우면 한글 깨져서 놔둬야됨 --%>

최종 도착지(B) - 화면의 일부를 구성할때(페이지 모듈)

<pre>
<%
	out.println(request.getAttribute("requestAttr"));
	out.println(session.getAttribute("sessionAttr"));
	out.println(application.getAttribute("applicationAttr"));
%>
</pre>