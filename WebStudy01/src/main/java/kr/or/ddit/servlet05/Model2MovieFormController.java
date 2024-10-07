package kr.or.ddit.servlet05;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value="/movie/model2/formUI.hw", loadOnStartup=1)
public class Model2MovieFormController extends HttpServlet {
	private File folder;
	private ServletContext application;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
//		// 자바 1.8 이전 버전이면 Optional api가 없어서 if문으로 만들어야됨
		folder = Optional.ofNullable(application.getInitParameter("movieFolderQN"))
					// 물리 경로를 구하고 싶으므로 논리 경로를 구하는 과정을 빼야함
//					.map(qn->this.getClass().getResource(qn))	// 람다 : 자바에서는 ()=>{}가 아니라 ()->{}, 한 문장이면 괄호 생략 가능하고 return도 생략
//					.map(url->url.getFile())
					.map(rp->new File(rp))
					.orElseThrow(()->new ServletException("폴더가 없음"));
		System.out.println(folder.getAbsolutePath());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		data -> information -> content
		// ctrl + shift + t : 사용할 수 있는 메소드 찾기
		// 이미지가 아닌 파일까지 가져오는 것을 필터링
		String[] fileNames = folder.list((d,n)->Optional.ofNullable(application.getMimeType(n))
														.map(m->m.startsWith("video/"))
														.orElse(false)
				);
		
		// 간결하게 짜기 위해 람다와 stream을 사용하는 것
		// sugar syntax : 코드의 간결성을 지향하는 경향
		String pattern = "<option>%s</option>";
		String options = Arrays.stream(fileNames)
							   .map(n->String.format(pattern, n))
							   .collect(Collectors.joining("\n"));
		
		req.setAttribute("options", options);
		
		req.getRequestDispatcher("/WEB-INF/views/movie/formUI.jsp").forward(req,resp);
	}
}
