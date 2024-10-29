package kr.or.ddit.props.service;

import java.util.List;

import kr.or.ddit.props.PersonVO;
import kr.or.ddit.props.exception.PersonNotFoundException;

/**
 * Logic Layer에 대한 접근 방법의 추상하
 * CUUD
 *
 */
public interface PersonService {
	/**
	 * 등록
	 * @param person
	 * @return
	 */
	public boolean createPerson(PersonVO person);
	
	/**
	 * 단건 조회
	 * @param id 조회할 식별자
	 * @return
	 * @throws PersonNotFoundException 해당 person이 존재하지 않으면 예외로 표함
	 */
	public PersonVO readPerson(String id) throws PersonNotFoundException;
	
	/**
	 * 다건 조회
	 * @return 없으면 empty list 반환
	 */
	public List<PersonVO> readPersonList();
	
	/**
	 * 수정
	 * @param person
	 * @return
	 */
	public boolean modifyPerson(PersonVO person);
	
	/**
	 * 삭제
	 * @param id
	 * @return
	 */
	public boolean removePerson(String id);
}
