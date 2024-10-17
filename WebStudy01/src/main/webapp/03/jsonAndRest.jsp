<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>JSON (JavaScript Object Notation)</h4>
<pre>
	: 경량의 데이터 교환 방식(메시지 교환을 위해 표현할 수 있는 방식)
	
	: 데이터 표현 방식이 서로 다른 이기종 시스템간의 메세지를 교환하기 위해 필요한 공통 메세지 표현 방식 ==> XML, JSON
	
	JSON syntax
	1. value	: null, true/false, number, string(""), object, array
	2. object	: { "propname" : value, ... }
	3. array	: [ value, ... ]
	
	REST 구조에 활용됨
		: 네트워크에서 식별가능한 자원을 메세지 형태로 교환하는 구조에 대한 포괄적인 표현
	REST 구성요소
	1. 자원의 식별성 (URI)
	2. 자원에 대한 행위 (Method)
	3. 자원의 종류를 표현하는 메타데이터 (Content-Type)
	4. 표현 가능한 자원의 상태 (데이터) : JSON
	
	RestFul (Rest스럽다) : Rest 구조의 일반적 특성에 부합하는 시스템에 대한 수식어
	1. C/S
		Front-end(client) : Javascript
			JSON
		Back-end(server) : Java (Gson, Jackson)
		
		native -> json(xml) : marshalling(마샬링) (native언어를 json이나 xml로 변환)
		marshalling -> 0101010101(stream) : serialization(직렬화)
		01010101010(stream) -> json : deSerialization(역직렬화)
		json -> native : unMarshalling(언마샬링)
		
	2. 자원에 대한 유일성이 부여된 식별 체계 (Uniform interface)
	3. Stateless : 헤더와 토큰 기반의 인증 시스템
	4. Cachable : 필요한 경우 캐싱 구조를 활용할 수 있음
	5. Layered system (계층형 시스템)
	
	RestFul URI(URL)
		ex) /member/memberInsert.do		// rest스럽지 않음 (행위가 섞여있어서)
			/members/new POST			// rest스러움
			/member/memberList.do		// rest스럽지 않음 (행위가 섞여있어서)
			/members GET				// rest스러움
			/member/memberView.do?memId=a001	// rest스럽지 않음 (행위가 섞여있어서)
			/members/a001 GET			// rest스러움
			/member/a001/profile.jpg	// rest스럽지 않음 ()
			
			/members/a001/profile		// rest스러움
			Content-Type:image/jpeg		// 확장자 정보를 content-type으로 표현
			
			(method를 원래 용도대로 사용하면 rest스러움)
</pre>
<script type="text/javascript">
	let nativeTarget = {
		prop1 : "value1",
		prop2 : 23,
		prop3 : false,
		prop4 : {
			innerProp1 : "innerValue"
		},
		prop5 : [1,2,3]
	}
	console.log("원본 객체 : \n", nativeTarget);
	let json = JSON.stringify(nativeTarget);
	console.log("marshalling 된 json : \n", json);
	let unMarshalledObj = JSON.parse(json);
	console.log("unMarshalling 된 객체 : \n", unMarshalledObj);
</script>
</body>
</html>