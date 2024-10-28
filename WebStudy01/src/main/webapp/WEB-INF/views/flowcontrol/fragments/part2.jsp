<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>PART2 에서 만든 컨텐츠</h1>
	<h4 class="text-primary"><%=request.getParameter("param")%>--(D, part2)</h4>

<%-- el이 new에서 menu를 뺀 것으로 인식함 --%>
<%-- <h4>${model}, ${new-menu}--(D, part2)</h4> --%>
	<h4>${model}, ${sessionScope['new-menu']}--(D, part2)</h4>

<ul>
	<%
		String menuName = (String)session.getAttribute("new-menu");
		Map<String, Object> recipe = (Map)request.getAttribute("model");
		// map을 entrySet으로 변환해서 향상된 for문 이용
		for(Entry<String,Object> entry : recipe.entrySet()) {
			boolean isNew = entry.getKey().equals(menuName);
	%>
			<li <%=isNew ? "id='new-menu'" : "" %>><%=entry.getKey()%> : <%=entry.getValue()%></li>	
	<%
		}
	%>
</ul>

<%-- action 없으면 현재 페이지 주소인 /flowcontrol servlet으로 이동 --%>
<form method="post">
	<input type="text" name="key" />
	<input type="text" name="value" />
	<button type="submit" class="btn btn-primary">전송</button>
</form>