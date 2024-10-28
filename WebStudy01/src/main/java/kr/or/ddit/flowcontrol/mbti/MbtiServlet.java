package kr.or.ddit.flowcontrol.mbti;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * RestFul URI
 *	/mbti (GET)
 *	/mbti/enfj (GET) : path variable 형태로 데이터를 수신하기도 함
 *	/mbti (POST)
 *	/mbti/entj (DELETE)
 *
 */
@WebServlet("/mbti/*")		// /mbti/ 뒤에 아무거나 들어와도 다 받음 (아무것도 안 들어와도 받음)
@MultipartConfig()
public class MbtiServlet extends HttpServlet {
	public Map<String, String> mbtiMap;
	private ServletContext application;
	private Path mbtiFolderPath;
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			// get, post하고는 다르게 init은 super.init 지우면 ServletConfig 설정이 사라져서 지우면 안 됨
			super.init(config);
			// LinkedHashMap은 앞과 뒤를 연결해서 관계를 만들기 때문에 넣은 순서대로 들어감 (HashMap은 순서 섞임)
			mbtiMap = new LinkedHashMap<>();
			mbtiMap.put("istj","1. ISTJ 소금형");
            mbtiMap.put("isfj","2. ISFJ 권력형");
            mbtiMap.put("infj","3. INFJ 예언자형");
            mbtiMap.put("intj","4. INTJ 과학자형");
            mbtiMap.put("istp","5. ISTP 백과사전형");
            mbtiMap.put("isfp","6. ISFP 성인군자형");
            mbtiMap.put("infp","7. INFP 잔다르크형");
            mbtiMap.put("intp","8. INTP 아이디어형");
            mbtiMap.put("estp","9. ESTP 활동가형");
            mbtiMap.put("esfp","10. ESFP 사교형");
            mbtiMap.put("enfp","11. ENFP 스파크형");
            mbtiMap.put("entp","12. ENTP 발명가형");
            mbtiMap.put("estj","13. ESTJ 사업가형");
            mbtiMap.put("esfj","14. ESFJ 친선도모형");
            mbtiMap.put("enfj","15. ENFJ 언변능숙형");
            
            application = getServletContext();
            String realPath = application.getRealPath("/WEB-INF/views/mbti/mbtitypes");	// 논리경로(url) 넣으면 물리경로(파일절대경로) 나옴
            mbtiFolderPath = Paths.get(realPath);
		}
	
	private void singleMbti(String type, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 동기요청으로 보냈을 때 썼던 코드 (지금은 정규식으로 이미 아래서 검사했기 때문에 안 해도 됨)
		if(type==null || type.trim().isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 선택");
			return;
		}
		// type에 대한 존재 여부 확인은 톰캣이 알아서 한 다음에 404를 띄우므로 안 해도 됨
		req.getRequestDispatcher(String.format("/WEB-INF/views/mbti/mbtitypes/%s.html",type)).forward(req,resp);
	}
	
	private void allMbti(HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json; charset=utf-8");
		try(
			OutputStream os = resp.getOutputStream();
		) {
			new ObjectMapper().writeValue(os, mbtiMap);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 필드에 나가면 syso로 값 들어오는지 확인하면 안 됨 (디버그 모드로 확인)
		
		req.setCharacterEncoding("UTF-8");
		
		// contextPath 이후의 경로
		String requestURI = req.getRequestURI();
		
		// 정규식 - [] : 한글자에 대한 패턴, {4} : 4글자, () : 패턴 그룹
		Pattern regex = Pattern.compile(req.getContextPath()+"/mbti/([a-z]{4})");
//		Pattern regex = Pattern.compile(req.getContextPath()+"/mbti/(i|e)(s|n)(t|f)(j|p)");	// 이렇게 하면 group(1)~group(4)까지 다 빼내야됨
		Matcher matcher = regex.matcher(requestURI);
		if(matcher.find()) {	// 매칭되면 true
			String type = matcher.group(1);	// group 인덱스는 1부터 시작
			singleMbti(type, req, resp);
		}else {
			allMbti(resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 특수문자에 대한 디코딩 설정
		req.setCharacterEncoding("UTF-8");
//		2. 문자기반의 파트는 parameter로 수신
		String mbtiType = req.getParameter("mbtiType");
		String mbtiDesc = req.getParameter("mbtiDesc");
//		3. 파일기반의 파트는 part로 수신
		Part mbtiFile = req.getPart("mbtiFile");
//		4. 검증(필수 데이터 가정)
		boolean valid = true;
		Map<String, String> errors = new HashMap<>();
		if(StringUtils.isBlank(mbtiType)) {
			valid = false;
			errors.put("mbtiType", "유형 데이터 누락");
		}
		if(StringUtils.isBlank(mbtiDesc)) {
			valid = false;
			errors.put("mbtiDesc", "설명 데이터 누락");
		}
		// mbtiFile이 없어도 공백 파일로 올라가서 null만 쓰면 체크를 못하는 경우가 있음
		// mbtiFile.getSubmittedFileName() : 업로드 된 파일 이름
		if(mbtiFile==null || StringUtils.isBlank(mbtiFile.getSubmittedFileName())) {
//		if(mbtiFile==null || StringUtils.isBlank(mbtiFile.getName())) {
		// mbtiFile.getName()은 getPart("mbtiFile")했던거 나옴 input name을 구하는 거임
			valid = false;
			errors.put("mbtiFile", "파일 데이터 누락");
		}else if(!mbtiFile.getContentType().contains("html")) {
			valid = false;
			errors.put("mbtiFile","컨텐츠 파일은 html만 허용함");
		}
		if(valid) {
//		6. 검증 통과 : 새로운 MBTI 유형 등록
//			1) mbtiMap에 엔트리 추가
				mbtiMap.put(mbtiType, mbtiDesc);
//			2) 컨텐츠 파일 저장
				// resolve쓰면 /같은 문자 신경 안 써도 됨 그래서 path 메소드 쓰면 string에 그대로 때려박는 것보다 편함
				Path filePath = mbtiFolderPath.resolve(mbtiType+".html");
				mbtiFile.write(filePath.toString());
//		7. redirect로 /mbti (GET) : P-R-G pattern
				resp.sendRedirect(req.getContextPath()+"/mbti");

		}else {
//			5. 검증 실패 : 400에러 전송
			resp.sendError(400, errors.toString());
		}

/*
//		1. html에서 newform의 데이터를 multipart, post형식의 비동기로 보냄
//		2. 문자기반 데이터(mbti유형,mbti설명)받음
		String mbtiType = req.getParameter("mbtiType");
		String mbtiDesc = req.getParameter("mbtiDesc");
		if(mbtiType==null || mbtiType.isEmpty()) {
			resp.sendError(400);
		}
		if(mbtiDesc==null || mbtiDesc.isEmpty()) {
			resp.sendError(400);
		}
		
//		3. mbtiMap에 문자기반 데이터 넣음
		mbtiMap.put(mbtiType, mbtiDesc);
		
//		4. 파일기반 데이터(part)받음
		Part mbtiFile = req.getPart("mbtiFile");
		if(mbtiFile==null) {
			resp.sendError(400);
		}
//		5. mbtiFolderPath 경로에 파일 저장
		String originName = mbtiFile.getSubmittedFileName();
		Path saveFilePath = Paths.get(mbtiFolderPath.toString(), originName);
		mbtiFile.write(saveFilePath.toString());
		
//		6. 리스트 출력
		resp.sendRedirect(req.getContextPath()+"/mbti");
	}
*/
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		Pattern regex = Pattern.compile(req.getContextPath()+"/mbti/([a-z]{4})");
		Matcher matcher = regex.matcher(requestURI);
		if(matcher.find()) {
			String type = matcher.group(1);
			mbtiMap.remove(type);
			Path delFilePath = mbtiFolderPath.resolve(type+".html");
			boolean success = Files.deleteIfExists(delFilePath);	// 존재하면 삭제
			// post에서 redirect하면 get으로 가는데 put이나 delete에서 redirect하면 다시 put이나 delete로 돌아와서 무한 루프가 됨
			
			// singletonMap은 immutable(불변)이므로 삭제, 수정이 불가능
			Map<String, Object> target = Collections.singletonMap("delete", success ? 1 : 0);
			resp.setContentType("application/json;charset=utf-8");
			try(
				OutputStream os = resp.getOutputStream();
			) {
				new ObjectMapper().writeValue(os, target);
			}
		}else {
			resp.sendError(405, "전체 삭제는 지원하지 않음");
		}
	}
}
