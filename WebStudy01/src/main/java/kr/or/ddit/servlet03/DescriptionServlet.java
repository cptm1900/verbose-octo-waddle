package kr.or.ddit.servlet03;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZonedDateTime;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿 스펙 ( why/ what/ how )
 * 사용 목적 : 웹상의 불특정 다수의 클라이언트가 발생시키는 다양한 요청을 처리하기 위해
 * 			동적 자원(컨텐츠)를 생성할 수 있는 자바 기반의 백엔드 모듈이 필요함
 * 서블릿 : 웹상의 요청을 받고, 분석하고, 그에 적합한 동적 응답을 생성할 수 있는 자바 객체(가 만족해야 하는 조건에 대한 명세서)
 * 			==> 코드화 시켜 놓은 것이 HttpServlet
 * 서블릿 개발 단계
 * 1. HttpServlet의 확장(extends) 클래스 구현
 * 2. 필요에 따라 적절한 callback 메소드를 재정의
 * 		*** 서블릿 컨테이너의 역할과 특성
 * 				: 서블릿 생명주기 관리자, 요청이 발생하면 해당 서블릿의 특정 롤백 메소드를 실행함
 * 				1) 서블릿 인스턴스를 생성하는 시점 : load-on-startup
 * 					- lazy-loading(지연 로딩(기본)) : 서버가 구동되는 시점에 인스턴스를 생성하지 않고, 최초의 요청이 발생했을 때로 생성 시점을 미뤄둠
 * 					- eager-loading(즉시 로딩) : 서버가 구동되는 시점에 인스턴스를 미리 생성함
 * 				2) 서블릿은 싱글톤으로 관리됨
 * 				3) 서블릿의 생명주기 관리 과정에서 발생하는 이벤트에서 관련 콜백 메소드를 실행함
 * 					- 생명주기 콜백 : init(서블릿이 생성되고 초기화 작업 종료 직후), destory(서블릿 소멸 직전)
 * 					- 요청 콜백
 * 						service : 요청이 발생하면, 컨테이너가 직접 실행하는 메소드로,
 * 									http method를 판단하고, 그에 맞는 doXXX계열의 메소드를 호출함
 * 						doXXX : 하나의 http method를 별개로 처리하기 위한 메소드
 * 				4) 서블릿의 인스턴스 생성될 때 초기화 파라미터 전달함
 * 3. 서블릿 컨테이너가 서블릿을 관리(운영)할 수 있는 설정
 * 	1) 컨테이너에 서블릿 클래스 등록
 * 		2.x : web.xml(deployment descriptor(배포서술자))에 servlet->servlet-name, servlet-class 등록
 * 		3.x : @WebServlet
 * 	2) 서블릿 매핑을 통해 컨테이너가 서블릿을 실행할 수 있는 조건 설정
 * 		2.x : web.xml에 servlet-mapping -> servlet-name, url-pattern
 * 		3.x : @WebServlet(url)
 * 4. 컨테이너 리로드
 * 
 * *** 서블릿 스펙에서 제공되는 객체
 * 1. HttpServletRequest : http 프로토콜로 패키징된 요청에 대한 정보를 캡슐화한 객체
 * 2. HttpServletResponse : http 프로토콜로 패키징된 응답에 대한 정보를 캡슐화한 객체
 * 3. HttpSession : 한 클라이언트가 하나의 에이전트 프로그램으로 형성한 한 세션에 대한 정보를 캡슐화한 객체
 * 4. ServletContext : 하나의 웹어플리케이션(컨텍스트)에 대한 정보를 캡슐화한 객체
 * 						하나의 웹어플리케이션에 대해 싱글톤으로 생성되는 객체
 * 
 */
// 원래는 web.xml에 일일이 쓰던 것을 간소화 시킨 것이 WebServlet어노테이션 (servlet3.0버전부터만 가능)
//@WebServlet(name="dafds", urlPatterns={"/desc", "/DESC"})
//@WebServlet({"/desc", "/DESC"})
public class DescriptionServlet extends HttpServlet {

	private String param1Value;
	private ServletContext application;

	public DescriptionServlet() {
		super();
		System.out.printf("%s 객체 생성\n", this.getClass().getName());
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
		System.out.printf("%s 서블릿 초기화 완료\n", this.getClass().getSimpleName());
		param1Value = config.getInitParameter("param1");
		// 대상이 문자열이면 블랭크여부까지 확인해야함
		if(param1Value!=null && !param1Value.isEmpty()) {
			System.out.printf("param1의 값 : %s\n", param1Value);
		}
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("요청 접수, http request method 판단");
		super.service(req, resp);
		System.out.println("요청 처리 완료");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.printf("Get 메소드 요청 처리, 실행 쓰레드명 : %s\n", Thread.currentThread().getName());
		ZonedDateTime now = ZonedDateTime.now();
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(now.toString());
		out.println(application.hashCode());
		out.println(application.getInitParameter("contextParam1"));
	}

	@Override
	public void destroy() {
		System.out.printf("%s 서블릿 소멸\n", this.getClass().getSimpleName());
	}

}
