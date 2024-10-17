package kr.or.ddit.servlet08;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/factorial/case6")
public class FactorialControllerServlet_case6 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/factorial/case6Form.jsp").forward(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		InputStream is = req.getInputStream();
		FactorialVO facVO = mapper.readValue(is, FactorialVO.class);
		
		String accept = req.getHeader("accept");
		
		resp.setContentType(accept);
		
		try(
			PrintWriter out = resp.getWriter();
		){
			mapper.writeValue(out, facVO);
		}
	}
}
