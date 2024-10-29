package kr.or.ddit.props.dao;

import java.util.List;

import kr.or.ddit.props.PersonVO;

/**
 * Persistance Layer에 대한 접근 방법의 추상화
 * Create
 * Read
 * Update
 * Delete
 *
 */
public interface PersonDAO {
	/**
	 * 새로운 person 등록
	 * @param person
	 * @return 등록된 person 수
	 */
	public int insertPerson(PersonVO person);
	/**
	 * 하나의 person 조회
	 * @param id :식별자
	 * @return 존재하지 않으면 null 반환
	 */
	public PersonVO selectPerson(String id);
	/**
	 * 전체 person 조회
	 * @return 데이터가 없더라도 empty list 반환
	 */
	public List<PersonVO> selectPersonList();
	
	/**
	 * 
	 * @param person
	 * @return
	 */
	public int updatePerson(PersonVO person);
	
	/**
	 * 하나의 person 삭제
	 * @param id 작세할 pserson 식별자
	 * @return 삭제된 person 수
	 */
	public int deleteParson(String id);
}
