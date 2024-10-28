package kr.or.ddit.datashare;

import org.junit.jupiter.api.Test;

import kr.or.ddit.flowcontrol.mbti.MbtiServlet;

class DataAccessBetweenObjects {
	
//	static class TypeA {
//		private String propA = "DATA-A";
//		{
//			TypeB tB = new TypeB();
//			tB.propB;
//		}
//	}
//	
//	static class TypeB {
//		public String propB = "DATA-B";
//	}
	
	@Test
	void test() {
		MbtiServlet instance = new MbtiServlet();
		System.out.println(instance.mbtiMap);
		// 객체를 Tomcat서버가 만들어야되는데 여기에서 강제로 만들어서 호출했기 때문에 null 나옴
	}

}
