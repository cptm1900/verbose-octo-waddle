package kr.or.ddit.props;

import java.io.Serializable;
import java.util.Objects;

/**
 * Domain Layer (Java Bean 규약 적용)
 *
 */
public class PersonVO implements Serializable {		// 직렬화를 위해 serialize
	private transient String id;	// transient : 직렬화에서 제외
	private String name;
	private String gender;
	private String age;
	private String address;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PersonVO other = (PersonVO) obj;
		return Objects.equals(id, other.id);
	}
	
	@Override
	public String toString() {
		return "PersonVO [name=" + name + ", gender=" + gender + ", age=" + age + ", address=" + address + "]";
	}
	
}
