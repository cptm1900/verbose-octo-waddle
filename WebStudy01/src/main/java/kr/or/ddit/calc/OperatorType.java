package kr.or.ddit.calc;

import java.util.function.DoubleBinaryOperator;

public enum OperatorType {
//	PLUS, MINUS, MULTIPLY, DIVIDE;
	PLUS('+', (l,r)->l+r),
	MINUS('-', (l,r)->l-r),
	MULTIPLY('*', (l,r)->l*r),
	DIVIDE('/', (l,r)->l/r);
	
	private OperatorType(char sign, DoubleBinaryOperator operator) {
		this.sign = sign;
		this.operator = operator;
	}
	private DoubleBinaryOperator operator;	// ctrl + 마우스 클릭으로 메소드 확인 가능
	
	private char sign;
	public char getSign() {
		return sign;
	}
	
	public double operate(double left, double right) {
		return operator.applyAsDouble(left, right);
	}
	
	public String getExpression(double left, double right) {
		return String.format("%f %c %f = %f", left, sign, right, operate(left,right));
	}
	
	// class로 아래와 같은 형태로 만든 것이 enum
//	public static final OperatorType PLUS = new OperatorType();
//	public static final OperatorType MINUS = new OperatorType();
}