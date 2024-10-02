package kr.or.ddit.servlet02;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageStreamingServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// classpath resource -> web resource로 바꿔서 서비스 하고 싶은 것
		
		String param = req.getParameter("image");
//		String imageFileName = "cute4.JPG";
		String imageFileName = param;
		// MIME텍스트는 출력을 하기 전에 설정해야함
//		resp.setContentType("image/jpeg");	// 하드코딩방식이라서 이미지 확장자마다 다 다르므로 안 좋음
		
		// 톰캣 안에 있는 web.xml파일에서 mime형식 이용
		ServletContext application = getServletContext();
		String mime = application.getMimeType(imageFileName);
		resp.setContentType(mime);
		
		String imageLogicalPath = "/kr/or/ddit/images/"+imageFileName;
		// /WebStudy01/src/main/resources/kr/or/ddit/images/cute4.JPG 에서 qualified name만
		
		// this : 현재 객체
		InputStream is = this.getClass().getResourceAsStream(imageLogicalPath);
		OutputStream out = resp.getOutputStream();
		byte[] buffer = new byte[1024];
		int cnt = -1;
		while((cnt = is.read(buffer))!=-1) {	// EOF를 만나기 전까지 반복
//			out.write(buffer);	// 이렇게 쓰면 용량이 3.5kb인 파일을 기록할 때 마지막 0.5kb가 그 전의 남은 데이터하고 겹쳐서 깨짐
			out.write(buffer, 0, cnt);	// 마지막 0.5kb 기록할 때 0부터 남은 cnt까지 기록하게 함
		}
	}
}
