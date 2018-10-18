package join.us.GoodJob.model.service;

import java.util.List;

import join.us.GoodJob.model.vo.NormalMemberVO;
import join.us.GoodJob.model.vo.PortfolioVO;

public interface NormalService {
	
	//개인 회원 가입
	void registerNormalMember(NormalMemberVO normalMemberVO);
	//개인 회원정보 수정
	void updateNormalMember(NormalMemberVO normalMemberVO);
	//개인 회원 탈퇴
	void deleteNormalMember(String normalId);
	//개인 회원 검색
	NormalMemberVO selectNormalMember(String id);
	//181018 MIRI selectNormalMember와 중복으로 주석
	/*//개인 정보 조회
	NormalMemberVO myPageNormalMember(String memberId);*/

	void registerPortfolio(PortfolioVO portfolioVO);
	

	//포트폴리오등록 상세
	PortfolioVO normalDetailPortfolio(String normalId);
	
	/**
	 * 인재검색에 필요한 데이터들
	 * @return
	 */
	//개인, 개인회원  (id,name) 불러오기
	List<NormalMemberVO> idName();
	
	//개인회원  id 를 활용하여 포트폴리오 모든 정보 출력 
	PortfolioVO portFolioVOById(String nomalId); 
}