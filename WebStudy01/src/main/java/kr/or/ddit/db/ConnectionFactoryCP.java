package kr.or.ddit.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 * Factory Object Pattern
 * 	: 특정 객체의 생성을 전담하는 객체를 별도로 운영하는 설계 방식
 *
 */
public class ConnectionFactoryCP {
	private static ResourceBundle dbInfo;
	private static DataSource ds;
	
	static {
		String baseName = "kr.or.ddit.db.DBInfo";
		dbInfo = ResourceBundle.getBundle(baseName);
		
		// HikariCP
		HikariConfig config = new HikariConfig();
		config.setDriverClassName(dbInfo.getString("driverClassName"));
		config.setJdbcUrl(dbInfo.getString("url"));
		config.setUsername(dbInfo.getString("user"));
		config.setPassword(dbInfo.getString("password"));

		// pooling 정책 설정
//		config.setConnectionTestQuery("SELECT SYSDATE FROM DUAL");	// 커넥션 확인을 위한 의미없는 쿼리
//		config.setMinimumIdle(3);	// 밑에 생성자(new HikariDataSource(config)) 호출할때 커넥션을 3개 만듦
//		config.setMaximumPoolSize(5);	// 커넥션 최대 5개로 설정
//		config.setConnectionTimeout(2000);	// 2초 동안 해당 쓰레드 살려놓음 (2초 기다렸는데 반납 안 하면 SQLException)

		// 위 설정을 DBInfo.properties 파일에 적고 거기에서 호출하게 만듦
		config.setConnectionTestQuery(dbInfo.getString("testQuery"));
		config.setMinimumIdle(Integer.parseInt(dbInfo.getString("minimulIdle")));
		config.setMaximumPoolSize(Integer.parseInt(dbInfo.getString("maximulSize")));
		config.setConnectionTimeout(Long.parseLong(dbInfo.getString("maxWait")));
		
		ds = new HikariDataSource(config);
		
		// 커넥션을 미리 생성해놓고 이미 생성된 커넥션을 하나씩 줌
		// 다 사용하면 close가 아니라 반납을 해서 재활용을 함
		// 커넥션 객체의 생성 개수를 제한해서 서버가 터지지 않음
	}
	
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
}
