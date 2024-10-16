<%@page import="java.util.Optional"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	// call by value
	// call by reference
	// 참조값은 리턴 안 해도 주소값을 저장하는 거라서 가능 (이걸 이용해서 1개의 메소드에서 2개의 반환 가능)
	public long factorial(int num, StringBuffer expr) {
		if(num <= 0)
			// thorw를 써야 exception이 됨 (안 쓰면 그냥 객체 생성한 것)
			throw new IllegalArgumentException("팩토리얼 연산은 양의 정수를 대상으로 함");
		
		if(num==1) {
			expr.append(num);
			return 1;
		}
		else {
			expr.append(num + " * ");
			return num * factorial(num-1, expr);
		}
	}
%>

<%
	String opParam = request.getParameter("operand");
	if(opParam!=null && !opParam.trim().isEmpty()){
		int num1 = Optional.of(opParam)
							.filter(op->op.matches("\\d+"))
							.map(Integer::parseInt)
							.orElseThrow(()->new IllegalArgumentException("필수 파라미터에 문제있음"));
		StringBuffer expr = new StringBuffer();
%>
<%=num1%>! = <%=factorial(num1,expr)%>
<%=expr%>
<%
	}
%>

<form method='post' enctype="application/x-www-form-urlencoded">
	<input type="number" name="operand" onchange="this.form.requestSubmit();" required
			value="<%=opParam%>" />
</form>

</body>
</html>