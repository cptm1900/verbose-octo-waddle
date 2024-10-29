<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.or.ddit.calc.OperatorType"%>
<%@page import="kr.or.ddit.calc.CalculateVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/elObject.jsp</title>
</head>
<body>
<h4> EL 에서 객체 사용 방법</h4>
<pre>
	<%
		CalculateVO cal = new CalculateVO();
		cal.setLeft(2);
		cal.setRight(45);
		cal.setOperator(OperatorType.PLUS);
		request.setAttribute("calAttr", cal);
	%>
	<%=cal.getLeft() + "" + cal.getOperator().getSign() + cal.getRight()%>=<%=cal.getResult()%>
	<%-- el을 아래처럼 쓰면 변수에 직접 접근이 아니라 getter 메소드에 접근하느 것 --%>
	${calAttr.left}${calAttr.operator.sign}${calAttr.right}=${calAttr.result}
	<%=cal.getExpression()%>
	${calAttr.expression}
	${calAttr['expression']}
</pre>

<hr />

<pre>
	<%
		List<String> list = Arrays.asList("listValue1", "listVaule2");
		request.setAttribute("list", list);
		String[] array = new String[]{"arrayValue1", "arrayValue2"};
		request.setAttribute("array", array);
		
		Set<String> set = new HashSet<>();
		request.setAttribute("set", set);
		set.add("setValue1");
		set.add("setValue2");
		set.add("setValue2");
		
		Map<String, Object> map = new LinkedHashMap<>();
		request.setAttribute("map", map);
		map.put("key1", "mapValue1");
		map.put("key2", "mapValue2");
		map.put("key-3", "mapValue3");
		map.put("key-4", "mapValue4");
	%>
<%-- 	${list.get(1)}, ${array[1]} --%>
<%-- el 안에서는 list를 array처럼 처리해서 아래처럼도 가능 --%>
	${list[1]}, ${array[1]}
<%-- el은 에러처리 안 함 --%>
	${list[3]}, ${array[3]}
	
	${map.get("key2")}, ${map["key2"]}, ${map.key2}
<%-- 반노테이션은 안 되고 연관 배열 구조는 가능 --%>
	${map.key-3}, ${map["key-3"]}
	\${map.key 4}, ${map["key 4"]}
</pre>

<hr />

<pre>
	EL 기본객체(11개)
	1. scope 객체 : requestScope, seesionScope, applicationScope, pageScope
	2. pageContext
		${pageContext.request.contextPath}, ${pageContext.servletContext.contextPath}
		${pageContext.session.id}, ${pageContext.session.creationTime}
		
	6. 요청 파라미터 객체 : param, paramValues
	7. 요청 헤더 객체 : header, headervalues
	8. 쿠키 객체 : cookie
	9. 컨텍스트 파라미터 객체 : initParam
</pre>
</body>
</html>