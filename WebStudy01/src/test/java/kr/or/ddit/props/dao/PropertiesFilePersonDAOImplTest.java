package kr.or.ddit.props.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class PropertiesFilePersonDAOImplTest {
	
	PersonDAO dao = new PropertiesFilePersonDAOImpl();

	@Test
	void testInsertPerson() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectPerson() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectPersonList() {
//		dao.selectPersonList().forEach(person->System.out.println(person));
		dao.selectPersonList().forEach(System.out::println);
	}

	@Test
	void testUpdatePerson() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteParson() {
		fail("Not yet implemented");
	}

}
