<%@page import="kr.or.ddit.db.ConnectionFactoryCP"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.or.ddit.db.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09/performanceCheck.jsp</title>
</head>
<body>
<h4> 어플리케이션의 성능 체크 </h4>
<pre>
	String(상수) vs StringBuffer(객체) : String은 불변이라서 StringBuffer가 더 좋음
	
	전체 소요 시간 : processing time + Latency time
	<%
// 	case 1: Member 테이블에서 a001 사용자의 이름과 휴대폰 번호 조회 (1번) : 166ms, 9~30ms ==> 206ms, 0ms~1ms
// 	case 2: Member 테이블에서 a001 사용자의 이름과 휴대폰 번호 조회 (100번) : 1156ms, 910ms~1100ms ==> 205ms, 5ms~10ms
// 	case 3: Member 테이블에서 a001 사용자의 이름과 휴대폰 번호 조회 (1번), 출력 (100번) : 183ms, 15ms~30ms ==> 
	long start = System.currentTimeMillis();
		for(int i=1; i<=100; i++) {
			try(
				Connection conn = ConnectionFactoryCP.getConnection();
				Statement stmt = conn.createStatement();
			) {
				String sql = "SELECT MEM_NAME, MEM_HP FROM MEMBER WHERE MEM_ID = 'a001'";
				ResultSet rs = stmt.executeQuery(sql);
				Map<String, String> result = new HashMap<>();
				if(rs.next()) {
					result.put("memName", rs.getString(1));
					result.put("memHP", rs.getString(2));
				}
				out.println(result);
			}
		}
	long end = System.currentTimeMillis();
	%>
	소요 시간 : <%=end-start%>ms
</pre>
</body>
</html>