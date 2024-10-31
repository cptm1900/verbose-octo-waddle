package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 회원관리용 Domain Layer
 *
 */
@Getter
@Setter
@EqualsAndHashCode(of = {"memId", "memRegno1", "memRegno2"})
@ToString
public class MemberVO implements Serializable {
//	private String mem_id;	// 스네이크 표기방식은 db에서 사용하지만 자바에서는 사용하지 않음
//	private String memId;	// 카멜 표기법
	
	private String memId;
	@ToString.Exclude
	private transient String memPass;
	private String memName;
	@ToString.Exclude
	private transient String memRegno1;
	@ToString.Exclude
	private transient String memRegno2;
	private LocalDate memBir;
	private String memZip;
	private String memAdd1;
	private String memAdd2;
	private String memHometel;
	private String memComtel;
	private String memHp;
	private String memMail;
	private String memJob;
	private String memLike;
	private String memMemorial;
	private LocalDate memMemorialday;
	private Long memMileage;
	private String memDelete;
}
