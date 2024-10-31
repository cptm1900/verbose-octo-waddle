package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Decorating Filter Pattern : 어플리케이션에 대한 부가 기능을 구현할때 사용됨
 * 1. Fileter 구현체 정의
 * 2. 컨테이너에 등록
 * 3. 요청과의 매핑 설정
 *
 */
public class DummyFilter implements Filter{		// Filter 상속 받아야됨

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.printf("%s 필터 초기화 \n", this.getClass());
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// request pre filter (전처리)
		System.out.println("-------------------- request pre fileter --------------------");
		chain.doFilter(request, response);	// ----
		// response post filter (후처리)
		System.out.println("-------------------- response pre fileter --------------------");
		
	}

	@Override
	public void destroy() {
		System.out.printf("%d 필터 소멸 \n", this.getClass());
	}

}
