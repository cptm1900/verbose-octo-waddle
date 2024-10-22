package kr.or.ddit.enumtest;

import java.util.function.DoubleBinaryOperator;

import org.junit.jupiter.api.Test;

class EnumTestCase {
	// enum도 클래스
	// 하지만 enum은 생성자가 private으로 묶여있음 (외부에서 객체 생성 불가능)
	enum OperatorType {
//		PLUS, MINUS, MULTIPLY, DIVIDE;
		PLUS('+', (l,r)->l+r),
		MINUS('-', (l,r)->l-r),
		MULTIPLY('*', (l,r)->l*r),
		DIVIDE('/', (l,r)->l/r);
		
		// 람다식을 쓰려면 특정 함수만 가능해서
		private OperatorType(char sign, DoubleBinaryOperator operator) {
			this.sign = sign;
			this.operator = operator;
		}
		private DoubleBinaryOperator operator;
		
		private char sign;
		public char getSign() {
			return sign;
		}
		
		// class로 아래와 같은 형태로 만든 것이 enum
//		public static final OperatorType PLUS = new OperatorType();
//		public static final OperatorType MINUS = new OperatorType();
	}
	
	@Test
	void test() {
		
	}

}
