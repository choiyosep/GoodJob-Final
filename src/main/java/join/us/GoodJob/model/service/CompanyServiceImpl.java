package join.us.GoodJob.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.vo.CompanyMemberVO;
import join.us.GoodJob.model.vo.JobPostingVO;

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

	@Override
	public void deleteCompanyMember(String companyId) {
	}
	
	@Override
	public CompanyMemberVO myPageCompanyMember(String companyId) {
		return companyMapper.myPageCompanyMember(companyId);
		
	}

	@Override
	public JobPostingVO jobPostingDetail(String companyNum) {	
		return companyMapper.jobPostringDetail(companyNum);
	}

}
