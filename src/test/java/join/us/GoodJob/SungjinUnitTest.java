package join.us.GoodJob;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.vo.QuestionAnswerVO;
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
		String normalId="hsj";
		System.out.println(normalMapper.getMyInterviewList(normalId));
	}
}
