<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 인재 정보
		</h2>
	</div>
</h4>

<c:forEach items="${requestScope.ivvoList}" var="ivvo">
	<c:set value="${ivvo.normalMemberVO }" var="nmvo" />
	<div class="media">
		<a class="pull-left" href="#">
			<c:forEach items="${requestScope.mapList }" var="map">
				<c:if test="${nmvo.normalId == map.id }">
					<img class="media-object" src="${pageContext.request.contextPath }/resources/upload/memberPicture/${map.picturePath}" width="145px" height="145px">
				</c:if>
			</c:forEach>
		</a>
		<div class="media-body">
			<h4 class="media-heading">${nmvo.name}</h4>
			<h5>${ivvo.title}</h5>
			<h6>${ivvo.content}</h6>
			<!-- Nested media object -->
			<div class="media-object">
				<c:forEach items="${requestScope.mapList }" var="map">
					<c:if test="${nmvo.normalId == map.id && !empty map.dcnameList }">
						개발분야 : <c:out value="${map.dcnameList }" />
					</c:if>
				</c:forEach>
				<br><a href="normalDetailPortfolio.do?normalId=${nmvo.normalId }"> 인재 상세보기 </a>
			</div>
		</div>
	</div>
	<hr>
</c:forEach>

<div align="center">
	<ul class="pagination">
		<c:set value="${requestScope.plvo.pagingBean }" var="pagingBean"></c:set>
		<c:if test="${pagingBean.previousPageGroup }">
			<li><a href="${pageContext.request.contextPath}/getJobPostingInterviewerList.do?jobPostingNum=${requestScope.jobPostingNum }&pageNum=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
			<c:choose>
				<c:when test="${pageNum == pagingBean.nowPage}">
					<li class="active"><a href="#">${pageNum}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/getJobPostingInterviewerList.do?jobPostingNum=${requestScope.jobPostingNum }&pageNum=${pageNum}">${pageNum}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>				
		<c:if test="${pagingBean.nextPageGroup }">
			<li><a href="${pageContext.request.contextPath}/getJobPostingInterviewerList.do?jobPostingNum=${requestScope.jobPostingNum }&pageNum=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>	