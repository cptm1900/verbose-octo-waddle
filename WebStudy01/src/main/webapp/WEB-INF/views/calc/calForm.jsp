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
<!-- required는 옛날 버전의 브라우저를 쓰꺼나 f12개발자 모드 들어가서 지워버리면 소용이 없음 -->
<!-- 	<input type="text" name="left" placeholder="좌항피연산자" required /> -->
	<input type="text" name="left" placeholder="좌항피연산자" />
<!-- 	<select name="operator" required> -->
	<select name="operator">
		<option value>연산자</option>
	<%=
		Arrays.stream(OperatorType.values())
				.map(o->String.format("<option value='%s'>%c</option>",
										o.name(), o.getSign()))
				.collect(Collectors.joining("\n"))
	%>
	</select>
<!-- 	<input type="text" name="right" placeholder="우항피연산자" required /> -->
	<input type="text" name="right" placeholder="우항피연산자" />
	<button type="submit">=</button>
</form>
<div id="result-area"></div>
<script type="text/javascript">
const calForm = document.calForm;	// document.이름 으로 찾을 수 있음 (전역 아이디 이용하는건 안 되는 브라우저도 있음)
const resultArea = document.getElementById("result-area");
const fnValidate = (form) => {
	let inValid = false;
	// jQuery에서 find가 js에서는 querySelector
	form.querySelectorAll("[name]").forEach(ipt=>{		// value, index에서 value만 가져옴
// 		if(!ipt.value) valid = false;	// 이렇도 가능
		inValid = !ipt.value;
	});
	return !inValid;
}
calForm.addEventListener("submit", async (e)=>{
	e.preventDefault();
	let valid = fnValidate(e.target);
	if(!valid) {
		alert("유효성 검증 통과 못함");
		return false;
	}
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