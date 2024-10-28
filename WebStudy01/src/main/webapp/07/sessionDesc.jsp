<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Http Session</h4>
<pre>
	세션 생명주기
		생성시점(시작) : 세션 트래킹 모드로 전달되는 세션 아이디가 없는 요청이 발생했을때
			==> 세션의 식별자로 ID를 부여받음
			session ID : <%=session.getId()%>
			session 생성 시점 : <%=new Date(session.getCreationTime())%>
			==> response에 ID가 포함되어 클라이언트쪽으로 전송됨
			==> 클라이언트가 ID를 자기 저장소에 저장함
			==> 다음번 요청에 해당 ID가 포함되어 서버쪽으로 재전송됨
			session 내의 마지막 요청 시점 : <%=new Date(session.getLastAccessedTime())%>
			
			(저장 위치 : 세션-서버, 쿠키-클라이언트 브라우저)
			
			session tracking mode : 클라이언트와 서버가 세션 아이디를 서로 교환하는 방법
<!-- 			COOKIE로 전달 -->
			1. COOKIE(****)
<!-- 			매트릭스 변수, jsessionid : 세션 파라미터 -->
			2. URL : <a href="sessionDesc.jsp;jsessionid=<%=session.getId()%>">현재 페이지로 다시 요청 전송</a>
<!-- 			URL방식은 브라우저 개발자 모드(F12) 들어가면 sessionID가 다 보여서 암호화 하기 위해 사용 -->
			3. SSL(Secure Socket Layer) : C/S 사이의 메세지를 암호화하는 방식
			
		소멸시점(종료)
			<!-- MaxInactiveInterval : 아무것도 안 하고 있을 수 있는 최대 시간 (s) -->
			1) timeout(<%=session.getMaxInactiveInterval()%>초) 이내에 새로운 요청이 전송되지 않는 경우
				- cookie 제거
				- 브라우저 완전 종료 (소멸이 안 되는 경우도 있음)
			2) 직접적인 로그아웃 <%--session.invalidate();--%> <!-- Invalidates : 만료하다 -->
</pre>
</body>
</html>