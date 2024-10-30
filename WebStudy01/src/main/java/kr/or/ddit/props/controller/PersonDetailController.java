package kr.or.ddit.props.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.props.PersonVO;
import kr.or.ddit.props.exception.PersonNotFoundException;
import kr.or.ddit.props.service.PersonService;
import kr.or.ddit.props.service.PersonServiceImpl;

//* 단건조회 : /props/personDetail.do?who=A0011 (GET)

@WebServlet("/props/personDetail.do")
public class PersonDetailController extends HttpServlet {
	private PersonService service = PersonServiceImpl.getInstance(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("who");
		
		if(id==null || id.trim().isEmpty()) {
			resp.sendError(400, "id 누락");
			return;
		}
		
		try {
			PersonVO person = service.readPerson(id);
			
			req.getSession().setAttribute("person", person);
			
			req.getRequestDispatcher("/WEB-INF/views/props/personDetail.jsp").forward(req,resp);
		}catch(PersonNotFoundException e) {
			resp.sendError(404, e.getMessage());
		}
	}
}
