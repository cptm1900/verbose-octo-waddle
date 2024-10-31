package kr.or.ddit.member.service;

import kr.or.ddit.vo.MemberVO;

/**
 * 인증 시스템용 business logic layer
 *
 */
public interface AuthenticateService {
	/**
	 * 인증 여부 판단
	 * @param inputData : 입려된 아이디와 비밀번호
	 * @return 인증 성공시 인증된 사용자의 나머지 정볼르 가진 객체 반환
	 * 		   인증 실패시 null 반환(차후 변경)
	 */
	public MemberVO authenticate(MemberVO inputData);
}
