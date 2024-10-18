<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.or.ddit.calc.OperatorType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="calForm" method="post">
	<input type="text" name="left" placeholder="좌항피연산자" required />
	<select name="operator" required>
		<option value>연산자</option>
	<%=
		Arrays.stream(OperatorType.values())
				.map(o->String.format("<option value='%s'>%c</option>",
										o.name(), o.getSign()))
				.collect(Collectors.joining("\n"))
	%>
	</select>
	<input type="text" name="right" placeholder="우항피연산자" required />
	<button type="submit">=</button>
</form>
<div id="result-area"></div>
<script type="text/javascript">
const calForm = document.calForm;	// document.이름 으로 찾을 수 있음 (전역 아이디 이용하는건 안 되는 브라우저도 있음)
const resultArea = document.getElementById("result-area");
calForm.addEventListener("submit", async (e)=>{
	e.preventDefault();
	let resp = await fetch("", {
						method:"post",
						headers:{
							accept:"application/json"
						},
						body : new FormData(calForm)
					});
	let calVO = await resp.json();
	resultArea.innerHTML = calVO.expression;
});
</script>
</body>
</html>