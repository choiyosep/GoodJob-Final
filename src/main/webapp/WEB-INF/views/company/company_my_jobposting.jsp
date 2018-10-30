<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath }/resources/css/jobposting.css" rel="stylesheet">

<div class="container mt-40">
	<div class="row mt-30">
		<c:forEach items="${requestScope.postListVO.jobPostingList}" var="cmvo">
			<div class="col-md-4 col-sm-6">
				<div class="box12">
					<img src="http://bestjquery.com/tutorial/hover-effect/demo133/images/img-1.jpg">
					<div class="box-content">
						<h3 class="title">${cmvo.jobPostingVO.title}</h3>
						<ul class="icon">
							<li><a href="#">상세보기</a></li>
							<li><a href="#">수정/삭제</a></li>
							<li><a href="#">면접신청자</a></li>
							<li><a href="#">질의응답</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

