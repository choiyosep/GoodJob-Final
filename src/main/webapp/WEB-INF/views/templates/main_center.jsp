<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-lg-12">
		<div class="row">
			<h4 class="heading">
				<div class="cta-text">
					<h2>
						<span>GoodJob</span> 추천 기업
					</h2>
				</div>
			</h4>
			<c:forEach items="${postListVO.cmvoList }" var="cmvo" begin="0" end="3">
				<div class="col-lg-3">
					<div class="box" >
						<div class="box-gray aligncenter">
								<div class="icon">
								<h4><a href="user-detailCompanyInfo.do?companyId=${cmvo.companyId}">${cmvo.companyId } 채용</a></h4>
								<a href="user-detailCompanyInfo.do?companyId=${cmvo.companyId}"><img src="/GoodJob/resources/upload/companyLogo/${cmvo.picturePath}" height="100px" width="100px" ></a>
								</div>
								<div style="height: 70px; width: auto">								
								<p>${cmvo.introduction }</p>	
								</div>
						</div>
						<div class="box-bottom">
							<a href="user-detailCompanyInfo.do?companyId=${cmvo.companyId}">기업정보 자세히보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
