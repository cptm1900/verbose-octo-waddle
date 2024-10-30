package kr.or.ddit.props.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Properties;

import kr.or.ddit.props.PersonVO;

public class PropertiesFilePersonDAOImpl implements PersonDAO {
	private Properties props;
	
	private static PersonDAO selfInstance;
	
	private PropertiesFilePersonDAOImpl() {	// 모든 메소드에는 throws RuntimeException이 포함되어있음
		this.props = new Properties();
		String qn = "/kr/or/ddit/props/PersonData.properties";
		try(
			InputStream is = this.getClass().getResourceAsStream(qn);
		) {
			props.load(is);
		}catch(IOException e) {
			throw new RuntimeException(e);	// IOException을 RuntimeException으로 랩핑해서 전환
		}
	}
	
	public static PersonDAO getInstance() {
		if(selfInstance==null)
			selfInstance = new PropertiesFilePersonDAOImpl();
		return selfInstance;
	}
	
	private void commit() {
		String qn = "/kr/or/ddit/props/PersonData.properties";
		try {
			Path filePath = Paths.get(this.getClass().getResource(qn).toURI());
			try(
				OutputStream os = Files.newOutputStream(filePath, StandardOpenOption.WRITE);
			){
				props.store(os, LocalDateTime.now().toString());
			}
		}catch(Exception e) {
			// 예외 전환 (안 하면 인터페이스까지 다 바꿔야됨)
			throw new RuntimeException(e);
		}
	}

	@Override
	public int insertPerson(PersonVO person) {
		props.setProperty(person.getId(), personToString(person));
		commit();
		return 1;
	}

	@Override
	public PersonVO selectPerson(String id) {
		PersonVO person = Optional.ofNullable(props.getProperty(id))
									.map(value->stringToPerson(id,value))
									.orElse(null);
		
		return person;
	}
	
	private String personToString(PersonVO person) {	// 맵핑작업 (Mybatis 쓰는 이유)
		
		String value = String.format("%s|%s|%s|%s"
				, person.getName()
				, person.getGender()
				, person.getAge()
				, person.getAddress()
		);
		return value;
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
