package kr.or.ddit.servlet08;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/factorial/case5")
public class FactorialControllerServlet_case5 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		/WebStudy01/src/main/webapp/WEB-INF/views/factorial/case3Form.jsp
		// dispatcher : 서버에 위임할때 사용
		req.getRequestDispatcher("/WEB-INF/views/factorial/case5Form.jsp").forward(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String opParam = req.getParameter("operand");
		if(opParam!=null && !opParam.trim().isEmpty()){
			int num1 = Optional.of(opParam)
								.filter(op->op.matches("\\d+"))
								.map(Integer::parseInt)
								.orElseThrow(()->new IllegalArgumentException("필수 파라미터에 문제있음"));
			
			FactorialVO facVO = new FactorialVO();
			facVO.setOperand(num1);
			
			String accept = req.getHeader("accept");
			
			resp.setContentType(accept);
			
			ObjectMapper mapper = new ObjectMapper();
			
			try(
				PrintWriter out = resp.getWriter();
			){
				mapper.writeValue(out, facVO);
			}
		}
	}
}
