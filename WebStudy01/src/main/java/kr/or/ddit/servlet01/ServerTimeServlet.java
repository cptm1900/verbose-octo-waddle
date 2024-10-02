package kr.or.ddit.servlet01;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZonedDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/now1.do")
public class ServerTimeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req,  HttpServletResponse resp) throws ServletException, IOException{
		// JDK1.8 이후에 생긴 api
		// 모르면 변수명 먼저 쓰고 F2 눌러서 create로 변수 타입 설정
		ZonedDateTime now = ZonedDateTime.now();
		StringBuffer html = new StringBuffer();
		html.append("<html>");
		html.append("<body>");
		html.append("현재 서버의 시간 : " + now.toString());
		html.append("</body>");
		html.append("</html>");
		resp.setContentType("text/html; charset=UTF-8");
		// 아래처럼 쓰면 브라우저가 코드를 json이 아니라 순수한 문자열로 인식함
//		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		// data : 가공하기 전의 raw(날것)
		// information : data를 가공해 만들어진 로직의 결과물
		// content : 클라이언트의 상황에 맞게 표현된 메세지
		// dao(data), service(information), controller(content)
		out.print(html);
	}
}
