<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body data-context-path=<%=request.getContextPath()%>>

<%
	long end = (Long)session.getAttribute("end");
	long last = (Long)session.getAttribute("last");
%>
	<span id="end" data-end="<%=end%>"></span>
	<span id="last" data-last="<%=last%>"></span>
	
	<h1 id="area"></h1>

</body>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", ()=>{
	let contextPath = document.body.dataset.contextPath;
	let area = document.getElementById('area');
	let end = document.getElementById('end').dataset.end;
	let last = document.getElementById('last').dataset.last;
	
	let YN = true;
	let interval = setInterval(()=>{
		let now = new Date().getTime();
		let time = Math.trunc(end - (now-last)/1000);
		let min = parseInt(time/60);
		let sec = time%60;
		area.innerHTML = `0\${min}:\${sec}`;
		
		if(time<=60 && YN) {
			YN = false;
			if(confirm("세션을 연장하시겠습니까?")) {
				fetch(`\${contextPath}/timer`, {
					method : "HEAD"
				})
				.then(()=>{
					clearInterval(interval);
					location.reload();
				})
				.catch(err=>console.log(err));
			}
		}
		if(time<=0) {
			clearInterval(interval);
			alert("세션이 만료되었습니다.");
		}
	},1000);
	
})
</script>

</html>