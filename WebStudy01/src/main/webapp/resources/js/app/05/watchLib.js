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

// 서버 시계
//1. 시간 출력 엘리먼트
//2. 서버의 갱신되는 시간 자원을 반복적으로 출력하기 위한 작업
//3. 시계 멈춤 가능
//4. 재가동 가능
class ServerWatch extends ClientWatch {		// 상속
	constructor(area, url) {
		super(area);		// 부모 객체 호출 (area 유효성 검사)
		if(!url) {
			throw new Error("url 없음");
		}
		this.url = url;
	}
	
	startWatch() {
		this.intervalId = setInterval(async ()=>{
			let resp = await fetch(this.url);	// 상대 경로 ./ 생략 가능
			let timeText = await resp.text();
			this.area.innerHTML = timeText;
		},1000);
	}
}

document.addEventListener("DOMContentLoaded", ()=>{
	let nodeList = document.querySelectorAll('.has-watch');
	nodeList.forEach(area=>{
		if(area.dataset.wlUrl) {	// html,jsp에서 wl-url ==> 스크립트에서는 wlUrl로 바뀜
			new ServerWatch(area, area.dataset.wlUrl);
		}
		else {
			new ClientWatch(area);
		}
	});
})