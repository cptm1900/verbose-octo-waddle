package kr.or.ddit.props.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.props.PersonVO;
import kr.or.ddit.props.service.PersonService;
import kr.or.ddit.props.service.PersonServiceImpl;

/**
 * 새로운 person을 등록하고 나면,
 * 갱신된 list를 조회함
 * 직전에 새로 등록된 person의 tr 태그에 배경색을 입힐 것
 *
 */
@WebServlet("/props/personInsert.do")
public class PersonInsertController extends HttpServlet {
	private PersonService service = PersonServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "/WEB-INF/views/props/personForm.jsp";
		
		req.getRequestDispatcher(view).forward(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		
		PersonVO person = new PersonVO();
		person.setId(id);
		person.setName(name);
		person.setGender(gender);
		person.setAge(age);
		person.setAddress(address);
		
		Map<String, String> errors = new HashMap<String, String>();
		validate(person, errors);
		boolean valid = errors.isEmpty();
		if(valid) {
			boolean result = service.createPerson(person);
			if(result) {
				req.getSession().setAttribute("newPerson", person);
				resp.sendRedirect(req.getContextPath()+"/props/personList.do");
			}else {
				resp.sendError(500, "유효성 검사를 통과했는데 실패했기 때문에 서버 문제"); 
			}
		}else {
			resp.sendError(400, errors.toString());
		}
	}
	
	private void validate(PersonVO person, Map<String, String> errors) {
		if(StringUtils.isBlank(person.getId())) {
			errors.put("id","아이디 누락");
		}
		if(StringUtils.isBlank(person.getName())) {
			errors.put("name","이름 누락");
		}
		if(StringUtils.isBlank(person.getGender())) {
			errors.put("gender","성별 누락");
		}
		if(StringUtils.isBlank(person.getAge())) {
			errors.put("age","나이 누락");
		}
		if(StringUtils.isBlank(person.getAddress())) {
			errors.put("address","주소 누락");
		}
	}
}
