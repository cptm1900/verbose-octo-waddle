package kr.or.ddit.servlet06;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZoneId;
import java.time.format.TextStyle;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ssr/model1/getHtml")
public class SSRModel1Servlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ZoneId timeZone = ZoneId.systemDefault();
		Locale locale = Locale.getDefault();
		
		String tzName = timeZone.getDisplayName(TextStyle.FULL, locale);
		String localeName = locale.getDisplayName(locale);
		
		StringBuffer content = new StringBuffer();

		content.append("<html>                   ");
		content.append("<style type='text/css'>");
		content.append(".red{background-color:red}");
		content.append(".yellow{background-color:yellow}");
		content.append("</style>");
		content.append("<script src='https://code.jquery.com/jquery-3.7.1.min.js'></script>");
		content.append("<body>                   ");
		content.append("<h4 class='red'>서버 시간대 : "+ tzName +"</h4>");
		content.append("<h4 class='yellow'>서버 로케일 : "+ localeName +"</h4>");
		content.append("</body>                  ");
		content.append("</html>                  ");
		
		resp.setContentType("text/html;charset=utf-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			out.print(content.toString());
		}
	}
}
