package kr.or.ddit.servlet03;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.Optional;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageStreamingServlet extends HttpServlet {
	private File folder;
	private ServletContext application;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
		folder = Optional.ofNullable(application.getInitParameter("folderQN"))
					.map(qn->this.getClass().getResource(qn))
					.map(url->url.getFile())
					.map(rp->new File(rp))
					.orElseThrow(()->new ServletException("폴더가 없음"));
		System.out.println(folder.getAbsolutePath());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		File imageFile = Optional.ofNullable(req.getParameter("image"))
									.map(p->new File(folder,p))
									.filter(f->f.exists())
									.orElseThrow(()->new ServletException("필수 파라미터 누락"));
//		try( closable 객체 선언 ) {}catch(exception) {}finally {} ==> try with resource 구문
		resp.setContentType(application.getMimeType(imageFile.getName()));
		try(
				OutputStream os = resp.getOutputStream();	// 이렇게 하면 try catch finally 다 안 써도 알아서 close()가 됨
				// int number = 1024; 이런 구문은 못 씀 (close가 가능한 객체가 아니므로)
		){
			Files.copy(imageFile.toPath(), os);
		}
	}
}
