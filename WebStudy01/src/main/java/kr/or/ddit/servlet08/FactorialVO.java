package kr.or.ddit.servlet08;

import java.io.Serializable;
import java.util.Objects;

public class FactorialVO implements Serializable{
	private int operand;
	private long result;
	private StringBuffer expression;

	public int getOperand() {
		return operand;
	}
	public void setOperand(int operand) {
		this.operand = operand;
		this.expression = new StringBuffer();
		this.result = factorial(operand, expression);
	}
	public long getResult() {
		return result;
	}
	public StringBuffer getExpression() {
		return expression;
	}
	@Override
	public int hashCode() {
		return Objects.hash(expression, operand, result);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FactorialVO other = (FactorialVO) obj;
		return Objects.equals(expression, other.expression) && operand == other.operand && result == other.result;
	}
	
	@Override
	public String toString() {
		return "FactorialVO [operand=" + operand + ", result=" + result + ", expression=" + expression + "]";
	}
	
	public long factorial(int num, StringBuffer expr) {
		if(num <= 0)
			// thorw를 써야 exception이 됨 (안 쓰면 그냥 객체 생성한 것)
			throw new IllegalArgumentException("팩토리얼 연산은 양의 정수를 대상으로 함");
		
		if(num==1) {
			expr.append(num);
			return 1;
		}
		else {
			expr.append(num + " * ");
			return num * factorial(num-1, expr);
		}
	}
}
