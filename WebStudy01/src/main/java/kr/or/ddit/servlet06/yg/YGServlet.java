package kr.or.ddit.servlet06.yg;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.yg")
public class YGServlet extends HttpServlet {
	private ServletContext application;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String servletPath = req.getServletPath();	// tmpl/sample.yg 나옴
		String fileSystemPath = application.getRealPath(servletPath);
		File ygFile = new File(fileSystemPath);
		System.out.println(ygFile.getAbsolutePath());
		
		List<String> template = Files.readAllLines(ygFile.toPath());
		resp.setContentType("text/html;charset=utf-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			// ctrl + spacebar 누르면서 무슨 역할을 하는 메소드인지 확인
			String html = template.stream()
								  .map(line->{
//									  ${tzName{localeName}}
									  Pattern regexp = Pattern.compile("\\$\\{(\\w+)\\}");
									  Matcher matcher = regexp.matcher(line);
									  if(matcher.find()) {
										  String name = matcher.group(1);
										  Object value = req.getAttribute(name);
										  String replaceValue = Objects.toString(value,"");
										  return line.replaceAll(regexp.pattern(), replaceValue);
									  }else {
										  return line;
									  }
								  })
								  .collect(Collectors.joining("\n"));
			out.println(html);
		}
	}
}
