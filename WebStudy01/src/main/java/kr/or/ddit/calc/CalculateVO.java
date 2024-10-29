package kr.or.ddit.calc;

import java.io.Serializable;
import java.util.Objects;

/**
 * VO(ValueObject), DTO(Data Tranfer Object), JavaBean
 * 
 * 1. 값을 저장할 수 있는 property 정의
 * 	property : java bean 규칙에 따라 정의된 field
 * 2. property에 대해 캡슐화
 * 3. 캡슐화된 property에 접근할 수 있는 메소드 제공 (gettr / setter)
 * 		get[set]+propertyname ==> camel case
 * 4. jsva  bean = 객체에 대한 상태 비교 방법 제공 : equals 재정의
 * 5. 상태를 확인할 수 있는 방법 제공 : toStirng 재정의 
 * 6. 직렬화 가능 객체 표현
 *
 **/
public class CalculateVO implements Serializable {	// 직렬화를 하려면 필요함
	private double left;	// getLeft, setLeft
	private double right;
	private OperatorType operator;
	
	public double getLeft() {
		return left;
	}
	public void setLeft(double left) {
		this.left = left;
	}
	public double getRight() {
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
