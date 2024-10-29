package kr.or.ddit.props;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Map.Entry;
import java.util.Properties;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import kr.or.ddit.calc.CalculateServlet;

class PropertiesTest {
	@Disabled
	@Test
	void testReadAndWrite() throws URISyntaxException, IOException {
		Properties props = new Properties();
		
		String qn = "/kr/or/ddit/props/Dummy.properties";
		
		Path filePath = Paths.get(CalculateServlet.class.getResource(qn).toURI());
		
		try(
			// 이렇게 하면 데이터를 다 inputstream이 다 되기 전에 outputsteram을 생성해버림
			InputStream is = CalculateServlet.class.getResourceAsStream(qn);
			OutputStream os = Files.newOutputStream(filePath);
		) {
			props.load(is);
			props.setProperty("newProp3", "newValue3");
//			props.save(os, qn);	// deprecated 경고 뜸 (비추천)
			props.store(os, LocalDateTime.now().toString());
		}
	}

	@Test
	void testRead() throws URISyntaxException, IOException {
		Properties props = new Properties();
		
//		/WebStudy01/src/main/resources/kr/or/ddit/props/Dummy.properties
		String qn = "/kr/or/ddit/props/Dummy.properties";
		
		// 실행 환경상의 물리 경로
//		CalculateServlet.class.getResource(qn);
		
//		Path filePath = Paths.get(CalculateServlet.class.getResource(qn).toURI());
//		InputStream is = Files.newInputStream(filePath);
		
		// 위 2줄은 아래 1줄로 가능
		try(
			InputStream is = CalculateServlet.class.getResourceAsStream(qn);
		) {
			props.load(is);
			int size = props.size();
			System.out.println(size);
			
			System.out.println(props.getProperty("prop1"));
			
			for(Entry<Object, Object> entry : props.entrySet()) {
				System.out.printf("%s : %s\n", entry.getKey(), entry.getValue());
			}
		}
	}

}
