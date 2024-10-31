package kr.or.ddit.props.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.props.service.PersonService;
import kr.or.ddit.props.service.PersonServiceImpl;

@WebServlet("/props/personDelete.do")
public class PersonDeleteController extends HttpServlet {
	private PersonService service = PersonServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("who");
		if(id.trim().isEmpty()) {
			resp.sendError(400, "id값 누락");
			return;
		}
		
		boolean result = service.removePerson(id);
		if(result) {
			resp.sendRedirect(req.getContextPath()+"/props/personList.do");
			return;
		}
		else {
			resp.sendError(500,"서버에러");
		}
	}
}
