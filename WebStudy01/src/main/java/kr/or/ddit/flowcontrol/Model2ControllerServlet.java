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
			recipe.put(name, text);
//			PRG 패턴 (Post-Redirect-Get)
			resp.sendRedirect(req.getContextPath()+"/flowcontrol");
		}else {
			resp.sendError(400, errors.toString());
		}
	}
}
