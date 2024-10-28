package kr.or.ddit.flowcontrol;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *  컨트롤러의 작업 단계
 *  1. 요청 접수, 분석 : line, header, body 요청 데이터 분석
 *  2. model 생성 (Information) 생성
 *  3. model 전달 (setAttribute, 저장)
 *  4. view를 선택하고, 이동 (forward, redirect)
 *  
 *  view 작업 단계
 *  1. 저장된 model 확보(getAttribute, down casting)
 *  2. UI 구성(컨텐츠 생성)
 *
 */
@WebServlet("/flowcontrol")
public class Model2ControllerServlet extends HttpServlet {
	private Map<String, Object> recipe = new HashMap<>();
	
	// 코드블럭 (생성자 다음에 실행, 그다음이 init메소드)
	{
		recipe.put("kimchi","김치찌개");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("model", recipe);
//		resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/flowcontrol/mainLayout.jsp");
		// WEB_INF를 밖에서 접근 불가능 (redirect : 밖으로 나갔다가 들어옴, dispatcher : 서버 안에서 움직임)
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/flowcontrol/mainLayout.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("key");
		String text = req.getParameter("value");
		boolean valid = true;
		Map<String, String> errors = new HashMap<>();
		if(name==null || name.trim().isEmpty()) {
			valid = false;
			errors.put("key", "레시피 이름 누락");
		}
		if(text==null || text.trim().isEmpty()) {
			valid = false;
			errors.put("value", "레시피 설명 누락");
		}
		
		if(valid) {
			// 여기에서 setAttribute 하면 redirect로 이동할 때 request값이 사라지기 때문에 소용이 없음
//			req.setAttribute("new-menu", name);
			
			HttpSession session = req.getSession();
			session.setAttribute("new-menu", name);
			
			recipe.put(name, text);
//			PRG 패턴 (Post-Redirect-Get)
			resp.sendRedirect(req.getContextPath()+"/flowcontrol");
		}else {
			resp.sendError(400, errors.toString());
		}
	}
}
