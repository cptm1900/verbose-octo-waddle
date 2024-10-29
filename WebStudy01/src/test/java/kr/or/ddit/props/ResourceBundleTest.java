package kr.or.ddit.props;

import java.util.Locale;
import java.util.ResourceBundle;

import org.junit.jupiter.api.Test;

class ResourceBundleTest {

	@Test
	void test() {
//		/WebStudy01/src/main/resources/kr/or/ddit/props/messages/Message_en.properties
		// baseName은 확장자,locale 미포함, 경로구분자로 /가 아니라 .을 사용 (맨 앞 /는 뺌)
		String baseName = "kr.or.ddit.props.messages.Message";
		// ResourceBundle은 읽기만 가능하고 기본 생성자가 없음, 뒤에 locale 정보 쓰면 맞는 properties를 읽어옴
		ResourceBundle bundle = ResourceBundle.getBundle(baseName, Locale.KOREAN);
		String value = bundle.getString("hi");
		System.out.println(value);
	}

}
