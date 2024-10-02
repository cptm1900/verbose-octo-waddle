/**
 * 
 */

// ctrl + shift + R : 파일 찾기

const clientarea = document.getElementById("clientarea");
const serveratea = document.querySelector("#serverarea");
const controllBtns = document.querySelectorAll(".control");

const watchJob = async ()=>{
	clientarea.innerHTML = new Date();
	// 상대 경로의 기준 위치는 현재 js가 실행중인 html파일의 위치 (css에서는 css파일 자체가 기준이 됨)
	// webapp/now2.do가 아니라 WebStudy01/now2.do
	let resp = await fetch("../../../now2.ayo");
	// await는 async함수 안에서만 사용 가능
	// await ==> 기다렸다가 응답 데이터가 오면 그것을 받아옴
	if(resp.ok) {
		let jsonObj = await resp.json();
		serverarea.innerHTML = jsonObj.now;
	}else {
		let errMsg = await resp.text();
		serverarea.innerHTML = errMsg;
		controllBtns.forEach(b=>{
			if(b.dataset['role']=='stop')	// 연산(연관)계열구도
				b.click();
		});
	}
}

let intervalId = null;

const watchStart = (btn)=>{ 
		intervalId = setInterval(watchJob, 1000);
}

const watchStop = (btn)=>{
	if(intervalId)
		// 동적 타입에서는 변수 타입이 실행 시점에 결정되어서 객체를 갖고 있으면 true, 없으면 false로 판단 (자바에서는 null타입 에러)
		clearInterval(intervalId);
}

controllBtns.forEach((btn, index)=>{
	btn.addEventListener("click", ({target})=>{	// event가 가진 target만 가져옴 (구조 분해) (그러면 let target = event.target; 생략 가능)
		// console.log(event.target === btn)
		let role = target.dataset.role;
		controllBtns.forEach(b=>b.classList.toggle("d-none"));
		if(role=="start") {
			watchStart(target);
		}else if(role=="stop") {
			watchStop(target);
		}
	});
});