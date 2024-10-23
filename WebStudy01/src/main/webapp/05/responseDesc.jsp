<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/responseDesc.jsp</title>
</head>
<body>
<h4>HttpServletResponse 객체의 활용 (http response packaging)</h4>
<pre>
	response : 서버가 클라이언트로 전송하는 메세지 전체를 캡슐화한 객체
	1. Response Line :
		Status Code (상태 코드) - 요청 처리의 결과를 표현할 수 있는 세자리 숫자 코드 (&lt;%= HttpServletResponse %&gt; 입력해서 Proposals 보면 확인 가능)
		(SC : Status Code)
		1) 1xx : ING.. (현재 진행중)
			Http (ConnectLess, StateLess)
			Connect-less : 연결이 의도적으로 수립되지도 않고, 종료되지도 않는 구조 ex) HTTP
					실시간 양방향 통신이 불가능한 구조 --> Long Polling 방식, WebSocket(Connect-full, 101번 상태 코드로 표현)
			Connect-full : 연결(connection)을 필요에 따라 의도적으로 수립하고 종료할 수 있는 방식 ex) 데이터베이스 프로그래밍
		2) 2xx : OK (정상 처리)
		3) 3xx : 요청 처리는 아직 완료되지 않았고, 클라이언트의 추가 액션이 필요함을 표현 그래서 response body가 없음
			304 : Not Modified, 캐싱된 정적 자원은 최종 버전이니까 캐싱 자원을 사용하라는 표현
			307/302/301 : MOVED, 최종 자원의 위치가 변경되었음에 대한 표현
							"Location(변경된 위치)" 응답 헤더와 함께 전송됨
		4) 4xx : Failure, 클라이언트측 오류
			400	: Bad Request, request가 유효성 검증을 통과하지 못한 경우 사용됨
					ex) 필수 파라미터 누락, 요청 데이터의 길이가 허용치를 벗어난 경우
						요청에 포함된 데이터의 타입이 잘못된 경우 등에 사용
			401/403 : 401(UnAuthorized, 아직 인증 전인 상태 표현), 403(Forbidden, 권한이 없는 사용자에 대해 사용)
			404 : Not Found
			405 : Method-Not_Allowed, 클라이언트의 request method를 처리할 수 없음
			406 : Not-Acceptable, 응답 컨텐츠를 협상하는 조건으로 사용되는 "accept" 헤더로 결정된,
									컨텐츠의 종류를 서버가 처리할 수 없을 때 표현
			415 : UnSupported-Media-Type, 클라이언트가 전송한 body 컨텐츠를 서버에서 파싱할 수 없을때 표현
			<a href="status400.jsp">400번대 테스트 페이지</a>
		5) 5xx : Failure, 서버측 오류, 500(Internal Server Error, 서버의 정보 노출 제한)
	2. Response Header : setContentType, setContentLengh, setHeader(name, value) (value는 String타입)
		1) Content-Type, Content-Length (공통 헤더) : body 의 content 에 대한 메타 데이터
			Content-Type(body content 종류)
			Content-Length(body content 길이)
			<%
				// response.setContentLength(200);	// 컨텐츠를 200바이트까지만 읽음
			%>
		2) Content-Disposition(공통 헤더)
			request header : method="post", content-type="multipart/form-data"
							body의 부분집합(part) 하나에 대한 메타데이터로 사용됨
							ex)
								문자 기반 파트 Content_Disposition : form-data, name="파트명"
								파일 기반 파트 Content_Disposition : form-data, name="파트명"; filename="파일명"
			response header ===> 수정했음
				Content-Disposition
				- inline(default) : 브라우저의 창 내부에서 웹 페이지의 형태로 컨텐츠 소비
				- attachment : 다운로드 받고 저장하라는 뜻, 저장명은 filename 지시자로 결정 (안 쓰면 현재 페이지의 이름으로 전송)
								filename 내에 특수문자나 공백이 포함된다면, url encoding 방식이나 replace 구조가 필요함
			<%
				String filename = "더미 1.html";
				filename = URLEncoder.encode(filename, "UTF-8").replace("+", " ");	// 파일 이름으로 한글 쓰기 위해서 변수로 넣고 인코딩하고 공백이 +로 바뀌므로 replace
				// response.setHeader("Content-Disposition", "inline");	// inline : 브라우저들이 자기가 가진 창 안에서 소비 (기본값)
				response.setHeader("Content-Disposition", "attachment; filename=\""+filename+"\"");	// 첨부된 데이터(filename) 저장
				// ""로 안 묶으면 옛날 브라우저에서는 파일 이름에 공백 안 들어가고 다르게 나옴
			%>
		3) Refresh(response)
		4) Cache-Control(response)
		5) Location(response)
	3. Response Body(Message Body, Content Body)
		servlet : response.getWriter(), response.getOutputStream()
		jsp : 표현식, out 객체
</pre>
<form method="post" enctype="multipart/form-data">
	<input type="text" name="param1" />
	<input type="file" name="uploadFile" />
	<button type="submit">전송</button>
</form>
</body>
</html>