package kr.or.ddit.servlet10;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/multipart/fileList")
public class SaveDirFileListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		List<Path> children = new ArrayList<>();
		
		Path saveDirPath = Paths.get("D:/multipartDir/saveDir");
		
		// walkFileTree 쓰면 전체 절대 경로가 다 출력됨
		Files.walkFileTree(saveDirPath, new SimpleFileVisitor<Path>() {
			@Override
			public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
				children.add(file);
				return super.visitFile(file, attrs);
			}
		});
		
		// 방법1
//		File folder = new File(saveDirPath.toString());
//		String[] list = folder.list();
		
		// 방법2
		String[] list = children.stream()
								.map(p->p.getFileName().toString())
								.toArray(String[]::new);
		
		resp.setContentType("application/json;charset=utf-8");
		try(
			OutputStream os = resp.getOutputStream();
		) {
			new ObjectMapper().writeValue(os, list);
		}
		
//		req.setAttribute("list", list);
//		req.setAttribute("saveFilePath", saveDirPath);
//		
//		req.getRequestDispatcher("/WEB-INF/views/multipart/result.jsp").forward(req,resp);
		
		
	}
}