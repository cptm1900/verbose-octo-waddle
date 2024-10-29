package kr.or.ddit.props.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.props.PersonVO;
import kr.or.ddit.props.service.PersonService;
import kr.or.ddit.props.service.PersonServiceImpl;

/**
 * 다건조회 : /props/personList.do (GET)
 * 단건조회 : /props/personDetail.do?who=A0011 (GET)
 * 등록 : /props/personInsert.do (GET, POST)
 * 수정 : /props/personUpdate.do?who=A0011 (GET, POST)
 * 삭제 : /props/personDelete.do?who=A0011 (GET)
 *
 * HCLC(High Cohesion(응집력) Low Coupling(결합력))
 * 
 * 인터페이스를 만드는 이유: 1. 협업, 2. 결합력 낮추기 위해
 * 
 */
@WebServlet("/props/personList.do")
public class PersonListController extends HttpServlet {
	private PersonService service = new PersonServiceImpl();
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			List<PersonVO> personList = service.readPersonList();
			
			req.setAttribute("list", personList);
			
			String view = "/WEB-INF/views/props/personList.jsp";
			
			req.getRequestDispatcher(view).forward(req,resp);
		}
}
