package kr.or.ddit.props.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

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
		fail("Not yet implemented");
	}

	@Disabled
	@Test
	void testDeleteParson() {
		fail("Not yet implemented");
	}

}
