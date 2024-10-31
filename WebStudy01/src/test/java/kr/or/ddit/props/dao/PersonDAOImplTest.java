package kr.or.ddit.props.dao;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import kr.or.ddit.props.PersonVO;

class PersonDAOImplTest {
	PersonDAO dao = new PersonDAOImpl();
	PersonDAO fileDAO = PropertiesFilePersonDAOImpl.getInstance();

	@Disabled
	@Test
	void testInsertPerson() {
		// 제대로 가져와지는지 확인
		System.out.println(fileDAO.selectPersonList().size());
		// insert해서 테스트 확인
		fileDAO.selectPersonList().forEach(person->dao.insertPerson(person));
	}

	@Test
	void testSelectPerson() {
//		dao.selectPersonList().forEach(System.out::println);
		// 있는게 null이 아닌지 확인
		assertNotNull(dao.selectPerson("M0014"));
		System.out.println(dao.selectPerson("M0014"));
		// 없는게 null인지 확인
		assertNull(dao.selectPerson("abcdedf"));
	}

	@Disabled
	@Test
	void testSelectPersonList() {
		fail("Not yet implemented");
	}

	@Disabled
	@Test
	void testUpdatePerson() {
//		PersonVO person = new PersonVO();
//		person.setId("a001232");
//		person.setName("신규123123");
//		person.setGender("1");
//		person.setAge("1");
//		person.setAddress("1");
		
		// 예외가 발생하면 실패로 처리됨
		assertDoesNotThrow(()->{
			// 아래처럼 하면 더 쉽게 가능
			PersonVO person = dao.selectPerson("a001232");
			person.setAddress("asdfasdf");
			assertEquals(1, dao.updatePerson(person));	// 예상치, 실제값
		});
	}

	@Disabled
	@Test
	void testDeleteParson() {
		fail("Not yet implemented");
	}

}
