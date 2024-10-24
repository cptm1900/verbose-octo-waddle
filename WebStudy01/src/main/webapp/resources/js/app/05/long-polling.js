/*
//클라이언트 시계
//1. 시계 출력 엘리먼트
//2. 시간을 갱신할 수 있는 작업 (1초마다 갱신)
//3. 시계 멈춤 가능
//4. 재가동 가능

class ClientWatch {
	constructor(area) {
		if(!area){
			throw new Error("시계 출력 엘리먼트가 필요함");
		}
		this.area = area;
		area._watch = this;		// this : 현재 객체
		this.startWatch();
	}
	startWatch() {
		this.intervalId = setInterval(()=>{
			this.area.innerHTML = new Date();
		},1000);
	}
	stopWatch(){
		clearInterval(this.intervalId);
	}
}
*/

// 서버 시계
//1. 시간 출력 엘리먼트
//2. 서버의 갱신되는 시간 자원을 반복적으로 출력하기 위한 작업
//3. 시계 멈춤 가능
//4. 재가동 가능
//class ServerWatch {
//	constructor(area) {
//		if(!area){
//			throw new Error("출력 공간 없음");
//		}
//		this.area = area;
//		this.startWatch();
//	}
//	startWatch() {
//		this.intervalId = setInterval(async ()=>{
//			let resp = await fetch("getServerTime.jsp");	// 상대 경로 ./ 생략 가능
//			let timeText = await resp.text();
//			this.area.innerHTML = timeText;
//		},1000);
//	}
//	stopWatch() {
//		clearInterval(intervalId);
//	}
//}




document.addEventListener("DOMContentLoaded", async ()=>{
//	1. 페이지가 로딩 되자마자 비동기로 select box 렌더링
	let resp = await fetch("../calendar/ui-data");
	
//	2. 돌아온 json data property 3개에서 timezone list 구조분해 사용해서 리스트로
	let {zones} = await resp.json();
	
	let zone = document.getElementById('zone');
	for(let key in zones) {
//		value : 대서양 표준시
//		key : Asia/Kuala_Lumpur
		let value = zones[key];
		zone.insertAdjacentHTML("beforeend",`<option value='${key}'>${value}</option>`);
	}
	
//	3. 선택하면 change 이벤트 처리 옵션 밸류로 꺼내면 있는 timezone id를 url 뒤에 쿼리스트링으로
	zone.addEventListener('change', ({target})=>{		// 구조분해
		console.log(target.value);
		let zoneId = target.value;
		// attribute selector : [ ] 속성이 있으면 선택
		document.querySelectorAll('[data-wl-url]').forEach(area=>{
//			let url = area.dataset.wlUrl;
			let url = area._watch.url;
			area._watch.url = `${url}?zone=${zoneId}`;
		})
	});
	
	// 클라이언트 시계
//	const clientArea1 = document.getElementById("client-area1");
//	const clientArea2 = document.getElementById("client-area2");
//	const clientArea3 = document.getElementById("client-area3");

/*
	nodeList.forEach(area=>{
		new ClientWatch(area);
	});
*/

	// 서버 시계 (long-polling방식)
//	const serverArea = document.getElementById('server-area');
//	new ServerWatch(serverArea);

	let nodeList = document.querySelectorAll('.has-watch');
	
	const stopBtn = document.getElementById("stop-btn");
	const resumeBtn = document.getElementById("resume-btn");
	
//	// 1. ClientWatch 저장용 배열 생성
//	let watches = [];
//	
//	// 2. 배열에 인스턴스 저장
//	watches.push(new ClientWatch(clientArea1));
//	watches.push(new ClientWatch(clientArea2));
//	watches.push(new ClientWatch(clientArea3));
	
	// 3. STOP 버튼 클릭시 배열에 저장된 인스턴스들을 대상으로 stopWatch 호출
	stopBtn.addEventListener('click',(e)=>{
	
	// 4. 반복문으로 정지 메소드 호출
		// 향상된 for문
//		for(let w of watches) {	// in은 객체 순환, of는 배열 순환
//			w.stopWatch();
//		};
		nodeList.forEach(area=>area._watch.stopWatch());
		
	// 토글링 (class invisible이 있으면 지우고 없으면 생성)
		stopBtn.classList.toggle("invisible");	// class 제어할때 classList
		resumeBtn.classList.toggle("invisible");
	});
	
//	5. RESUME 버튼 클릭시, 모든 시계는 재가동.
	resumeBtn.addEventListener("click", function(){
//		watches.forEach(w=>{		// (index,value), 값 하나만 넣으면 value
//			w.startWatch();
//		});
		nodeList.forEach(area=>area._watch.startWatch());
		
		stopBtn.classList.toggle("invisible");
		resumeBtn.classList.toggle("invisible");
	});
})