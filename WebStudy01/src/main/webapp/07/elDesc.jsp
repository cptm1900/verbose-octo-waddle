<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/elDesc.jsp</title>
</head>
<body>
<h4>EL(Expression Language)</h4>
<pre>
<!-- EL도 자바 코드 -->
	: scope를 통해 공유되고 있는 attribute 데이터를 브라우저상에 출력하기 위한 언어로만 사용됨 ->
<%--
	.jsp => \${ } : EL
	.js => \${ } : template
	.xml => \${ } : placeholder
--%>
	
	: 표현식의 대체용으로 사용됨
	<%
		String data = "DATA";
		request.setAttribute("data", data);
		request.setAttribute("attr", "요청 속성");
		session.setAttribute("attr", "세션 속성");
		application.setAttribute("attr", "어플리케이션 속성");
	%>
<!-- EL은 표현식처럼 변수 사용 불가능 getAttribute라고 생각해야됨 -->
<!-- 어떤 스코프에 넣든 꺼내는 방법이 같음 그래서 코드는 간단하지만 대신 key값이 같은 여러 개의 스코프가 있으면 주의해야함 -->
	표현식 : <%=data%>
	EL : ${data}
	
	표현식 : <%=request.getAttribute("attr")%>
	EL : ${attr}
	
	표현식 : <%=session.getAttribute("attr")%>
	EL : ${attr}
	
	표현식 : <%=application.getAttribute("attr")%>
	EL : ${attr}
	
<!-- 이렇게 하면 분리해서 꺼내기 가능  -->
	EL : ${requestScope.attr}
	EL : ${sessionScope.attr}
	EL : ${applicationScope.attr}
	
	- EL 연산자
	
	산술연산자 (EL에서 +는 문자열 더하기는 못하고 무조건 산술연산로만 수행됨, 연산의 우선 순위를 연산자로 결정함)
	
		${3+4}, ${"3"+4}, ${"3"+"4"}
		${"3"+a} (a를 scope에서 찾았는데 없어서 null이 나오는데 덧셈을 못하므로 0으로 바꾼 것)
		${a1+a2} (마찬가지)
	
		<%
			request.setAttribute("z-1", 34);
		%>
		표현식 : <%=((Integer)request.getAttribute("z-1") + 3)%>
		EL : ${z-1 + 3}
		EL : ${requestScope["z-1"] + 3}
		
		연산의 우선 순위를 연산자로 결정하기 때문에 나누기 기준으로 실수 연산을 함
		${4/3}
		
	논리연산자 : &&(and), ||(or), |(not)
	
		html에서 레퍼런스 문자(&nbsp;, &lt;)를 표현할때 &&을 쓰기 때문에 EL에서는 키워드로 씀
		${true and true}, ${dummy and true}
		
	비교연산자 : &gt;(gt), &lt;(lt), &gt;=(ge), &lt;=(le), ==(eq), !=(ne), !(not)
	
		html의 태그 기호하고 겹쳐서 EL에서는 키워드로 씀
		(great then: gt, littlt then: lt, great equal: ge)
		
		${3 lt 4}, ${3 ge 4}, ${not(3 ge 4)}
	
	단항연산자 : ++(+,=), --(-,=)	(낮은 버전에서는 지원 안 됨, 안 쓰는게 좋음)
			
			empty	(비어있는지 확인, 길이(length)로 확인)
		${empty dummy}, ${not empty dummy}
		
		<%
			request.setAttribute("dummy1", null);
			request.setAttribute("dummy2", "");
			request.setAttribute("dummy3", "   ");
			request.setAttribute("dummy4", new ArrayList());
			request.setAttribute("dummy5", new String[]{"element1"});
		%>
		dummy1 : ${empty dummy1}
		dummy2 : ${empty dummy2}
		dummy3 : ${empty dummy3}
		dummy4 : ${empty dummy4}	<%-- size()를 사용함 --%>
		dummy5 : ${empty dummy5}
		
	삼항연산자 : 조건식 ? 참 표현식 : 거짓 표현식 (자바하고 똑같음)
		
		${empty dummy6 ? "dummy6 없음" : "dummy6 있음"}
</pre>
</body>

<script>
// jsp 파일 안의 자바스크립트에서는 \${ } => 이렇게 써야
// $가 이스케이프로 지워지면서 문자처리되고 실행될때 el이 아니라 template으로 처리됨
</script>

</html>