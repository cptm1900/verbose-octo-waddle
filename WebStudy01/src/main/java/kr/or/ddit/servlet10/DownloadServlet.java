package kr.or.ddit.servlet10;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * saveDir 내의 파일의 목록 중 하나를 선택하고, 다운로드 처리함
 * *** 서비스 설계
 * 1. get 요청 처리
 * 2. 선택한 파일명은 filename 파라미터로 전송됨
 * 3. 파일명이 누락된 경우, 400에러 전송
 * 4. 해당 파일이 없는 경우, 404에러 전송
 * 5. stream copy
 * 		- 다운로드 처리될 수 있는 헤더 결정 (content-disposition)
 *
 */
@WebServlet("/multipart/download.do")
public class DownloadServlet extends HttpServlet {
	// 세이브파일경로
	private Path saveDirPath = Paths.get("D:\\multipartDir\\saveDir");
	// ServletContext는 싱글톤이라서 전역으로 빼도 됨
	private ServletContext application;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		application = getServletContext();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		의사 코드 (한글로 처리 과정 미리 작성 후 코딩) *필수
//		1. charset 설정
		req.setCharacterEncoding("UTF-8");
//		2. filename 파라미터 확보
		String filename = req.getParameter("filename");
//		3. 누락 여부 체크
		if(filename == null || filename.trim().isEmpty()) {
//		- 누락됐다면, 400 전송
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "파일명 누락");
			return;
		}
//		4. 파일의 존재 여부 체크
		Path filePath = saveDirPath.resolve(filename);	// saveDirPath 뒤에 filename 붙임
		File file = filePath.toFile();	// 파일 경로를 파일 객체로 변환
		if(!file.exists()) {
//		- 없으면, 404 전송
			resp.sendError(404, "요청 파일이 존재하지 않음");	// HttpServletResponse 대신 404 써도 됨
			return;
		}
		if(file.isDirectory()) {		// 파일인지 폴더인지 확인
			resp.sendError(400, "폴더는 다운로드 되지 않음");
			return;
		}
//		5. 다운로드 될 수 있도록 헤더 설정(Content-Disposition, attatchment;filename)
		String encodedFilename = URLEncoder.encode(filename, "utf-8").replace("+"," ");	// filename에 한글 있어도 안 깨지게 하고 공백이 +로 나오므로 그걸 다시 공백으로 바꿈
		resp.setHeader("Content-Disposition", String.format("attatchment; filename=\"%s\"", encodedFilename));
		// 확장자가 서버에 없으면 확인이 불가능하므로 Optional로 확인
		String mime = Optional.ofNullable(application.getMimeType(filename))
								.orElse("application/octet-stream");	// octet(8비트) 단위의 스트림
		resp.setContentType(mime);
		// 파일의 크기 정보 보냄 (다운 받을 때 뜨는 정보)
		resp.setContentLengthLong(file.length());
//		6. 입/출력 스트림 확보 - body 기록
		try(
			// writer는 문자 기반, OutputStream은 이진 데이터 기반이므로 파일을 보낼 수 있는 OutputStream 사용
			OutputStream os = resp.getOutputStream();
		) {
			Files.copy(filePath, os);
		}
	}
}
