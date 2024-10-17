package kr.or.ddit.jackson;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.servlet08.FactorialVO;

class JsonMarshallingTest {

	@Test
	void testVO() throws StreamWriteException, DatabindException, IOException {
		FactorialVO facVO = new FactorialVO();
		facVO.setOperand(5);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(System.out, facVO);	// marshalling + serialization
		// 그래서 직렬화 가능한 객체로 만들어야됨 FactorialVO 뒤에 있는 implements Serializable
		
		String json = "{\"operand\":5,\"result\":120,\"expression\":\"5 * 4 * 3 * 2 * 1\"}";
		FactorialVO unMarshalledObj = mapper.readValue(json, FactorialVO.class);
		System.out.println(unMarshalledObj);
		// mapper.writeValue(System.out, facVO); 실행완료되자마자 출력스트림 닫혀서 unMarshalledObj는 콘솔에 출력 안 된 것
	}
	
	@Disabled
	@Test
	void test() throws JsonProcessingException {
		Map<String, Object> nativeTarget  = new HashMap<String,Object>();
		nativeTarget.put("prop1", "value1");
		nativeTarget.put("prop2", 23);
		nativeTarget.put("prop3", false);
		nativeTarget.put("prop4", Collections.singletonMap("innerProp", "innerValue"));
		nativeTarget.put("prop5", new int[] {1,2,3});
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(nativeTarget);
		
		System.out.printf("마샬링 된 json : %s\n", json);
		
		Map<String, Object> unMarshalledObj = mapper.readValue(json, HashMap.class);
		System.out.println(unMarshalledObj);
	}

}
