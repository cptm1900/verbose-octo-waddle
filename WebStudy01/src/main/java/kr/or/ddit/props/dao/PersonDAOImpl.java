package kr.or.ddit.props.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.props.PersonVO;

public class PersonDAOImpl implements PersonDAO {

	private void personToQueryParameter(PersonVO person, PreparedStatement pstmt) throws SQLException {
		int idx = 1;
		pstmt.setString(idx++, person.getId());
		pstmt.setString(idx++, person.getName());
		pstmt.setString(idx++, person.getGender());
		pstmt.setString(idx++, person.getAge());
		pstmt.setString(idx++, person.getAddress());
	}
	@Override
	public int insertPerson(PersonVO person) {
//		1. 쿼리 결정
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO PERSON(                 	");
		sql.append("	    ID, NAME, GENDER, AGE, ADDRESS 	");
		sql.append("	)VALUES(                           	");
		sql.append("	    ?, ?, ?, ?, ?                  	");
		sql.append(")                                   	");
		try(	// 현재 구조로 20개 이상 한꺼번에 못 넣음 (에러나는 상태)
//			2. Connection 생성
			Connection conn = ConnectionFactory.getConnection();
//			3. 쿼리 객체 생성 : 쿼리가 미리 컴파일 되도록
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
//			4. 쿼리 파라미터 설정
			personToQueryParameter(person, pstmt);
//			5. 쿼리 실행
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public PersonVO selectPerson(String id) {
		//		1. 쿼리 결정
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ID, NAME, GENDER, AGE, ADDRESS FROM PERSON WHERE ID = ?");
		try (
				//			2. Connection 생성
				Connection conn = ConnectionFactory.getConnection();
				//			3. 쿼리 객체 생성 : 쿼리가 미리 컴파일 되도록
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			//			4. 쿼리 파라미터 설정
			pstmt.setString(1, id);
			//			5. 쿼리 실행
			ResultSet rs = pstmt.executeQuery();
			PersonVO person = null;
			while(rs.next()) {
				person = resultSetToPerson(rs);
			}
			return person;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<PersonVO> selectPersonList() {
		List<PersonVO> list = new ArrayList<PersonVO>();
		//		1. 쿼리 결정
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ID, NAME, GENDER, AGE FROM PERSON");
		try (
				//			2. Connection 생성
				Connection conn = ConnectionFactory.getConnection();
				//			3. 쿼리 객체 생성 : 쿼리가 미리 컴파일 되도록
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			//			4. 쿼리 파라미터 설정

			//			5. 쿼리 실행
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(resultSetToPerson(rs));
			}
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	private PersonVO resultSetToPerson(ResultSet rs) throws SQLException {
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		List<String> columnNames = new ArrayList<>(cnt);	// 원래 List는 처음에 10개짜리 빈 배열인데 ()안에 숫자 넣으면 그만큼의 크기로 바뀌어서 생성됨
		for(int i=1; i<=cnt; i++) {
			columnNames.add(rsmd.getColumnName(i));
		}
		PersonVO person = new PersonVO();
		if(columnNames.contains("ID")) {
			person.setId(rs.getString("ID"));
		}
		person.setName(rs.getString("NAME"));
		person.setGender(rs.getString("GENDER"));
		person.setAge(rs.getString("AGE"));
		if(columnNames.contains("ADDRESS")) {
			person.setAddress(rs.getString("ADDRESS"));
		}
		
		return person;
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
