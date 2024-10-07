/**
 * 
 */
document.addEventListener("DOMContentLoaded",()=>{
	const select = document.querySelector("[name='movie']");
	fetch("../../../movie/csr/fileList")	// script파일의 상대 경로가 아니라 로딩하고 있는 페이지의 상대 경로
	.then(resp=>resp.json())
	.then(array=>select.innerHTML = 
									array.map(name=>`<option>${name}</option>`)
										 .join("\n"))
	.catch(console.log);
});