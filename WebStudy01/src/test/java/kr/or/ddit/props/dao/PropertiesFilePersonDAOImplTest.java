package kr.or.ddit.props.dao;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import kr.or.ddit.props.PersonVO;

class PropertiesFilePersonDAOImplTest {
	
	PersonDAO dao = PropertiesFilePersonDAOImpl.getInstance();

	@Test
	void testInsertPerson() {
		PersonVO person = new PersonVO();
		person.setId("dummy01");
		person.setName("DUMMY_NAME");
		person.setGender("F");
		person.setAge("34");
		person.setAddress("대전 서구");
		
		// 예외가 발생하면 실패로 처리됨
		assertDoesNotThrow(()->{
			int rowcnt = dao.insertPerson(person);
			assertEquals(1, rowcnt);	// 예상치, 실제값
		});
	}

	@Disabled
	@Test
	void testSelectPerson() {
		fail("Not yet implemented");
	}

	@Disabled
	@Test
	void testSelectPersonList() {
//		dao.selectPersonList().forEach(person->System.out.println(person));
		dao.selectPersonList().forEach(System.out::println);
	}

	@Disabled
	@Test
	void testUpdatePerson() {
		fail("Not yet implemented");
	}

	@Disabled
	@Test
	void testDeleteParson() {
		fail("Not yet implemented");
	}

}
