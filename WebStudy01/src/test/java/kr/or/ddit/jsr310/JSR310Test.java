package kr.or.ddit.jsr310;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.Date;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class JSR310Test {
	@Test
	void testJsr310(){
		// GMT 표준 시간대 사용, immutable(불변) 객체
		LocalDateTime ldt = LocalDateTime.now(ZoneId.of("America/New_York"));
//		LocalDateTime ldt = LocalDateTime.now();
		System.out.println(ldt);
//		LocalDate ld = LocalDate.now();
		LocalDate ld = LocalDate.from(ldt);		// ldt에서 LocalDate값 추출
		System.out.println(ld);
		System.out.println(ld.getMonthValue());
		YearMonth ym = YearMonth.now();
		System.out.println(ym);
//		Year year = Year.now();
		Year year = Year.from(ldt);		// ldt에서 year값 추출
		System.out.println(year);
		System.out.println(year.minusYears(1));		// 시간 자체를 변경하는게 아니라 계산한 값을 새로운 객체로 만듦
		System.out.println(year.plusYears(1));
	}
	
	// 테스트 케이스는 일반적으로 파라미터를 받지 않고 리턴 값은 void
	// 커서를 메소드 하나에 놓고 실행하면 그 메소드 하나만 실행할 수 있음
	// 또는 실행하지 않을 케이스에 @Disabled를 쓰거나 @Test를 주석처리하면 됨
	@Disabled
	@Test
	void testDate(){
		Date today = new Date();
		System.out.printf("month : %d\n", today.getMonth());	// 1월이 0으로 나옴
		today.setYear(2023);	// 시간을 임의로 변경이 가능함
//		unix time, epoch time : 기준 시점을 정해두고(1970년1월1일) 경과된 밀리세컨드로 시간 계산
	}

//	@Test
	void test() {
		System.out.println("테스트 케이스 실행");
	}

}
