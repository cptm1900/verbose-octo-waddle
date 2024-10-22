<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/multipartDesc.jsp</title>
</head>
<body>
<h4> 멀티파트 컨텐츠</h4>
<pre>
	MIME : multipart/* - 한 번의 전송으로 여러 종류의 컨텐츠를 전송해야 하는 경우,
						body영역을 여러 개의 부분집합으로 분리하여 전송하는 구조
						ex) multipart/form-data, multipart/mixed
						
		1. Front-End
			1) 동기 요청
				- form ui 구성 (method="post", enctype="multipart/form-data")	// body를 만들기 위해 post로 함
					: form 내부의 name 속성(part name)을 가진 입력 태그로 body part가 형성됨
			2) 비동기 요청
				- fetch 함수 사용
					(method='post')
					(body=new FormData(form))
					(content-type 헤더를 생략해야, boundary 속성을 가진 multipart/form-data 헤더가 자동으로 설정됨)
		==== 전송되는 multipart는 각 파트가 독립적인 헤더(Content-Disposition)를 가지고, name 속성에 의해 식별성이 부여된 ====
		
		2. Back-End
			1) post 요청 핸들링
			2) Part API 사용
			3) multipart-config 설정 (annotation)
			4) 문자기반의 파트 : parameter로 핸들링
			   파일기반의 파트 : 업로드받고, 영구 저장소에 저장하기 위한 처리
</pre>
<form action="<%=request.getContextPath()%>/mutipart/sendFileAndText" 
		method="post" enctype="multipart/form-data" id="file-form">
	<input type="text" name="param1" />
	<select name="param2">
		<option label="TEXT1" value="VALUE1" />
		<option label="TEXT2" value="VALUE2" />
	</select>
	<input type="number" name="param3" />
	<input type="file" name="uploadFile" />
	<button type="submit">전송</button>
	</form>
	<div id="result-area"></div>
</body>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", ()=>{
		const fileForm = document.getElementById("file-form");
		const resultArea = document.getElementById("result-area");
		
		fileForm.addEventListener("submit", (e)=>{
			e.preventDefault();
			const form = e.target;
			let url = form.action;
			let method = "post";
			let headers = {
					"accept":"application/json"
					// multipart전송할때는content-type생략(multipart에서자체적으로생기는나누는기준문자(바운더리)가없어져서)
			}
			let body = new FormData(form);
			fetch(url,{
				method:method,
				headers:headers,
				body:body
			})
			.then(resp=>resp.json())
			.then(list=>resultArea.innerHTML = list.map(n=>`<p>\${n}</p>`).join("\n"))
			.catch(console.error)
			.finally(()=>fileForm.reset());
		});
	});
</script>
</html>