<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>JSP</h4>
<style type="text/css">
	/* 스타일 코드 */
</style>
<script type="text/javascript">
	// js 코드
</script>
<pre>
why : 서블릿 스펙의 단점을 보완하고, Model2 아키텍쳐를 적용할 때 view 레이어를 구성할 수 있는 템플릿 엔진이 활용됨.
	  서비스 컨텐츠가 text 기반의 마임을 갖는 경우, 템플릿 엔진들(jsp, thymeleaf, velocity, freemarker)이 활용됨.
	  템플릿 엔진이란? 템플릿과 데이터의 결합자
JSP(Java Server Page)? 자바 기반의 서블릿 스펙에서 파생된 서버 사이드 템플릿 엔진.

How : 정적인 템플릿 요소를 제외한 동적 요소를 작성하는 방법.

*** jsp 소스의 표준 구성 요소
 1. 정적 요소(front-end) : 일반 텍스트, HJTML, CSS, Javascript
 2. 동적 요소(back-end)
 	1) scriptlet(스크립틀릿) : _jspService 메소드의 지역 코드로 전환되는 자바 코드.
 						해당 메소드에 지역 변수 형태로 선언된 기본 객체 사용 가능.
	 	<% 
	 		// 자바코드(전역이 아닌 지역코드)
	 		String data = "나도 데이터";
	 	%>
 	2) expression(표현식) : out.write(출력값)으로 전환됨.
 		<%= "출력할문장" %>
 	3) directive(지시자) : 실제 로직에는 영향이 없는 설정값을 변경할 때 활용됨. 속성으로 설정 변경.
 		page (required) : 웹 페이지의 설정에 영향
 		include (optional) : 정적 내포
 		taglib (optional) : custom tag 사용시 필요
 		<%@ page buffer="8kb" %>
 	4) declaration(선언자) : 클래스 차원의 전역 코드로 전환되는 자바 코드.
 		<%! 
 			// 전역코드
			String data = "데이터";
		%>
 	5: comment(주석) : <%-- 주석 --%>
 		- back-end comment : java, jsp
 		- front-end comment(웬만하면 사용X)(보안문제+백엔드에서전부다읽어야되어서성능저하) : html, css, js
 	
 	JSP 컨테이너의 역할 단계
 	- jsp 템플릿 파일을 대상으로 최초의 요청이 발생하면, 템플릿 소스를 파싱하여 java 코드를 정의함. (.java 서블릿 작성)
 	- compile (.clss 바이트 코드 생성)
 	- 싱글톤 인스턴스 생성
 	- _jspService 메소를 실행하여 요청과 응답을 처리함. (재시작하면 여기만 실행)
 	한글자 수정 (수정하면 다시 .java 서블릿 작성부터 다 실행)
 	6: EL(expression laguage)
 	7: Custom tag(JSTL)
</pre>
</body>
</html>