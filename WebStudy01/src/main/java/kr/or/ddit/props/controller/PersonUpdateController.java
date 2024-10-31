package kr.or.ddit.props.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.props.PersonVO;
import kr.or.ddit.props.service.PersonService;
import kr.or.ddit.props.service.PersonServiceImpl;

@WebServlet("/props/personUpdate.do")
public class PersonUpdateController extends HttpServlet {
	private PersonService service = PersonServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "/WEB-INF/views/props/personForm.jsp";
		
		req.getRequestDispatcher(view).forward(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
		
//		String id = req.getParameter("id");
//		String name = req.getParameter("name");
//		String gender = req.getParameter("gender");
//		String age = req.getParameter("age");
//		String address = req.getParameter("address");
		
		PersonVO person = new PersonVO();
		
		// 리플렉션 방식은 속도가 느림
		try {
			BeanUtils.populate(person, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new ServletException(e);
		}
		
//		person.setId(id);
//		person.setName(name);
//		person.setGender(gender);
//		person.setAge(age);
//		person.setAddress(address);
		
		Map<String, String> errors = new HashMap<String, String>();
		validate(person, errors);
		boolean valid = errors.isEmpty();
		if(valid) {
			boolean result = service.modifyPerson(person);
			if(result) {
				resp.sendRedirect(req.getContextPath()+"/props/personDetail.do?who="+person.getId());
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
//	//private PersonServiceImpl service = PersonServiceImpl.getInstance();
//	private PersonService service = PersonServiceImpl.getInstance();
//	Map<String,String> errors;
//	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		
//		PersonVO person = new PersonVO();
//		person.setId(req.getParameter("who"));
//		person.setName(req.getParameter("name"));
//		person.setGender(req.getParameter("gender"));
//		person.setAge(req.getParameter("age"));
//		person.setAddress(req.getParameter("address"));
//		
//		errors = new HashMap<>();
//		validCheck(person);
//		if(!errors.isEmpty()) {
//			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, errors.toString());
//			return;
//		}
//		
//		boolean result = service.modifyPerson(person);
//		
//		if(result) {
//			resp.sendRedirect(req.getContextPath()+"/props/personList.do");
//		}
//		else {
//			resp.sendError(500, "서버에러");
//		}
//	}
//	
//	private void validCheck(PersonVO person) {
//		if(person.getId().trim().isEmpty()) {
//			errors.put("idError", "id누락");
//		}
//		if(person.getName().trim().isEmpty()) {
//			errors.put("nameError", "name누락");
//		}
//		if(person.getGender().trim().isEmpty()) {
//			errors.put("genderError", "gender누락");
//		}
//		if(person.getAge().trim().isEmpty()) {
//			errors.put("ageError", "age누락");
//		}
//		if(person.getAddress().trim().isEmpty()) {
//			errors.put("addressError", "address누락");
//		}
//	}
}
