<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	for(int i=1; i<=10; i++) {
%>
	<h4><%=i%></h4>
<%
	}
%>

<hr />
<%
	String str = "";
	for(int i=1; i<=10; i++) {
		str += str.format("<h4>%d</h4>",i);
	}
%>
	<%=str%>
<hr />

<%
	String pattern = "<h4>%d</h4>";		// 스크립틀릿에서 선언한 변수는 지역 변수
	for(int number=1; number<=10; number++) {
		out.println(String.format(pattern,number));
	}
%>
<hr />

<%
	String pattern2 = "<h4>%d</h4>";
	StringBuffer h4Numbers = new StringBuffer();
	for(int number=1; number<=10; number++) {
		h4Numbers.append(String.format(pattern2,number));
	}
%>
<%=h4Numbers%>
<hr />

<%!
// 		4개의 scope를 이용해 전역 멤버를 통해 데이터 공유가 불가능한 상황을 해결할 수 있음.
// 		(jsp에서 public 전역 변수로 선언해도 다른 servlet에서는 사용하지 못함)
		private String pattern = "<h4>%d</h4>";		// 선언부에 선언한 변수는 전역 변수가 됨
		private StringBuffer printNumber(int start, int end) {
			StringBuffer h4Numbers2 = new StringBuffer();
			for(int i=start; i<=end; i++) {
				h4Numbers2.append(String.format(pattern,i));
			}
		return h4Numbers2;
	}
%>

<%
	int min = Optional.ofNullable(request.getParameter("min"))
						.filter(mp->mp.matches("\\d+"))
						.map(Integer::parseInt)
						.orElse(1);
	int max = Optional.ofNullable(request.getParameter("max"))
						.filter(mp->mp.matches("\\d+"))
						.map(Integer::parseInt)
						.orElse(10);
// 	int min = 1;
// 	int max = 10;
// 	if(request.getParameter("min")!=null && request.getParameter("min").length()!=0) {
// 		min = Integer.parseInt(request.getParameter("min"));
// 	}
// 	if(request.getParameter("max")!=null && request.getParameter("max").length()!=0) {
// 		max = Integer.parseInt(request.getParameter("max"));
// 	}
%>

action, src, href : url 설정 속성이 생략된 경우, 
<!-- action, src같은 url의 기본값은 현재 경로 (상대 경로를 사용하고 있기 때문) -->
<form method="post">
	<input type="number" name="min" placeholder="최소 숫자" value="<%=min%>"/>
	<input type="number" name="max" placeholder="최대 숫자" value="<%=max%>" />
	<button type="submit">전송</button>
</form>

<%=printNumber(min,max)%>
</body>
</html>