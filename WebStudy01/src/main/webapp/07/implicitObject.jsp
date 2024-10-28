<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/implicitObject.jsp</title>
</head>
<body>
<h4> JSP 스펙에서 제공되는 기본 객체의 종류 </h4>
<pre>
	<!-- http는 state-less -->
	request(HttpServletRequest) : 클라이언트와 클라이언트로부터 발생한 요청에 대한 정보를 가진 객체
	response(HttpServletResponse) : 서버에서 클라이언트로 전송되는 응답에 대한 정보블 가진 객체
	
	<!-- session을 사용해서 state-full로 사용 -->
	***
	session(HttpSession) : 하나의 클라이언트로부터 발생한 모든 세션 정보를 가진 객체
		Connect-FUll (DB) : 클라이언트와 서버 사이의 유일한 연결 통로
		Connect-Less (Web) : 클라이언트가 어플리케이션을 사용하기 시작한 시점부터 종료 이벤트를 발생시켰을 때까지의 기간
		<a href="sessionDesc.jsp">Http Session</a>
		(세션은 브라우저 개발자 페이지에서 쿠키 지워서 없애도 남아있음 세션ID만 바뀜)
		
	application(ServeletContext) : 서버와 현재 컨텍스트에 대한 정보를 가진 객체 (동일 컨텍스트 내에서 싱글톤의 형태로 관리됨) (서버마다 존재)
		서버 버전 정보 : <%=application.getServerInfo()%>
		서블릿 스펙 버전 : <%=application.getMajorVersion()%>.<%=application.getMinorVersion()%>
		Mime type 조회 : <%=application.getMimeType("test.jpg")%>
		RealPath는 없는 경로를 써도 가져와짐 (따로 확인해야됨) : <%=application.getRealPath("/08/test.html")%>
		Context Path : <%=application.getContextPath()%>
		
	pageContext(PageContext) : jsp와 관련된 모든 정보를 정보를 가진 객체로, 나머지 모든 기본 객체를 소유하고 있음 (페이지마다 존재)
	
<!-- 	아래 코드들 맞나 확ㅇㄴ -->
	
	<%
// 		request.setAttribute("requestAtrr", "요청 속성");
		pageContext.setAttribute("requestAtrr", "요청 속성", PageContext.REQUEST_SCOPE);
	%>
	<%=request.getAttribute("requestAttr")%>
	<%=pageContext.getAttribute("requestAttr", PageContext.REQUEST_SCOPE)%>
	<%
		pageContext.removeAttribute("requestAtrr", PageContext.REQUEST_SCOPE);
	%>
</pre>
<h4> Scope </h4>
<pre>
	: 데이터 저장 공간(Map&lt;String,Object&gt;), 해당 공간에 저장된 데이터를 attribute(name/value)라고 함 (session사용했을때 Scope의 Map를 사용했던 것)
	
	request scope : request 객체와 생명주기가 동일한 map
	session scope : session 객체와 생명주기가 동일한 map
	application scope : servlet context 객체와 생명주기가 동일한 map
	
	setAttribute(name, value), Object = getAttribute(name), removeAttribute(name)
</pre>
</body>
</html>