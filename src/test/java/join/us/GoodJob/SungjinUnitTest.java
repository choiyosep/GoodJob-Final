package join.us.GoodJob;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.vo.JobPostingVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class SungjinUnitTest {
	/*@Autowired
	CompanyService companyService;
*/
	@Autowired
	NormalMapper normalMapper;
	
	/*@Autowired
	MemberMapper memberMapper;
	@Autowired
	ManagerMapper managerMapper;*/
	@Autowired
	CompanyMapper companyMapper;
	@Test
	public void test() {
		int jobPostingNum=1002;
		String keywordName="복리후생좋습니다";
		JobPostingVO jobPostingVO=new JobPostingVO();
		jobPostingVO.setJobPostingNum(jobPostingNum);
		jobPostingVO.setKeywordName(keywordName);
		
		companyMapper.insertKeyword(jobPostingVO);
	}
}
