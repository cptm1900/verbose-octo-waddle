package kr.or.ddit.props.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kr.or.ddit.props.PersonVO;

public class PropertiesFilePersonDAOImpl implements PersonDAO {
	private Properties props;
	
	public PropertiesFilePersonDAOImpl() {	// 모든 메소드에는 throws RuntimeException이 포함되어있음
		this.props = new Properties();
		String qn = "/kr/or/ddit/props/PersonData.properties";
		try(
			InputStream is = this.getClass().getResourceAsStream(qn);
		) {
			props.load(is);
			selectPersonList();
		}catch(IOException e) {
			throw new RuntimeException(e);	// IOException을 RuntimeException으로 랩핑해서 전환
		}
	}

	@Override
	public int insertPerson(PersonVO person) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PersonVO selectPerson(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	private PersonVO stringToPerson(String key, String value) {
		String[] array = value.split("\\|");	// 정규식에서 |는 or 연산자이므로 이스케이프
		PersonVO person = new PersonVO();
		person.setId(key.toString());
		person.setName(array[0]);
		person.setGender(array[1]);
		person.setAge(array[2]);
		person.setAddress(array[3]);
		
		return person;
	}
	
	@Override
	public List<PersonVO> selectPersonList() {
		List<PersonVO> list = new ArrayList<>();
		for(Object key : props.keySet()) {
			String value = props.getProperty(key.toString());
			list.add(stringToPerson(key.toString(), value));
		}
		return list;
	}

	@Override
	public int updatePerson(PersonVO person) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteParson(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
