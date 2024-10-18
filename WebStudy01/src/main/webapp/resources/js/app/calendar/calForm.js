const makeOptions = (parent, associativeArray)=>{
	for(let pn in associativeArray) {
		let pv = associativeArray[pn];		// 연관 배열 구조 (locales.pn대신 사용)
		// insertAdjacentHTML : +=하고 비슷한데 더 효율적
		parent.insertAdjacentHTML("beforeend",`<option value='${pn}'>${pv}</option>`);
	}
}
const fnInit = ()=>{
	let url = "../calendar/ui-data";		// rest에서는 카멜 표기법 대신 전부 소문자로 쓰고 띄어쓰기는 하이폰(-)으로 표기
	fetch(url, {
		headers:{
			accept:"application/json"
		}
	}).then(resp=>resp.json())
//	.then(uidata=>{		// 아래처럼 구조분해로 표현 가능
	.then(({months, locales, zones})=>{
//		for(let m of months)	// 요소를 차례차례 m으로 가져옴
//		for(let idx in months){	// 요소의 인덱스를 차례차례 idx로 가져옴
//			months[idx];
//		}
		// 요소를 차례차례 m으로 가져오고 인덱스를 i로 가져옴 (forEach하고 값,인덱스 순서가 반대)
		calForm.month.innerHTML = months.map((m,i)=>
			`<option value='${i+1}'>${m}</option>`
		).join("\n")
//		for(let pn in zones) {
//			let pv = zones[pn];
//			calForm.zone.insertAdjacentHTML("beforeend",`<option value='${pn}'>${pv}</option>`);
//		}
		makeOptions(calForm.locale, locales);
		makeOptions(calForm.zone, zones);
		const today = new Date();
		calForm.year.value = today.getFullYear();
		calForm.month.value = today.getMonth()+1;
		calForm.locale.value = navigator.language;
		
		calForm.requestSubmit();	// 페이지가 완성되자마자 실행해서 jsp 가져옴
	})
//	.catch(err=>console.error(err))
	.catch(console.error)	// 함수 레퍼런스
	.finally(()=>console.log("최종 파이널리 실행"));
	
	calForm.addEventListener("change", (e)=>{
		// 아무리 바뀌어도 e.target은 바뀌지 않는 다는 것 확인하는 코드
		console.log("========>",e.target);
		console.log("========>",calForm);
		calForm.requestSubmit();
	});
	calForm.addEventListener("submit", async(e)=>{		// await 쓰려면 async 함수 안에서 써야함
		e.preventDefault();
		const form = e.target;
		let url = form.action;
		let method = form.method;
		let headers = {
			accept : "text/html"
		}
		let formData = new FormData(form);
		let queryString = new URLSearchParams(formData).toString();
		url = `${url}?${queryString}`;
		try {
			let resp = await fetch(url, {
				method : method,
				headers : headers
			});
			if(resp.ok) {
				let calHTML = await resp.text();
				calArea.replaceChildren("");
				calArea.insertAdjacentHTML("afterbegin", calHTML);
			}else {
				throw new Error(`처리 실패 : ${resp.status}`);
			}
		}catch(err) {
			console.error(err);
		}
	});	// submit handler end
	
	calArea.addEventListener("click", e=>{
		if(!e.target.classList.contains("link-a"))
			return false;
		let a = e.target;
		calForm.year.value = a.dataset.year;
		calForm.month.value = a.dataset['month'];
		calForm.requestSubmit();
	});
	
}	// fnInit end
document.addEventListener("DOMContentLoaded", fnInit);