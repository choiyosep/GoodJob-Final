package join.us.GoodJob.model.service;

import java.util.List;

import join.us.GoodJob.model.vo.InterviewVO;
import join.us.GoodJob.model.vo.JobPostingVO;
import join.us.GoodJob.model.vo.NormalMemberVO;
import join.us.GoodJob.model.vo.PortfolioVO;
import join.us.GoodJob.model.vo.PostListVO;
import join.us.GoodJob.model.vo.QuestionAnswerVO;


public interface NormalService {
	
	//개인 회원 가입
	void registerNormalMember(NormalMemberVO normalMemberVO);
	//개인 회원정보 수정
	void updateNormalMember(NormalMemberVO normalMemberVO);
	//181018 MIRI 일반회원, 기업회원 회원탈퇴 공통으로 묶음
	/*//개인 회원 탈퇴
	void deleteNormalMember(String normalId);*/
	//개인 회원 검색
	NormalMemberVO selectNormalMember(String normalId);
	//181018 MIRI selectNormalMember와 중복으로 주석
	/*//개인 정보 조회
	NormalMemberVO myPageNormalMember(String memberId);*/
	//포트폴리오 등록
	//181019 MIRI 포트폴리오 등록/수정 동시에 활용하기위해 flag를 줌
	void registerPortfolio(PortfolioVO portfolioVO, boolean registerFlag);
	

	//포트폴리오등록 상세
	PortfolioVO normalDetailPortfolio(String normalId);
	//181019 MIRI normalDetailPortfolio와 중복되어 주석
	//List<PortfolioVO> normalDetailPortfolioList(String normalId);
	
	//개인회원 모든 정보 받아오기 철우 건들지 말아주세요. 
	List<NormalMemberVO> AllFindNomarMember();
	//인재검색에서 조건별 검색 후, 검색결과 출력 service
	List<String> portfolioSearchList(PortfolioVO portfolioVO);
	
	//개인회원  id 를 활용하여 포트폴리오 모든 정보 출력 
	PortfolioVO portFolioVOById(String nomalId);
	//181018 MIRI 포트폴리오 삭제
	void deletePortfolio(String id);
	//181019 MIRI 포트폴리오 수정
	void updatePortfolio(PortfolioVO portfolioVO);
	//181019 MIRI 포트폴리오 삭제(portfolio_dev, portfolio_recruitment, portfolio_emp, portfolio_loc, portfolio_academic)
	void deletePortfolioMulti(String normalId);
	
	void interviewApply(InterviewVO interviewVO);
	//1023 Cherwoo 
	//포트폴리오 normalMember 리스트와  페이징처리 처리 
	PostListVO portfolioAllListAndPagingProcess(String pageNum, int postCountPerPage );
	
	//질의응답 질문 등록
	void registerQuestion(QuestionAnswerVO qavo);
	
	//질의응답 나의 질문 리스트
	List<QuestionAnswerVO> getMyQuestionList(QuestionAnswerVO qavo);
	
	List<PortfolioVO> getNormalMember(String pageNum);
	String getPicturePath(String normalId);
	void portfolioFileDelete(String normalId);
	
	// 구직자가 면접신청한 구인공고 리스트
	List<InterviewVO> getMyInterviewList(String normalId);
	
	//181022 MIRI Q&A 질문&답변 삭제
	void deleteQAToQuestion(String QANum);
	
	//181030 MIRI Q&A 질문 수정
	void updateQAToQuestion(QuestionAnswerVO qavo);

	// 구직자가 면접신창한 구인공고 리스트에서 내용 확인
	List<String> checkContent(String interviewNum);
	//면접 신청 삭제
	void deleteInterview(String interviewNum);
	//면접 신청 수정
	void updateInterview(InterviewVO interviewVO);
	//면접 제목, 내용 불러오기
	InterviewVO getInterviewbyInterviewNum(String interviewNum);
	
	//나의 질문리스트 불러오기
	List<JobPostingVO> getMyQuestionListBynormalId(String id);
}
