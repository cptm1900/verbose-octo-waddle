document.addEventListener("DOMContentLoaded",()=>{
	const selectMovie = document.querySelector("[name='movie']");
	const selectImage = document.querySelector("[name='image']");
	const forms = document.querySelectorAll("form");
	
	fetch("../../../movie/csr/fileList")
	.then(resp=>resp.json())
	// insertAdjacent 를 이용해서 요소 추가할 수 있는 위치 4가지
	// beforebegin(), afterend(), afterbegin(children위), beforeend(jQuery의append)
	.then(array=>selectMovie.insertAdjacentHTML( "beforeend",
									array.map(name=>`<option>${name}</option>`)
										 .join("\n"))
	)
	.catch(console.log);
	fetch("../../../image/csr/fileList")
	.then(resp=>resp.json())
	// insertAdjacentHTML이 innerHTML += 하는 것보다 더 빠름
	// innerHMTL은 += 를 해도 다시 처음부터 삽입하기 때문
	.then(array=>selectImage.innerHTML += 
									array.map(name=>`<option>${name}</option>`)
										 .join("\n"))
	.catch(console.log);
	
	let renderer = {
		image:(src, parent)=>{
			parent.innerHTML = "";
			parent.innerHTML = `<img src="${src}" />`;
		},
		movie:(src, parent)=>{
			parent.innerHTML = "";
			parent.innerHTML = `<video src="${src}" autoplay controls />`;
		}
	};
	
	forms.forEach((f)=>{
		f.addEventListener("submit",(e)=>{
			e.preventDefault();		// 동작을 막음
			let action = e.target.action;	// e.target ==> f
			let formData = new FormData(f);
			let queryString = new URLSearchParams(formData);
			let src = `${action}?${queryString}`;
			// http://localhost/WebStudy01/movie/streaming.hw?movie=sample-mp4-file.mp4
			// http://localhost/WebStudy01/image/streaming.hw?image=cute7.JPG
			let role = f.dataset['role'];	// 이름은 set인데 사실상 get임
			let targetArea = f.dataset['targetArea'];
			let parent = document.querySelector(targetArea);
			renderer[role](src, parent);
		});
	});
});