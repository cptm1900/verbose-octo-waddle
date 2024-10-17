facForm.addEventListener("submit",(e)=>{
	e.preventDefault();
	const form = e.target;
	let url = e.target.action;
	let options = {};
	let method = "post";
	options.method = method;
	let headers = {
		accept:"application/json",
		"content-type":"application/json"
	}
	options.headers = headers;
	
	// request body : {"opperand":5}
	let formData = new FormData(form);
	let nativeTarget = {
		operand : parseInt(formData.get("operand"))
	};
	
	options.body = JSON.stringify(nativeTarget);
	
	fetch(url,options)
	.then((resp)=>{
		if(resp.ok) {
			return resp.json();
		}else {
			throw new Error(`응답 실패 : ${resp.status}`);
		}
	})
	// 구조분해
	.then(({operand,expression,result})=>resultArea.innerHTML = `${operand}! = ${expression} = ${result}`)
	.catch(console.log);
})