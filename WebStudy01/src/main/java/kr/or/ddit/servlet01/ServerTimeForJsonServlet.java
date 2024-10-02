package kr.or.ddit.servlet01;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZonedDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/now2.do")
public class ServerTimeForJsonServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req,  HttpServletResponse resp) throws ServletException, IOException{
		// JDK1.8 이후에 생긴 api
		// 모르면 변수명 먼저 쓰고 F2 눌러서 create로 변수 타입 설정
		ZonedDateTime now = ZonedDateTime.now();
		String pattern = "\"now\" : \"현재 시간 : %s\"";
		StringBuffer json = new StringBuffer();
		json.append("{");
		// 파이썬에서의 format과 비슷함 (printf를 못 쓰는 상황이므로 format사용)
		json.append(String.format(pattern, now.toString()));
		json.append("}");
		// MIME(Multipurposed Internet Email Extension) text
		// 전송 컨텐츠의 종류를 표현하기 위한 문자열
		// 형식 : main_type/sub_type
		//		ex) text/html, text/css, image/jpg
		// 메인 타입이 문자열이라면 ;찍고 charset=으로 인코딩 타입을 씀
		// 서블릿은 정적이 아니라 동적인 컨텐츠이기 때문에 씀 (안 쓰면 한글 다 깨짐)
		resp.setContentType("application/json; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		// data : 가공하기 전의 raw(날것)
		// information : data를 가공해 만들어진 로직의 결과물
		// content : 클라이언트의 상황에 맞게 표현된 메세지
		// dao(data), service(information), controller(content)
		out.print(json);
	}
}
