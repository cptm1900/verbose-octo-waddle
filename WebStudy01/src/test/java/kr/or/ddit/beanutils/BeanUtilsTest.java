package kr.or.ddit.beanutils;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.junit.jupiter.api.Test;

import kr.or.ddit.props.PersonVO;

class BeanUtilsTest {

	@Test
	void test2() throws IllegalAccessException, InvocationTargetException {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("id", "a001");
		paramMap.put("name", "이름");
		paramMap.put("address", "대전");
		
		PersonVO p1 = new PersonVO();
		BeanUtils.populate(p1, paramMap);
		
		System.out.println(p1);
	}

	@Test
	void test() throws IllegalAccessException, InvocationTargetException {
		PersonVO p1 = new PersonVO();
		p1.setId("a001");
		p1.setName("이름");
		p1.setAddress("대전");
		
		PersonVO p2 = new PersonVO();
		BeanUtils.copyProperties(p2, p1);
		System.out.println(p2);
	}

}
