<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body data-context-path=<%=request.getContextPath()%>>

<button id="btn404">404 에러 확인</button>
<button id="btnHead">head 요청 전송</button>
<button id="btn200_get_json">get 요청 전송(JSON)</button>
<button id="btn200_get_html">get 요청 전송(HTML)</button>
<button id="btn406">get 요청 전송(XML)-406확인</button>
<button id="btn200_post_parameter">POST parameter 전송</button>
<button id="btn200_post_json">POST JSON 전송</button>
<button id="btn415">POST XML 전송, 415 에러 확인</button>
<button id="btn400">POST JSON 전송(필수데이터 누락, 400)</button>
<div id="resultArea"></div>

<script>
	
	// 비동기로 발생시킬 수 있는 모든 경우의 수가 다 있음
	
	const contextPath = document.body.dataset.contextPath;
	const baseURL = `\${contextPath}/status/send-and-receive`;
	
	// addEventListener('click', async function(){}) 하고 같음
	btn404.onclick = async function() {
		let resp = await fetch("/dummyErrorUrl");
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btnHead.onclick = async function() {
		let resp = await fetch(baseURL, {
			method:"head"
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn200_get_json.onclick = async function() {
		let resp = await fetch(baseURL, {
			headers: {
				accept:"application/json"
			}
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn200_get_html.onclick = async function() {
		let resp = await fetch(baseURL);
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn406.onclick = async function() {
		let resp = await fetch(baseURL, {
			headers: {
				accept:"application/xml"
			}
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn200_post_parameter.onclick = async function() {
		let formData = new FormData();
		formData.append("data3","DATA3");
		let resp = await fetch(baseURL, {
				method : "post",
				body : new URLSearchParams(formData)
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn200_post_json.onclick = async function() {
		let nativeTarget = {
			data3 : "DATA3"
		}
		let resp = await fetch(baseURL, {
				method : "post",
				headers : {
					"content-type" : "application/json"
				},
				body : JSON.stringify(nativeTarget)
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn415.onclick = async function() {
		let resp = await fetch(baseURL, {
				method : "post",
				headers : {
					"content-type" : "application/xml"
				},
				body : "<root><data3>DATA3</data3></root>"
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
	btn400.onclick = async function() {
		let nativeTarget = {
			data33 : "DATA3"
		}
		let resp = await fetch(baseURL, {
				method : "post",
				headers : {
					"content-type" : "application/json"
				},
				body : JSON.stringify(nativeTarget)
		});
		let message = await resp.text();
		resultArea.innerHTML = message;
	}
</script>

</body>
</html>