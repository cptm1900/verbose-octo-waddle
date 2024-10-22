package kr.or.ddit.servlet10;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * * multipart/form-data 수신
 * 1. post 요청 수신
 * 2. multi-part body 를 수신하기 위해 Part 라는 API 활용
 * 3. @multipartConfig(multipart-config-web.xml) 설정 필요
 * 	1) 문자 기반의 part는 파라미터로 파싱
 * 	2) chunk 단위로 전송되는 binary 데이터를 저장할 임시 저장 공간 설정
 * 	3) 업로드 정책 제한 설정 가능
 *
 */
@WebServlet("/mutipart/sendFileAndText")
@MultipartConfig(location = "D:/multipartDir", 
				maxFileSize = 1024*1024*10, maxRequestSize = 1024*1024*100, fileSizeThreshold = 1024*10)
public class ReceiveFileAndTextServlet extends HttpServlet {
//	private File saveDir = new File("D:/multipartDir/saveDir");
	private Path saveDirPath = Paths.get("D:/multipartDir/saveDir");
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.printf("param1 : %s \n", req.getParameter("param1"));
		System.out.printf("param2 : %s \n", req.getParameter("param2"));
		System.out.printf("param3 : %s \n", req.getParameter("param3"));
		
		// 업로드 파일을 수신하고, 저장 위치에 저장
		Part uploadFile = req.getPart("uploadFile");
		if(uploadFile!=null) {
			String originalFilename = uploadFile.getSubmittedFileName();
			Path saveFilePath = Paths.get(saveDirPath.toString(), originalFilename);
			// 아래처럼도 가능
//			Path saveFilePath = saveDirPath.relativize(Paths.get(originalFilename));
			
			// 방법1 (생성된 임시 파일을 자동으로 지워줌)
			uploadFile.write(saveFilePath.toString());
			
			// 방법2 (생성된 임시 파일을 지우는 코드를 따로 추가해야됨)
//			try(
//				InputStream is = uploadFile.getInputStream();
//			) {
//				Files.copy(is, saveFilePath);
				System.out.println("업로드 완료, 저장 폴더 확인.");
//			}
			
			String accept = req.getHeader("accept");
			String destPath = null;
			if(accept.contains("json")) {
				destPath = "/multipart/fileList";
				// prg패턴
				resp.sendRedirect(req.getContextPath()+destPath);	// 밖으로 나갔다가 들어오는 방식이라서 contextpath까지 다 써야됨
				return;
			}else {
				req.setAttribute("saveFilePath", saveFilePath);
				destPath = "/WEB-INF/views/multipart/result.jsp";
			}
			req.getRequestDispatcher(destPath).forward(req,resp);
		}
	}
}
