<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/requestDesc.jsp</title>
</head>
<body>
<h4>Http Request</h4>
<pre>
	Http(Hyper Text Transfer Protocool) : 웹상의 클라이언트와 서버가 메세지를 교환할때 사용되는 패키징 방식.
	
	Http request packaging : 클라이언트가 서버에게 전송하는 우편들 ==> HttpServletRequest로 캡슐화됨.
	1. Request Line : URL(수신자), http method 로 요청의 목적과 패키징 방식을 추가로 표현.
		url : <%=request.getRequestURL()%> (http://localhost/WebStudy01/03/requestDesc.jsp)
		uri : <%=request.getRequestURI()%>, 클라이언트 사이드 절대 경로 형태 (/WebStudy01/03/requestDesc.jsp)
		servlet path : <%=request.getServletPath()%>, 서버 사이드 절대 경로 형태 (/03/requestDesc.jsp)
		
		URI(Uniform Resource Identifier) : 자원을 식별하기 위한 식별자의 총칭.
		URN(Uniform Resource Name) : ex) 소년이 온다
		URC(Uniform Resource Content) : ex) 저자 : 한강, 출판사 : 창비, 노벨문학상 작가의 작품
		URL(Uniform Resource Locator) : ex) 교보문고 4층 소설 코너의 두번째 책장의 세번째 줄의 네번째 칸의 왼쪽에서 세번째 책
		(URN이나 URC는 식별성이 별로 없어서 URL을 씀)
		(따라서 URL은 URI의 한가지 방법)
		
		request method : <%=request.getMethod()%>
		
		url 형태
			protocol[scheme]://IP[Domain-host] : port/pathname?querystring...
			ex) https://www.example.com:443/filename.exp?k1=v1&k2=v2
			origin(protocol + host + port)  + resource path + query string
		http mehod
			GET(r, ****) : 서버의 자원 조회, src, href 속성에 의해 발생하는 요청
			POST (c) : 서버에 새로운 자원 등록
			PUT / PATCH (u) : 서버에 자원들 갱신(수정)
			DELETE(d) : 서버의 자원을 삭제
			OPTIONS : 서버의 상황을 확인하기 위한 preFlight 요청에 사용됨
			HEAD : 응답 데이터에 content body가 있는 용답을 수신하기 위한 요청에 사용됨
			TRACE : 제한된 환경에서 서버를 트래킹할 목적의 요청에 사용됨
			
			테스트 자원의 url 설계 - RestFull URI 방식의 설계
			(method이용해서 insert,update 일일이 다 안 만들어도 가능)
			/person (GET) : 전체 person 조회
			/person/p001 (GET) : 단건(person) 조회
			/person (POST) : 새로운 person 등록
			/person/p001 (PUT) : p001 하나의 정보 수정
			/person/p001 (DELETE) : p001 삭제
			<button class="test-btn" data-method="get">GET 요청</button>
			<button class="test-btn" data-method="post">POST 요청</button>
			<button class="test-btn" data-method="put">PUT 요청</button>
			<button class="test-btn" data-method="delete">DELETE 요청</button>
			<button class="test-btn" data-method="head">HEAD 요청</button>
			<button class="test-btn" data-method="options">OPTIONS 요청</button>
			
	2. Request Header : 클라이언트와 요청에 대한 정보를 수식할 수 있는 메타데이터(name/String value)
			1) Accept-* : 응답의 조건을 설정할때 활용됨
				Accept-Language : 응답 메세지를 구성할 언어(locale)
				Accept-Encoding : 응답 메세지의 압축 형식
				Accept : 응답 메세지의 종류
			2) Content-* : request body가 있고, body를 통해 전송되는 메세지가 있을때,
							해당 메세지의 종류(Content-Type)나 길이(Content-Length)를 표현할 수 있음
			3) User-Agent : 클라이언트의 사용기기와 브라우저의 종류(렌더링 엔진 등...)
			<a href="<%=request.getContextPath()%>/03/requsetHeader.jsp">request header</a>
			
	3. Request Body(message body, content body) : 클라이언트가 서버로 전송할 메세지
		1) 파라미터(문자열로 전송) 형태의 form-data(****) : application/x-www-form-urlencoded (form태그의 기본값)
		2) 멀티파트 형태의 form-data : multipart/form-data (택배를 여러개로 쪼개서 보내고 싶을때)
		3) json[xml] payload : application/json[xml]
		<a href="<%=request.getContextPath()%>/03/requestData.jsp">request content</a>
</pre>
<%-- <a href=""></a> 이렇게 쓰면 현재 페이지 그대로 링크가 걸림 --%>
<a href="">GET 요청</a>
<form enctype="application/x-www-form-urlencoded" method="post">
	<button type="submit">POST 전송</button>
</form>
<button type="button" id="putbtn">PUT 전송</button>
<script type="text/javascript">
	putbtn.addEventListener("click", ()=>{
		fetch("",{method:"put"});	// "" ==> 현재 페이지 그대로 링크가 걸림
		// jsp는 get과 post방식밖에 받지 못함 (put방식으로 하려면 servlet을 이용해야됨)
	});
	document.querySelector("pre").addEventListener("click",(e)=>{
		if(!e.target.classList.contains("test-btn"))
			return false;
		let method = e.target.dataset.method;
		let url = "<%=request.getContextPath()%>/person";
		// 클라이언트 사이드에서 실행되므로 origin이 필요
		fetch(url,{method:method});
	});
</script>
<%-- <img src="<%=request.getContextPath()%>/resources/images/cat1.jpg" /> --%>
</body>
</html>