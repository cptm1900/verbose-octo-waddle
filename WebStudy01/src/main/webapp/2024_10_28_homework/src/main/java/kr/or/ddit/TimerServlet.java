package kr.or.ddit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/timer")
public class TimerServlet extends HttpServlet {
	HttpSession session;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session = req.getSession();
		
		long end = session.getMaxInactiveInterval();
		long last = session.getLastAccessedTime();
		
		session.setAttribute("end", end);
		session.setAttribute("last", last);
		
		req.getRequestDispatcher("/WEB-INF/timer.jsp").forward(req,resp);
	}
	
	@Override
	protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
