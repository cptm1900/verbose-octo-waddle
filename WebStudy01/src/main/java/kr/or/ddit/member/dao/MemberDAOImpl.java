package kr.or.ddit.member.dao;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.text.WordUtils;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.vo.MemberVO;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public int insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO selectMember(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectMemberForAuth(String memId) {
		//		1. 쿼리 결정
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT MEM_ID, MEM_PASS, MEM_NAME, MEM_MAIL, MEM_HP");
		sql.append(" FROM MEMBER                                        ");
		sql.append(" WHERE MEM_ID = ?                                   ");
		try (
				//		2. Connection 생성
				Connection conn = ConnectionFactory.getConnection();
				//		3. 쿼리 객체 생성 : 쿼리가 미리 컴파일 되도록
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			//			4. 쿼리 파라미터 설정
				pstmt.setString(1, memId);
			//			5. 쿼리 실행
				ResultSet rs = pstmt.executeQuery();
				MemberVO saved = null;
				if(rs.next()) {
//					saved = new MemberVO();
//					saved.setMemId(rs.getString("MEM_ID"));
//					saved.setMemPass(rs.getString("MEM_PASS"));
//					saved.setMemName(rs.getString("MEM_NAME"));
//					saved.setMemMail(rs.getString("MEM_MAIL"));
//					saved.setMemHp(rs.getString("MEM_HP"));
					
					saved = resultSetToPerson(rs, MemberVO.class);
				}
				return saved;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private <T> T resultSetToPerson(ResultSet rs, Class<T> resultType) throws SQLException {
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			List<String> columnNames = new ArrayList<>(cnt);	// 원래 List는 처음에 10개짜리 빈 배열인데 ()안에 숫자 넣으면 그만큼의 크기로 바뀌어서 생성됨
			for(int i=1; i<=cnt; i++) {
				columnNames.add(rsmd.getColumnName(i));
			}
			
			T instance = resultType.newInstance();
			
			for(String cn : columnNames) {
				String propertyName = WordUtils.capitalizeFully("A"+cn, '_').substring(1).replace("_","");
				PropertyDescriptor pd = new PropertyDescriptor(propertyName, resultType);
				Method setter = pd.getWriteMethod();
				setter.invoke(instance, rs.getString(cn));
			}
			
			return instance;
		}catch(Exception e) {
			throw new SQLException(e);
		}
	}
	@Override
	public List<MemberVO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
