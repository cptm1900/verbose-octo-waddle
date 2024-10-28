package kr.or.ddit.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 1. 로그아웃 처리(doPost)
 * 2. 로그아웃 성공 후 웰컴 페이지로 이동(redirect)
 *
 */
@WebServlet("/login/logout.do")
public class LogoutServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// getSession 설명 보면 존재하지 않을 때 새로 하나를 만듦
		HttpSession session = req.getSession();
		
		// 새로운 session 있으면 실행 (최초의 요청이 아니므로)
		if(session.isNew()) {
			resp.sendError(400, "현재 요청이 최초의 요청일 수가 없음");
			return;
		}
		
		// 세션 삭제
		session.invalidate();
		
		resp.sendRedirect(req.getContextPath());
	}
}
