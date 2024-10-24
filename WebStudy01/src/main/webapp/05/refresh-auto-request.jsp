<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 받은 적이 없는 refresh 헤더를 받은 것처럼 동작, 동작 내용은 content 안에 --%>
<!-- <meta http-equiv="refresh" content="5,url=https://www.naver.com"> -->
<title>05/refresh-auto-request.jsp</title>
</head>
<body>
<h4>Refresh header 의 사용</h4>
<pre>
	: 주기(second)적으로 서버에 대한 요청을 전송할때 활용됨
	  화면 전체를 refresh 하기 위해 동기 요청을 전송함
	  ex) refresh=10,url=외부사이트 : 일정 시간이 지연된 후, 외부 사이트로 redirection 할 수 있음
	  
	서버 사이드 처리 : refresh 헤더 사용
	클라이언트 사이드 처리 : html meta 태그, JS 스케쥴링 함수
	<%--
		//주기적으로 요청을 보냄
		response.setIntHeader("refresh", 5);	// 5초마다 새로고침
		response.setHeader("refresh", "5,url=https://www.naver.com");	// 5초 뒤 네이버로 이동
	--%>
	현재 서버의 시간 : <span id="server-area"></span>
	<input type="text" name="test" />
</pre>
<span class="has-watch"></span>
<script src="<%=request.getContextPath()%>/resources/js/app/05/watchLib.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", async ()=>{
		setTimeout(()=>{
// 			location.reload();
			location.href="https://www.naver.com";
		},50000);
		
		const serverArea = document.getElementById('server-area');
		
		let resp = await fetch("getServerTime.jsp");
		let timetext = await resp.text();
		
		serverArea.innerHTML = timetext;
	})
</script>
</body>
</html>