// id는 전역변수 처리가 되어서 셀렉팅 하지 않아도 그냥 사용 가능
facForm.addEventListener("submit",(e)=>{
	e.preventDefault();		// submit 이벤트의 동기 요청 중단
	// request line : url, method
	const form = e.target;
	let url = e.target.action;		// facForm.action;
	let options = {};	// 빈 객체로 미리 생성함
	let method = form.method;
	options.method = method;	// options 객체에 method 추가
	// request header : content-type, accept
	let headers = {
		accept:"text/plain"		// accept : 응답에 대한 희망사항
	}
	options.headers = headers;	// options 객체에 headers 추가
	
	// k1=v1&k2=v2 형태의 queryString
	let formData = new FormData(form);
	let queryString = new URLSearchParams(formData).toString();
	
	if(method=="get") {
		// request line 에 query string 추가
		url = `${url}?${queryString}`;
	}else {	// request body (only post)
		headers["content-type"] = form.enctype;		// -(하이폰) 때문에 ""로 묶어야 되는데 ""로 묶으면 headers.을 못 쓰므로 연관배열구조로 씀
		options.body = queryString;
	}
	
	fetch(url,options)		// resolve(성공), reject(실패) 함수로 이후 이벤트에 대한 처리 함수를 미리 예약
	.then((resp)=>{
		if(resp.ok) {
			return resp.text();		// promise 객체 반환
		}else {
			throw new Error(`응답 실패 : ${resp.status}`);		// throw 안 쓰면 그냥 객체
		}
	})
	.then(plain=>resultArea.innerHTML = plain)	// (promise 여러개 : promise체인)
//	.catch((e)=>{console.log(e)});
	.catch(console.log);		// 함수의 레퍼런스
})