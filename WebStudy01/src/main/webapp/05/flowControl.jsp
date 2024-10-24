<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/flowControl.jsp</title>
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
				RequestDispatcher rd = request.getRequestDispatcher("/05/dest.jsp");
// 				rd.forward(request, response);	// 페이지 하나만 출력
				rd.include(request, response);	// 페이지 둘 다 출력
			--%>
		
		2. Redirect : 자원의 위치를 재지정하는 경우 PostRedirectGet 패턴의 구조에서 활용됨
			1) 최초의 요청 발생
			2) body가 없는 응답이 전송(307/302, location 헤더 포함)
				--> Connection close, StateLess
			3. Location 헤더 방향으로 완전히 새로운 요청이 전송
			4. 최종 응답 전송
			<%
				String location = request.getContextPath() + "/05/dest.jsp";
				response.sendRedirect(location);
			%>
</pre>
</body>
</html>