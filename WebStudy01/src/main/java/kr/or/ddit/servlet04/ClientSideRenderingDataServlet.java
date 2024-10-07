package kr.or.ddit.servlet04;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZoneId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/csr/case2")
public class ClientSideRenderingDataServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// data
		ZoneId timeZone = ZoneId.systemDefault();
		
		// information
		String information = timeZone.toString();
		
		String pattern = "{\"tzId\":\"%s\"}";
		
		resp.setContentType("application/json;charset=utf-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			out.print(String.format(pattern,information));
		}
	}
}
