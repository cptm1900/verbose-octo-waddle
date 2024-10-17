<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="facForm" method='post'>
	<input type="number" name="operand" onchange="this.form.requestSubmit();" required />
</form>
form 태그는 submit 이벤트에서 동기 요청을 발생시킨다
<div id="resultArea">

</div>

</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/app/factorial/case6Form.js"></script>
</html>