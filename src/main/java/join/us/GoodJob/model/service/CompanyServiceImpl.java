package join.us.GoodJob.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.vo.CompanyMemberVO;
import join.us.GoodJob.model.vo.JobPostingVO;
import join.us.GoodJob.model.vo.MemberVO;
import join.us.GoodJob.model.vo.NormalMemberVO;
import join.us.GoodJob.model.vo.PostListVO;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Resource	
	CompanyMapper companyMapper;

	@Override
	public void registerCompanyMember(CompanyMemberVO companyMemberVO) {
		companyMapper.registerMember(companyMemberVO);
		companyMapper.registerCompanyMember(companyMemberVO);
	}
	
	@Override
	public CompanyMemberVO selectCompanyMember(String id) {
		return companyMapper.selectCompanyMember(id);
	}

	@Override
	public void updateCompanyMember(CompanyMemberVO companyMemberVO) {
		companyMapper.updateCompanyMember(companyMemberVO);
		companyMapper.updateMember(companyMemberVO);
	}

	//181018 MIRI 일반회원, 기업회원 회원탈퇴 공통으로 묶음
	/*@Override
	public void deleteCompanyMember(String companyId) {
	}*/
	
	@Override
	public CompanyMemberVO myPageCompanyMember(String companyId) {
		return companyMapper.myPageCompanyMember(companyId);
		
	}

	@Override
	public NormalMemberVO memberSearch() {
		return null;
	}

	public PostListVO getAllCompanyList(String pageNum) {
		PagingBean pagingBean;
		//기업정보 게시물 수 가져오기
		int totalPostCount = companyMapper.getAllCompanyListCount();
		if(pageNum!=null) { //페이지 번호 주면
			pagingBean=new PagingBean(totalPostCount, Integer.parseInt(pageNum));			
		}else { //페이지 번호 안주면 1페이지
			pagingBean = new PagingBean(totalPostCount);
		}
		List<MemberVO> cmvoList= companyMapper.getAllCompanyList(pagingBean);				
		PostListVO postListVO = new PostListVO();
		postListVO.setPagingBean(pagingBean);
		postListVO.setCmvoList(cmvoList);		
		return postListVO;
	}

	@Override
	public CompanyMemberVO detailCompanyInfo(String companyId) {
		return companyMapper.detailCompanyInfo(companyId);
	}

	public CompanyMemberVO jobPostingDetail(String jobPostingNum) {	
		return companyMapper.jobPostringDetail(jobPostingNum);
	}

	@Override
	public List<JobPostingVO> companyJobPostingList(String companyId) {
		
		return companyMapper.companyJobPostingList(companyId);
	}

	@Override
	public List<CompanyMemberVO> getAllJobPostingList() {
		
		return companyMapper.getAllJobPostingList();
	}

	@Override
	public List<String> findJobPostingByCatNumList(Map map) {
		return companyMapper.findJobPostingByCatNumList(map);
	}
	
}
