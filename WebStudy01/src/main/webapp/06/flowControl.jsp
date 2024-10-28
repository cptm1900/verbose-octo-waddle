<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb" autoFlush="true"%>
<%-- buffer="8kb" : 버퍼 크기를 8kb로 설정 --%>
<%-- autoFlush="true" : 오버플로우가 발생할 것 같으면 버퍼를 비움 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/flowControl.jsp</title>
</head>
<body>
<h4>웹에서의 흐름 제어 방식</h4>
<pre>
	Http 의 특성
		Connect-less : response 가 수신되면, connection 은 close 됨
		State-less : request/response 객체는 삭제됨
		
		1. Request Dispatch : 최초로 발생한 요청이 이동하는(흐름이 제어되는 구조에서) 그대로 유지되는 방식
			1) forward : 요청과 응답에 대한 처리자가 분리되는 구조 ==> Model2 아키텍처에서 사용됨
			2) include : 하나의 응답 페이지를 구성하기 위한 책임이 2개 이상의 객체로 분리된 구조 ==> 페이지 모듈화 구조에서 사용됨
		
			<%-- 서버 내에서 이동할 때는 contextPath()가 필요없음 --%>
			<%--
// 				out.flush();	// 버퍼 강제로 방출
// 				RequestDispatcher rd = request.getRequestDispatcher("/06/dest.jsp");
				RequestDispatcher rd = application.getRequestDispatcher("/06/dest.jsp");
// 				rd.forward(request, response);	// 페이지 하나만 출력
				// 이동할 때 버퍼를 비우고 감
				// 버퍼가 1번이라도 방출되면 dispatch로 이동시키지 못하고 에러가 뜸
				rd.include(request, response);	// 페이지 둘 다 출력 (페이지 모듈화)
				// 이동할 때 버퍼를 유지한 상태로 감
				// 버퍼가 방출되어도 이미 완성된 페이지이기 때문에 짤려서 가지지만 에러는 없음
				// 버퍼가 없으면 RequestDispatch 구조 불가능
			--%>
		<%
			request.setAttribute("requestAttr", "요청 속성");
			session.setAttribute("sessionAttr", "세션 속성");
			// 서버 끄면 사라짐
			application.setAttribute("applicationAttr", "어플리케이션 속성");
		%>
		<%-- 위에서처럼 하면 dest.jsp가 맨 처음에 나오고 아래서처럼 하면 나오고 싶은 위치에 나옴 --%>
		<%-- 커스텀 태그 (액션 태그) --%>	<%-- 꺽쇠, ctrl+space --%>
		<%-- forward는 어차피 서버에서 동작하는거라 jsp에서는 잘 안 씀 --%>
<%-- 		<jsp:forward page="/06/dest.jsp" />	request.getRequestDispatcher("/06/dest.jsp").forward(request,response) 하고 같음 --%>
<%-- 		<jsp:include page="/06/dest.jsp" />		서버에서 동작하므로 contextPath() 필요없음 --%>
		
		2. Redirect : 자원의 위치를 재지정하는 경우 PostRedirectGet 패턴의 구조에서 활용됨
			1) 최초의 요청 발생
			2) body가 없는 응답이 전송(307/302, location 헤더 포함)
				--> Connection close, StateLess
			3. Location 헤더 방향으로 완전히 새로운 요청이 전송
			4. 최종 응답 전송
			<%
				String location = request.getContextPath() + "/06/dest.jsp";
				response.sendRedirect(location);
			%>
</pre>
</body>
</html>