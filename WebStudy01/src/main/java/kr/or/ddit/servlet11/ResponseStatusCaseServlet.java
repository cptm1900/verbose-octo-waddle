package kr.or.ddit.servlet11;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 1. 서비스 설계
 * 
 * 1) head 메소드 : no-op handler
 * 2) get 메소드 : 자원 서비스
 * 		- JSON, HTML 컨텐츠로 서비스
 * 3) post 메소드 : 자원 수신
 * 		- JSON payload, request parameter, multipart 컨텐츠 수신
 * 		- 수신한 자원에는 필수 데이터(data3)가 포함되어있는지 검증함
 *
 */
@WebServlet("/status/send-and-receive")
public class ResponseStatusCaseServlet extends HttpServlet {
	private Map<String, Object> model = new HashMap<>();
	
	// 코드블럭 (생성자 역할)
//	{
//		
//	}
	
	// init도 마찬가지
	@Override
	public void init() throws ServletException {
		super.init();
		model.put("deta1", "DATA1");
		model.put("deta2", "DATA2");
	}
	
	@Override
	protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.getWriter().println("Dummy Content");	// response body를 통해 전송될까아닐까될까아닐까 (안 됨, 원래 용도가 전송 안 하는 거임)
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String authorization = req.getHeader("authorization");

		// 인증받지 않았으면 로그인 하라고 창이 뜸
		if(authorization==null) {
			// basic 인증구조로 인증
			resp.setHeader("www-authenticate", "basic");
			resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			return;
		}
		
		// 토큰에서 basic 이후의 정보만 가져옴 (basic YWRtaW46MTIzNA==) <- 이런 형태에서
		String userToken = authorization.split("\\s+")[1];	// 공백 한 칸 : \s
		// byte[]을 string으로
		userToken = new String(Base64.getDecoder().decode(userToken));
		System.out.printf("사용자 식별 정보 : %s\n", userToken);
		
		// admin으로 시작 안 하면 에러
		if(!userToken.startsWith("admin")) {
			resp.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자만 접근할 수 있음");
			return;
		}
		
		String accept = Optional.ofNullable(req.getHeader("accept"))
								.map(String::toLowerCase)	// 메소드 레퍼런스
								.orElse("");
		
		String content = null;
		String contentType = null;
		if(accept.contains("json")) {
			contentType = "application/json; charset=utf-8";
			content = new ObjectMapper().writeValueAsString(model);
		}else if(accept.contains("xml")) {
			resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE, "xml 컨텐츠는 서비스 할 수 없음");
		}else {
			contentType = "text/html; charset=utf-8";
			content = String.format("<h4>%s</h4>",model.toString());
		}
		
		resp.setContentType(contentType);
		try(
			PrintWriter out = resp.getWriter();
		) {
			out.print(content);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String contentType = Optional.ofNullable(req.getContentType())
									.orElse("");
		
		// 타입이 뭔지 모를때 ? 사용하면 나중에 자동으로 들어감
		Map<String, ?> requestContent = null;
		if(contentType.contains("json")) {
			// json payload
			requestContent = new ObjectMapper().readValue(req.getInputStream(), HashMap.class);
		}else if(contentType.contains("xml")) {
			resp.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE, "xml payload 수신할 수 없음");
			return;
		}
		else {
			// request parameter
			requestContent = req.getParameterMap();
		}
		
		Object data3 = requestContent.get("data3");
		if(data3==null) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "현재 요청은 유효성 검증을 통과하지 못했음");
			return;
		}else {
			model.put("data3", data3);
//			Post-Redirect-Get : PRG 패턴 설계
			resp.sendRedirect(req.getContextPath()+"/status/send-and-receive");
		}
	}
}
