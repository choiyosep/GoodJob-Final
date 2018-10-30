package join.us.GoodJob;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.mapper.ManagerMapper;
import join.us.GoodJob.model.mapper.MemberMapper;
import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.vo.CompanyMemberVO;
import join.us.GoodJob.model.vo.DevCatVO;
import join.us.GoodJob.model.vo.JobPostingVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class MiriUnitTest {
	@Autowired
	NormalMapper normalMapper;
	@Autowired
	CompanyMapper companyMapper;
	@Autowired
	ManagerMapper managerMapper;
	@Autowired
	MemberMapper memberMapper;	
	
	@Test
	public void test() {
		CompanyMemberVO cmvo = companyMapper.myPageCompanyMember("NHNuser");
		System.out.println(cmvo.getPicturePath());
		/*for (JobPostingVO vo : jpvoList) {
			System.out.println(vo);
		}*/
	}
}
