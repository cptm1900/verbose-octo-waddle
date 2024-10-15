package kr.or.ddit.servlet07;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/request/parameters")
public class FormDataProcessServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// get방식(line을 통해서 전달)은 서버에서 인코딩하고 post방식(body를 통해서 전달)은 수신자가 인코딩
		// req.setCharacterEncoding은 get방식하고 상관없음
		// 그래서 get방식이 한글 깨지면 서버 설정을 봐야됨
		// server.xml에 useBodyEncodingForURI="true" 쓰면 get방식에서도 작동함 (서버마다 달라서 외워도 소용없음)
		
		System.out.printf("현재 요청의 메소드 : %s\n", req.getMethod());
//		getParametersCase1(req, resp);
//		getParametersCase2(req);
//		getParametersCase3(req);
//		getParametersCase4(req);
//		getParametersCase5(req);
//		getParametersCase6(req);
		getParametersCase7(req);
	}
	
	/**
	 * getParameterMap
	 * @param req
	 */
	private void getParametersCase7(HttpServletRequest req) {
		Map<String, String[]> parameterMap = req.getParameterMap();
		parameterMap.entrySet().stream().forEach((k,v)->);
	}
	
	/**
	 * getParameterMap
	 * @param req
	 */
	private void getParametersCase6(HttpServletRequest req) {
		Map<String, String[]> parameterMap = req.getParameterMap();
		// Map의 forEach 안은 BiConsumer 형태
		parameterMap.forEach((k,v)->System.out.printf(pattern, k, Arrays.toString(v)));
	}
	
	/**
	 * getParameterMap
	 * @param req
	 */
	private void getParametersCase5(HttpServletRequest req) {
		Map<String, String[]> parameterMap = req.getParameterMap();
		for(Entry<String,String[]> entry : parameterMap.entrySet()) {
			// ketSet 말고 entrySet을 이용한 방법
			String name = entry.getKey();
			String[] values = entry.getValue();
			System.out.printf(pattern, name, Arrays.toString(values));
		}
	}
	
	/**
	 * getParameterMap
	 * @param req
	 */
	private void getParametersCase4(HttpServletRequest req) {
		Map<String, String[]> parameterMap = req.getParameterMap();
		for(String name : parameterMap.keySet()) {
			// Map은 향상된 for문으로 접근하지 못하지만 keySet으로 바꾸서 접근하면 가능
			String[] values = req.getParameterValues(name);
			System.out.printf(pattern, name, Arrays.toString(values));
		}
	}

	/**
	 * getParameterMap
	 * @param req
	 */
	private void getParametersCase3(HttpServletRequest req) {
		Map<String, String[]> parameterMap = req.getParameterMap();
		Iterator<String> parameterNames = parameterMap.keySet().iterator();
		while (parameterNames.hasNext()) {
			String name = (String) parameterNames.next();
			String[] values = req.getParameterValues(name);
			System.out.printf(pattern, name, Arrays.toString(values));
		}
	}

	/**
	 * getParameterNames 와 getParameter, getParameterValues
	 * @param req
	 */
	private void getParametersCase2(HttpServletRequest req) {
		Enumeration<String> paramNames = req.getParameterNames();
		while(paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String[] values = req.getParameterValues(name);
			System.out.printf(pattern, name, Arrays.toString(values));
		}
	}

	private String pattern = "%s : %s\n";
	
	/**
	 * getParameter, getParameterValues
	 * @param req
	 * @param resp TODO
	 * @throws IOException 
	 */
	private void getParametersCase1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
		// 필수 파라미터라고 가정했을때
		int param1 = Optional.ofNullable(req.getParameter("param1"))
							.filter(p1->p1.matches("\\d+"))		// matches 안에 있는 것은 정규식
																// d+ : 정수1글자 이상
																// d{1,4} : 정수1글자~4글자
//							.map(p1->Integer.parseInt(p1))
							.map(Integer::parseInt)		// 메소드 레퍼런스로 표현
							.orElseThrow(()->new IllegalArgumentException("필수 파라미터 누락 혹은 잘못된 데이터 입력"));
		System.out.printf(pattern, "param1", param1);
		
		LocalDate param2 = Optional.ofNullable(req.getParameter("param2"))
							.filter(p2->p2.matches("\\d{4}-\\d{2}-\\d{2}"))
//							.map(p2->LocalDate.parse(p2))
							.map(LocalDate::parse)
							.orElseThrow(()->new IllegalArgumentException("필수 파라미터 누락 혹은 잘못된 데이터 입력"));
		System.out.printf(pattern, "param2", param2);
		
		LocalDateTime param3 = Optional.ofNullable(req.getParameter("param3"))
							.map(LocalDateTime::parse)
							.orElseThrow(()->new IllegalArgumentException("필수 파라미터 누락 혹은 잘못된 데이터 입력"));
		System.out.printf(pattern, "param3", param3);
		
		String param4 = Optional.of(req.getParameter("param4"))	// Optional.of : 알아서 예외 발생시킴 (ctrl+space설명보면나옴)
								.get();		// 그냥 꺼내옴
		System.out.printf(pattern, "param4", param4);
		
		String[] param5 = Optional.of(req.getParameterValues("param5"))
								.get();
		System.out.printf(pattern, "param5", Arrays.toString(param5));
		
		String param6 = Optional.of(req.getParameter("param6")).get();
		System.out.printf(pattern, "param6", param6);
		
		String param7 = Optional.of(req.getParameter("param7")).get();
		System.out.printf(pattern, "param7", param7);
		
		String[] param8 = Optional.of(req.getParameterValues("param8")).get();
		System.out.printf(pattern, "param8", Arrays.toString(param8));
		}	// try end -> 이렇게 써놔야 나중에 안 헷갈림
		catch(RuntimeException e) {		// uncatched exception만 잡으려고 함 (500에러를 400에러로 바꾸기 위해)
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
		}
	}
}
