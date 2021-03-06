package join.us.GoodJob.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.vo.InterviewVO;
import join.us.GoodJob.model.vo.JobPostingVO;
import join.us.GoodJob.model.vo.NormalMemberVO;
import join.us.GoodJob.model.vo.PortfolioVO;
import join.us.GoodJob.model.vo.PostListVO;
import join.us.GoodJob.model.vo.QuestionAnswerVO;

@Service
public class NormalServiceImpl implements NormalService {
	@Resource
	NormalMapper normalMapper;

	@Override
	public void registerNormalMember(NormalMemberVO normalMemberVO) {
		normalMapper.registerMember(normalMemberVO);
		normalMapper.registerNormalMember(normalMemberVO);
	}

	@Override
	public void updateNormalMember(NormalMemberVO normalMemberVO) {
		normalMapper.updateNormalMember(normalMemberVO);
		normalMapper.updateMember(normalMemberVO);
	}

	@Override
	public NormalMemberVO selectNormalMember(String normalId) {
		return normalMapper.selectNormalMember(normalId);
	}

	// 181018 MIRI 일반회원, 기업회원 회원탈퇴 공통으로 묶음
	/*
	 * @Override public void deleteNormalMember(String normalId) {
	 * normalMapper.deleteNormalMember(normalId); }
	 */

	// 181018 MIRI selectNormalMember와 중복으로 주석
	/*
	 * @Override public NormalMemberVO myPageNormalMember(String memberId) { return
	 * normalMapper.myPageNormalMember(memberId); }
	 */

	@Override
	// 181019 MIRI 포트폴리오 등록/수정 동시에 활용하기위해 flag를 줌
	public void registerPortfolio(PortfolioVO portfolioVO, boolean registerFlag) {
		System.out.println(portfolioVO);

		// 포트폴리오 등록(PORTFOLIO)
		if (registerFlag == true) // flag가 true일 경우에만 포트폴리오 등록
			normalMapper.insertPortfolio(portfolioVO);

		// 포트폴리오 분류 등록 시작
		Map<String, String> map = new HashMap<String, String>();
		map.put("normalId", portfolioVO.getNormalId());

		// 포트폴리오 파일 업로드, 파일경로등록(PORTFOLIO_FILE)

		List<MultipartFile> fileList = portfolioVO.getFileList();
		String workspaceUploadPath = "C:\\java-kosta\\framework-workspace2\\goodjob\\src\\main\\webapp\\resources\\upload\\memberPortfolio\\";

		// 181023 MIRI 수정폼에 포트폴리오 파일 업로드 없어서 NullPointError 발생, 포트폴리오 수정시 포트폴리오 파일 업로드
		// 안해도 수정 되게끔 조건문 추가
		// if(fileList != null) {
		for (MultipartFile currentMultipartFile : fileList) {
			if (currentMultipartFile.getSize() != 0) { // 파일이 있으면
				File file = new File(workspaceUploadPath + currentMultipartFile.getOriginalFilename());
				try {
					currentMultipartFile.transferTo(file);
					map.put("filePath", currentMultipartFile.getOriginalFilename());
					normalMapper.insertPortfolioFile(map);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				;
			}
		}
		// }

		// 포트폴리오 학력 분류 등록(PORTFOLIO_ACADEMIC)
		for (String academicNum : portfolioVO.getAcaCatNumList()) {
			map.put("academicNum", academicNum);
			normalMapper.insertPortfolioAcademic(map);
		}

		// 포트폴리오 개발분야 분류 등록(PORTFOLIO_DEV)
		for (String devCatNum : portfolioVO.getDevCatNumList()) {
			map.put("devCatNum", devCatNum);
			normalMapper.insertPortfolioDev(map);
		}

		// 포트폴리오 고용형태 분류 등록(PORTFOLIO_EMP)
		for (String empTypeNum : portfolioVO.getEmpTypeCatNumList()) {
			map.put("empTypeNum", empTypeNum);
			normalMapper.insertPortfolioEmp(map);
		}

		// 포트폴리오 지역 분류 등록(PORTFOLIO_LOC)
		for (String locNum : portfolioVO.getLocCatNumList()) {
			map.put("locNum", locNum);
			normalMapper.insertPortfolioLoc(map);
		}
		// 포트폴리오 모집직군 분류 등록(PORTFOLIO_RECRUITMENT)
		for (String rcNum : portfolioVO.getRecruitCatNumList()) {
			map.put("rcNum", rcNum);
			normalMapper.insertPortfolioRecuitment(map);
		}
	}

	public PortfolioVO normalDetailPortfolio(String normalId) {
		// 181025 yosep 포트폴리오 파일 경로 추가
		return normalMapper.normalDetailPortfolio(normalId);
	}

	@Override
	public List<NormalMemberVO> AllFindNomarMember() {
		return normalMapper.AllFindNomarMember();
	}

	@Override
	public PortfolioVO portFolioVOById(String nomalId) {
		return normalMapper.portFolioVOById(nomalId);
	}

	// 181019 MIRI normalDetailPortfolio와 중복되어 주석
	/*
	 * @Override public List<PortfolioVO> normalDetailPortfolioList(String normalId)
	 * { return normalMapper.normalDetailPortfolioList(normalId); }
	 */
	@Override
	public void deletePortfolio(String id) {
		normalMapper.deletePortfolio(id);
	}

	@Override
	public void updatePortfolio(PortfolioVO portfolioVO) {
		normalMapper.updatePortfolio(portfolioVO);
	}

	@Override
	public void deletePortfolioMulti(String normalId) {
		normalMapper.deletePortfolioMulti(normalId);
	}

	@Override
	public List<String> portfolioSearchList(PortfolioVO portfolioVO) {
		
		return normalMapper.portfolioSearchList(portfolioVO);
	}

	@Override
	public void interviewApply(InterviewVO interviewVO) {
		normalMapper.interviewApply(interviewVO);
	}

	// 구직자가 구인공고에 QNA 등록 - 성진수정
	@Override
	public void registerQuestion(QuestionAnswerVO questionAnswerVO) {
			normalMapper.registerQuestion(questionAnswerVO);
		}
	// 구직자가 구인공고에 등록한 QNA 조회하기
	@Override
	public List<QuestionAnswerVO> getMyQuestionList(QuestionAnswerVO qavo) {
		return normalMapper.getMyQuestionList(qavo);
	}

	@Override
	public PostListVO portfolioAllListAndPagingProcess(String pageNum, int postCountPerPage) {

		PagingBean pagingBean;
		int totalPostCount = normalMapper.getAllMemberListCount();
		if (pageNum != null) { // 페이지 번호 주면
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNum));
		} else { // 페이지 번호 안주면 1페이지
			pagingBean = new PagingBean(totalPostCount);
		}
		pagingBean.setPostCountPerPage(postCountPerPage);
		// normalMember list 아이디, 이름만 찾음.
		List<NormalMemberVO> nmList = normalMapper.getNormalMemberId(pagingBean);
		PostListVO postListVO = new PostListVO();
		postListVO.setNmList(nmList);
		postListVO.setPagingBean(pagingBean);
		return postListVO;
	}

	@Override
	public List<PortfolioVO> getNormalMember(String pageNum) {
		PagingBean pagingBean;
		int totalPostCount = normalMapper.getAllMemberListCount();
		if (pageNum != null) { // 페이지 번호 주면
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNum));
		} else { // 페이지 번호 안주면 1페이지
			pagingBean = new PagingBean(totalPostCount);
		}
		List<PortfolioVO> pvo = normalMapper.getNormalMember(pagingBean);
		return pvo;
	}

	@Override
	public String getPicturePath(String normalId) {
		return normalMapper.getPicturePath(normalId);
	}

	@Override
	public void portfolioFileDelete(String normalId) {		
			List<String> portfolioFileNameList= normalMapper.getPortfolioFileNameListById(normalId);
			for(String currentFileName : portfolioFileNameList) {
				String workspaceDeletePath="C:/java-kosta/framework-workspace2/goodjob/src/main/webapp/resources/upload/memberPortfolio/"+currentFileName;
				File deleteWorkspaceFile = new File(workspaceDeletePath);
				try {
					deleteWorkspaceFile.delete();
					System.out.println(currentFileName+"  포트폴리오 파일 삭제 완료");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				}
			}
		}

	@Override
	public List<InterviewVO> getMyInterviewList(String normalId) {
		return normalMapper.getMyInterviewList(normalId);
	}

	@Override
	public void deleteQAToQuestion(String QANum) {
		normalMapper.deleteQAToQuestion(QANum);
	}

	@Override
	public void updateQAToQuestion(QuestionAnswerVO qavo) {
		normalMapper.updateQAToQuestion(qavo);
	}
	
	@Override
	public List<String> checkContent(String interviewNum) {
		System.out.println(interviewNum);
		return normalMapper.checkContent(interviewNum);
	}

	@Override
	public void deleteInterview(String interviewNum) {
		normalMapper.deleteInterview(interviewNum);
	}

	@Override
	public void updateInterview(InterviewVO interviewVO) {
		normalMapper.updateInterview(interviewVO);
	}

	@Override
	public InterviewVO getInterviewbyInterviewNum(String interviewNum) {
		return normalMapper.getInterviewbyInterviewNum(interviewNum);
	}

	@Override
	public List<JobPostingVO> getMyQuestionListBynormalId(String id) {
		List<JobPostingVO> jobPostingVOList = new  ArrayList<JobPostingVO>();
		List<String> jobPostingNumList = normalMapper.getJopPostingNumListByNormalId(id);
		
		for(String jobPostingNum:jobPostingNumList) {
			JobPostingVO jpvo= normalMapper.getJobPostingInfoByJobPostingNum(jobPostingNum);
			QuestionAnswerVO qavo = new QuestionAnswerVO();
			qavo.setNormalId(id);
			qavo.setJobPostingNum(jobPostingNum);
			
			List<QuestionAnswerVO> questionAnswerVOList = normalMapper.getMyQuestionListByNormalIdAndJobPostingNum(qavo);
			jpvo.setQuestionAnswerVOList(questionAnswerVOList);
			jobPostingVOList.add(jpvo);
		}		
		return jobPostingVOList;
	}
}
