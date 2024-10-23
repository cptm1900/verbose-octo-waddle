package kr.or.ddit.calc;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/calculate")
@MultipartConfig
public class CalculateServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		super.service(req,resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/calc/calForm.jsp").forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		double left = Optional.of(req.getParameter("left"))
//								.map(Double::parseDouble)
//								.get();		// required로 해서 알아서 에러 던져짐
		
		// 유효성 검사
		try {
			double left = Optional.of(req.getParameter("left"))
									.map(Double::parseDouble)
									.get();
			double right = Optional.of(req.getParameter("right"))
									.map(Double::parseDouble)
									.get();
			OperatorType operator = Optional.of(req.getParameter("operator"))
											.map(OperatorType::valueOf)
											.get();
			
			CalculateVO calVO = new CalculateVO();
			calVO.setLeft(left);
			calVO.setRight(right);
			calVO.setOperator(operator);
			
			resp.setContentType("application/json; charset=UTF-8");
			new ObjectMapper().writeValue(resp.getWriter(), calVO);
		}catch(IllegalArgumentException e) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
			return;
		}
	}
}
