<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-lg-12">
		<div class="row">
			<h4 class="heading">
				<div class="cta-text">
					<h2>
						<span>${requestScope.cmvo.companyId }</span> 공고 모두 보기
					</h2>
				</div>
			</h4>	
			
<%--Controller에서 받아온 기업정보리스트를 아래 div 구간에 정보들을 집어 넣고 반복문을 돌려보기  --%>	
			<c:forEach items="${requestScope.jobPostingList}" var="jobList">
			<div class="col-lg-3">
				<div class="box">
					<div class="box-gray aligncenter">
						<div class="icon">					
							<h4><a href="job_posting_detail.do?jobPostingNum=${jobList.jobPostingNum}">${jobList.title}</a></h4>
							<a href="job_posting_detail.do?jobPostingNum=${jobList.jobPostingNum}"><img src="/GoodJob/resources/upload/companyLogo/${requestScope.cmvo.picturePath}" height="100px" width="100px" ></a>
						</div>
						<div style="height: 70px; width: auto">
						<p>${jobList.content}</p>
						</div>						
					</div>
					<div class="box-bottom">
						<a href="job_posting_detail.do?jobPostingNum=${jobList.jobPostingNum}">채용정보 확인하기</a>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</div>
	</div>
</div>