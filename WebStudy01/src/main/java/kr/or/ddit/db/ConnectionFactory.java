package kr.or.ddit.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Locale;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;

/**
 * Factory Object Pattern
 * 	: 특정 객체의 생성을 전담하는 객체를 별도로 운영하는 설계 방식
 *
 */
public class ConnectionFactory {
	private static Properties props;
	private static ResourceBundle dbInfo;
	
	static {	// 이 클래스가 메모리에 로딩될 때 (1번) 실행됨
		String baseName = "kr.or.ddit.db.DBInfo";
		dbInfo = ResourceBundle.getBundle(baseName);
		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// properties 정보로 바꾸기 에러나서 bundle로 함
//			ConnectionFactory cf = new ConnectionFactory();	// 이렇게 생성하면 참고할 값이 생성되지 않아서 무한 루프처럼 됨
			
//			String qn = "/kr/or/ddit/db/DBInfo.properties";
//			try(
//				InputStream is = ConnectionFactory.class.getResourceAsStream(qn);
//			) {
//				props.load(is);
//			}catch(IOException e) {
//				throw new RuntimeException(e);
//			}
			
//			String driverClassName = props.getProperty("driverClassName");
//			Class.forName(driverClassName);
			
			Class.forName(dbInfo.getString("driverClassName"));
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	// static을 붙여서 인스턴스를 생성하지 않아도 호출 가능하게 함
	public static Connection getConnection() throws SQLException {		// 여기에서 던진 에러는 이걸 호출한 곳으로 감
		String url = dbInfo.getString("url");
		String user = dbInfo.getString("user");
		String password = dbInfo.getString("password");
		
		return DriverManager.getConnection(url, user, password);	// DriverManager : db연결을 위한 구현체
	}
}
