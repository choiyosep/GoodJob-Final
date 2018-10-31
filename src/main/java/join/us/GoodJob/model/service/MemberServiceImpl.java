package join.us.GoodJob.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import join.us.GoodJob.model.mapper.MemberMapper;
import join.us.GoodJob.model.vo.AcaCatVO;
import join.us.GoodJob.model.vo.CompanyMemberVO;
import join.us.GoodJob.model.vo.CompanySearchParamVO;
import join.us.GoodJob.model.vo.DevCatVO;
import join.us.GoodJob.model.vo.EmpTypeCatVO;
import join.us.GoodJob.model.vo.LocCatVO;
import join.us.GoodJob.model.vo.MemberVO;
import join.us.GoodJob.model.vo.PostListVO;
import join.us.GoodJob.model.vo.RecruitCatVO;

@Service
public class MemberServiceImpl implements MemberService {
	private String workspaceUploadPath;
	private String workspaceDeletePath;
	
	@Resource
	MemberMapper memberMapper;

	@Override
	public MemberVO loginMember(MemberVO memberVO) {
		return memberMapper.loginMember(memberVO);
	}

	@Override
	public int checkMemberId(String id) {
		return memberMapper.checkMemberId(id);
	}
	
	@Override
	public void deleteMember(String normalId) {
		memberMapper.deleteMember(normalId);
	}

	@Override
	public List<RecruitCatVO> getRecruitCatVOList() {
		return memberMapper.getRecruitCatVOList();
	}

	@Override
	public List<DevCatVO> getDevCatVOListByrcNum(String rcNum) {
		return memberMapper.getDevCatVOListByrcNum(rcNum);
	}

	@Override
	public List<EmpTypeCatVO> getEmpTypeCatVOList() {
		return memberMapper.getEmpTypeCatVOList();
	}

	@Override
	public List<LocCatVO> getLocCatVOList() {
		return memberMapper.getLocCatVOList();
	}

	@Override
	public List<AcaCatVO> getAcaCatVOList() {
		return memberMapper.getAcaCatVOList();
	}

	@Override
	public List<DevCatVO> getDevCatVOListByNum(String jobPostingNum) {
		return memberMapper.getDevCatVOListByNum(jobPostingNum);
	}

	@Override
	public List<LocCatVO> getLocCatVOListByNum(String jobPostingNum) {
		return memberMapper.getLocCatVOListByNum(jobPostingNum);
	}

	@Override
	public List<RecruitCatVO> getRecruitCatVOListByNum(String jobPostingNum) {
		return memberMapper.getRecruitCatVOListByNum(jobPostingNum);
	}

	@Override
	public List<AcaCatVO> getAcaCatVOListByNum(String jobPostingNum) {
		return memberMapper.getAcaCatVOListByNum(jobPostingNum);
	}

	@Override
	public List<EmpTypeCatVO> getEmpCatVOListByNum(String jobPostingNum) {
		return memberMapper.getEmpCatVOListByNum(jobPostingNum);
	}

	@Override
	public List<DevCatVO> getDevCatVOListByNormalId(String normalId) {
		return memberMapper.getDevCatVOListByNormalId(normalId);
	}

	@Override
	public List<LocCatVO> getLocCatVOListByNormalId(String normalId) {
		return memberMapper.getLocCatVOListByNormalId(normalId);
	}

	@Override
	public List<RecruitCatVO> getRecruitCatVOListByNormalId(String normalId) {
		return memberMapper.getRecruitCatVOListByNormalId(normalId);
	}

	@Override
	public List<AcaCatVO> getAcaCatVOListByNormalId(String normalId) {
		return memberMapper.getAcaCatVOListByNormalId(normalId);
	}

	@Override
	public List<EmpTypeCatVO> getEmpCatVOListByNormalId(String normalId) {
		return memberMapper.getEmpCatVOListByNormalId(normalId);
	}
	
	@Override
	public void pictureUpload(String member, MultipartFile uploadPicture,HttpServletRequest request) {
		if(member.equals("normal"))
			workspaceUploadPath="C:\\java-kosta\\framework-workspace2\\goodjob\\src\\main\\webapp\\resources\\upload\\memberPicture\\";
		else if(member.equals("company"))
			workspaceUploadPath="C:\\java-kosta\\framework-workspace2\\goodjob\\src\\main\\webapp\\resources\\upload\\companyLogo\\";
		System.out.println("업로드 경로:"+workspaceUploadPath);
		
		if(uploadPicture.isEmpty()==false) {
			System.out.println("파일명:"+uploadPicture.getOriginalFilename());
			File uploadWorkspaceFile=new File(workspaceUploadPath+uploadPicture.getOriginalFilename());
			try {
				if(uploadWorkspaceFile.exists())
					uploadWorkspaceFile.delete();
				
				uploadPicture.transferTo(uploadWorkspaceFile);
				System.out.println("성공");
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void pictureDelete(String member, String deletePicturename) {
		if(member.equals("normal"))
			workspaceDeletePath="C:/java-kosta/framework-workspace2/goodjob/src/main/webapp/resources/upload/memberPicture/"+deletePicturename;
		else if(member.equals("company"))
			workspaceDeletePath="C:/java-kosta/framework-workspace2/goodjob/src/main/webapp/resources/upload/companyLogo/"+deletePicturename;
		
		if (!deletePicturename.isEmpty()) {
			File deleteWorkspaceFile = new File(workspaceDeletePath);
			
			try {
				deleteWorkspaceFile.delete();
				System.out.println(deletePicturename+"  사진 삭제 완료");
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public PostListVO findcompanySearchList(CompanySearchParamVO companySearchParamVO, String pageNum) {
		PagingBean pagingBean;
		PostListVO postListVO = new PostListVO();

	      //총 게시물 수
	      int totalCount=memberMapper.getDetailCompanyListCount(companySearchParamVO);
			if (pageNum != null) { // 페이지 번호 주면
				pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNum));
			} else { // 페이지 번호 안주면 1페이지
				pagingBean = new PagingBean(totalCount);
			} 	      
			
			pagingBean.setPostCountPerPage(1);
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("pagingBean", pagingBean);
			map.put("companySearchParamVO", companySearchParamVO);
		
			
			List<MemberVO> cmvoList =memberMapper.getDetailCompanyList(map);
			postListVO.setCmvoList(cmvoList);
			postListVO.setPagingBean(pagingBean);	      
	      return postListVO;
	}

	
}
