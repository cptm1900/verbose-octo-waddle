package kr.or.ddit.calc;

import java.io.Serializable;
import java.util.Objects;

public class CalculateVO implements Serializable {	// 직렬화를 하려면 필요함
	private double left;
	private double right;
	private OperatorType operator;
	
	public double getLeft() {
		return left;
	}
	public void setLeft(double left) {
		this.left = left;
	}
	public double getRifht() {
		return right;
	}
	public void setRight(double right) {
		this.right = right;
	}
	public OperatorType getOperator() {
		return operator;
	}
	public void setOperator(OperatorType operator) {
		this.operator = operator;
	}
	
	
	// get메소드를 쓰면 result를 위에서 선언하지 않아도 result를 선언한 것처럼도 사용이 가능함
	public double getResult() {
		return operator.operate(left,right);
	}

	// get메소드를 쓰면 result를 위에서 선언하지 않아도 result를 선언한 것처럼도 사용이 가능함
	public String getExpression() {
		return operator.getExpression(left,right);
	}
	@Override
	public int hashCode() {
		return Objects.hash(left, operator, right);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CalculateVO other = (CalculateVO) obj;
		return Double.doubleToLongBits(left) == Double.doubleToLongBits(other.left) && operator == other.operator
				&& Double.doubleToLongBits(right) == Double.doubleToLongBits(other.right);
	}
	
	@Override
	public String toString() {
		return "CalculateVO [left=" + left + ", right=" + right + ", operator=" + operator + "]";
	}
	
	
}
