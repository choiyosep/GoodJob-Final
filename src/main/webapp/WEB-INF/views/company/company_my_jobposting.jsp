<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	var companyId="${requestScope.cmvo.companyId}";
	var jobPostingNum="${jobPostingNum }";
	$("#interviewBtn").click(function(){
	    $.ajax({
		type:"get",
		url:"JobPostingInterviewerList.do",
		data:"companyId="+companyId+"jobPostingNum="+jobPostingNum,
		success:function(result) {
		 	if(result=="asd"){
				alert("면접 신청자가 없습니다")
				return false;
			}else{
				location.href = "getJobPostingInterviewerList.do?jobPostingNum="+jobPostingNum;
			} 
		}//success
		});//ajax  
	});//click
});//ready
</script>

<link href="${pageContext.request.contextPath }/resources/css/jobposting.css" rel="stylesheet">

<div class="container mt-40">
	<div class="row mt-30">
		<c:forEach items="${requestScope.jobPostingList}" var="jpvo">
			<div class="col-md-4 col-sm-6">
				<div class="box14">
					<img src="/GoodJob/resources/upload/companyLogo/${requestScope.cmvo.picturePath }" alt="">
					<div class="box-content">
						<h3 class="title">${jpvo.title}</h3><br>
						<c:set value="${jpvo.jobPostingNum }" var="jobPostingNum"/>
						<c:if test="${sessionScope.mvo.id == jpvo.companyId}">
                        <ul class="icon">
							<li><a href="job_posting_detail.do?jobPostingNum=${jobPostingNum }">상세보기</a> &nbsp;&nbsp;&nbsp;
							<a href="updateJobPostingForm.do?jobPostingNum=${jobPostingNum }">수정/삭제</a></li><br>
							<li><a href="getJobPostingInterviewerList.do?jobPostingNum=${jobPostingNum }" id="interviewBtn">면접신청자</a>&nbsp;&nbsp;&nbsp;
							<a href="getJobPostingQAList.do?jobPostingNum=${jobPostingNum }">질의응답</a></li>
                        </ul>
                        </c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

