<%@page import="kr.or.ddit.db.ConnectionFactory"%>
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
// 	1. 드라이버를 빌드패스에 추가 (벤더 제공) -> driver loading
		// DriverManager.getConnection에 커서 가져다대면
		// url a database url of the form jdbc:subprotocol:subname
		// 이렇게 나옴
// 		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		// jdbc:oracle: 오라클DB라는뜻, thin: 버전, @localhost: 접속주소, 1521: 오라클포트, xe: 오라클express제품(제품종류)
		
// 		String user = "ymw96";
// 		String password = "java";
		
		// 아래 주소는 ojdbc라이브러리에서 oracle/jdbc/driver에 있는 OracleDriver의 qualified name
// 		Class.forName("oracle.jdbc.driver.OracleDriver");
		try(
// 	2. Connection 객체 생성
// 			Connection conn = DriverManager.getConnection(url, user, password);
			Connection conn = ConnectionFactory.getConnection();
// 	3. 쿼리 객체 생성
			Statement stmt = conn.createStatement();
		) {
// 	4. 쿼리 실행
			String sql = "SELECT MEM_ID, MEM_NAME FROM MEMBER";
			ResultSet rs = stmt.executeQuery(sql);	// 조회 결과는 포인터를 가진 커서 형태임
// 	5. 쿼리 결과 집합 핸들링
			Map<String, String> resultMap = new HashMap<String,String>();
			request.setAttribute("resultMap", resultMap);
			while(rs.next()) {
				resultMap.put(
					rs.getString("MEM_ID"),
					rs.getString("MEM_NAME")
				);
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