<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- html,jsp에서는 대소문자 구분 안 하므로 하이폰(-)으로 구분함 --%>
<body data-context-path="<%=request.getContextPath()%>">

<h4>저장된 파일 : <%=request.getAttribute("saveFilePath")%></h4>
<select name="saveFile">
	<option value=""></option>
</select>

</body>
<script type="text/javascript">
	// await는 async함수 안에 써야됨
	const fnInit = async ()=>{
		const contextPath = document.body.dataset.contextPath;
		const select = document.querySelector('[name="saveFile"]');
		// jsp에서 js에 이엘 쓸 때는 $앞에 \필요
		// jsp에서 data에 썼던 하이폰(-)은 js에서 없어지고 그 뒤 문자가 대문자로 바뀜 ex)context-path ==> contextPath
		let resp = await fetch(`\${contextPath}/multipart/fileList`, {
			headers:{
				"accept":"application/json"
			}
		});
		if(resp.ok){
			let list = await resp.json();
			select.innerHTML = list.map(n=>`<option>\${n}</option>`).join("\n");
		}
	}
	document.addEventListener("DOMContentLoaded", fnInit);
</script>
</html>