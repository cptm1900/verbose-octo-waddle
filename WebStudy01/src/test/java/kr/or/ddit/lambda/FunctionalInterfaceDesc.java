package kr.or.ddit.lambda;

import java.io.File;
import java.io.FilenameFilter;
import java.util.Arrays;
import java.util.Optional;
import java.util.Random;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Stream;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/**
 * JavaScript
 * 1. 함수(일급함수 또는 일급객체형 함수) : 일급객체 함수가 익명 형태로 자동 생성
 * 			일급 객체란? 참조 주소가 있고, 해당 참조를 변수를 통해 받을 수 있고,
 * 					또다른 함수의 호출 시 아규먼트로 전달할 수 있고, 반환값의 형태로도 활용할 수 있음
 * 	function case1_1(){...}			// 함수 선언식
 * 	let case1_2 = function(){...}	// 함수 표현식
 * 	let case1_3 = ()=>{...}
 * 	(자바는 이렇게 객체가 없는 것을 만들 수 없음)
 * 
 * 2. 메소드
 * 	let obj = {
 * 		case2_1:function(){...}
 * 		, case2_2:()=>{...}
 * 	}
 * 	(객체 안에 존재)
 * 
 * 3. 
 * 	class Component {
 * 		method1() {
 * 			
 * 		}
 * 	}
 * 	let comp = new Component();
 * 	comp.method1(); 형태로 접근
 *
 * JAVA에서 함수형 프로그래밍의 지원
 * 1.8 이전까지는 일급함수가 존재하지 않아서, 익명 객체를 통해 메소드 하나를 구현하고 있는 객체의 형태로 메소드를 전달해야했음
 * 1.8 버전부터 lambda 표현식으로 일급함수를 표현할 수 있음 --> 차후 컴파일시에 익명 객체로 처리됨
 * 일급함수로 표현될 수 있는 익명 객체는 함수형 인터페이스만 가능함.
 * 함수형 인터페이스란? 인터페이스가 단 하나의 추상 메소드만 갖고 있는 경우데 대한 표현
 * 
 * 자주 활용되는 Functional Interface(FI) 타입의 종류
 * 1. 생성형 FI (Supplier) : 인자가 없고, 반환값이 있음
 * 2. 필터링 FI (Predicate) : 하나의 인자가 있고, boolean 반환값
 * 3. 처리형 FI (Function) : 하나의 인자가 있고, 반환값이 있음
 * 4. 소비형 FI (Consumer) : 하나의 인자가 있고, 반환값이 없음(void)
 */
class FunctionalInterfaceDesc {
	
	// 랜덤 숫자 5개 모아서 브랜드 제품 만들기
	Stream<Integer> fiveNumberBranding(Supplier<Integer> oem) {
		Integer[] brand = new Integer[5];
		Arrays.setAll(brand, n->oem.get());
		return Arrays.stream(brand);
	}
	
	@Test
	void testStream() {
		fiveNumberBranding(()->new Random().nextInt())		// 숫자 5개 생성
			.filter(n->n%2==1)		// 홀수 제품만 걸러줌
			.map(n->String.format("%d is odd number",n))	// 자기 브랜드로 택갈이 함
//			.forEach(s->System.out.println(s))
			.forEach(System.out::println);
			// 전달해야되는 파라미터가 1개만 있고 그걸 그대로 함수로 넘기는 경우만 메소드 레퍼런스 사용 가능
	}

	@Disabled
	@Test
	void testLambda() {
		// 1.
		Supplier<Integer> supplier = ()->new Random().nextInt();
		// 반환값이 정수이므로 제네릭에 <Integer> 씀
		
		// 2.
		Predicate<Integer> predicate = n->n%2==1;
		// 반환값은 boolean으로 고정되어있기 때문에 제네릭에 인자의 데이터 형태를 나타내기 위해 <Integer> 씀
		
		// 3.
		Function<Integer,String> function = n->String.format("%d is odd number",n);
		// 인자와 반환값의 제네릭을 전부 씀
		
		// 4.
		Consumer<String> consumer = s->System.out.println(s);
		// 인자의 제네릭을 씀
		
		// FI 제네릭이 헷갈리면 ctrl + spacebar 눌러서 보면 됨
		
		Optional.of(supplier.get())
				.filter(predicate)
				.map(function)
				.ifPresent(consumer);
	}
	
	@Disabled
	@Test
	void test() {
		File folder = new File("D:\\00.medias\\movies");
		folder.list(new FilenameFilter() {
			
			@Override
			public boolean accept(File dir, String name) {
				return false;
			}
		});
		folder.list((d,n)->false);
	}

}

interface NonFI {
	void method1();
	void method2();
}

@FunctionalInterface		// 조건 : 추상 메소드가 1개여야 함, 다른 메소드들은 있어도 됨
interface FICase {
	void method1();
	default void method2() {
		System.out.println("기본 메소드");
	};
}