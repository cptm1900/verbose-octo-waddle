<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08/jdbcDesc.jsp</title>
</head>
<body>
<h4> JDBC (Java DataBase Connectivity) </h4>
<pre>
	JDBC 프로그래밍 단계
	java.sql 패키지의 인터페이스 구현체 : 드라이버
	<%
		String memId = request.getParameter("who");
		if(StringUtils.isBlank(memId)) {
			response.sendError(400);
			return;
		}
		
// 	1. 드라이버를 빌드패스에 추가 (벤더 제공) -> driver loading
// 		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
// 		String user = "ymw96";
// 		String password = "java";
		
// 		Class.forName("oracle.jdbc.driver.OracleDriver");
		String sql = "SELECT MEM_ID, MEM_NAME, MEM_HP, MEM_ADD1 FROM MEMBER WHERE MEM_ID = ?";
		try(
// 	2. Connection 객체 생성
// 			Connection conn = DriverManager.getConnection(url, user, password);
			Connection conn = ConnectionFactory.getConnection();
// 	3. 쿼리 객체 생성
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
// 	4. 쿼리 실행
			pstmt.setString(1, memId);	// db는 index 1부터 시작
			ResultSet rs = pstmt.executeQuery();	// Prepared는 이미 위에서 넣어서 executeQuery에 sql 안 넣음
// 	5. 쿼리 결과 집합 핸들링
			Map<String, String> resultMap = new HashMap<String,String>();
			request.setAttribute("resultMap", resultMap);
			if(rs.next()) {
				resultMap.put("MEM_ID", rs.getString("MEM_ID"));
				resultMap.put("MEM_NAME", rs.getString("MEM_NAME"));
				resultMap.put("MEM_HP", rs.getString("MEM_HP"));
				resultMap.put("MEM_ADD1", rs.getString("MEM_ADD1"));
			}
		}
// 	6. 사용한 자원 release (close)
		// try( ) 안에 넣어놔서 자동으로 됨
	%>
</pre>
${resultMap.size()}
<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="entry" items="${resultMap}">
		<tr>
			<td>${entry.key}</td>
			<td><a href="detail.jsp?who=${entry.key}">${entry.value}</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>