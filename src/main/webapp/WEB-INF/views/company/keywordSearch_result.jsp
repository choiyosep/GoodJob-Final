<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="jobPostingList"
	value="${requestScope.jobPostingList2.jobPostingList}"></c:set>
<c:set var="pb" value="${requestScope.jobPostingList2.pagingBean}"></c:set>
<%--Controller에서 받아온 기업정보리스트를 아래 div 구간에 정보들을 집어 넣고 반복문을 돌려보기  --%>

<c:choose>
	<c:when test="${empty jobPostingList}">
		<div>
			<span align="center">
				<h3>'${requestScope.searchText}' &nbsp;검색 결과가 없습니다.</h3>
			</span>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${jobPostingList}" var="jobList">
			 <div class="col-sm-3 col-md-3 ">
	   <div class="thumbnail">
	      <a  href="job_posting_detail.do?jobPostingNum=${jobList.jobPostingVO.jobPostingNum}"><img src="${pageContext.request.contextPath}/
										resources/upload/companyLogo/${jobList.picturePath }" alt="사진을 불러올 수 없습니다."></a>
	      <div class="caption" style="height: 200px; width: auto;
	    border-bottom-width: 1px;" >
	    	<div style="height: 60px; width: auto">
	        <h4><a  href="job_posting_detail.do?jobPostingNum=${jobList.jobPostingVO.jobPostingNum}">${jobList.jobPostingVO.title}</a></h4>
	        </div>
	        <div style="height: 70px; width: auto">
	        <p>${jobList.jobPostingVO.content}</p>
	        </div>
	       <div style="height: 30px; width: auto">
	        <p align="center"><a href="job_posting_detail.do?jobPostingNum=${jobList.jobPostingVO.jobPostingNum}" 
	        class="btn btn-primary">채용정보 확인하기</a></p>
	        </div>
	      </div>
	    </div>
  </div>
		</c:forEach>
		<div class="col-lg-12">
			<div align="center">
				<ul class="pagination">
					<c:if test="${pb.previousPageGroup }">
						<li><a
							href="${pageContext.request.contextPath}/user-findJobPostingByTitle.do?searchType=${requestScope.searchType}&searchText=${requestScope.searchText}&pageNum=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}" var="pageNum">
						<c:choose>
							<c:when test="${pageNum==pb.nowPage}">
								<li class="active"><a href="#">${pageNum}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/user-findJobPostingByTitle.do?searchType=${requestScope.searchType}&searchText=${requestScope.searchText}&pageNum=${pageNum}">${pageNum}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pb.nextPageGroup }">
						<li><a
							href="${pageContext.request.contextPath}/user-findJobPostingByTitle.do?searchType=${requestScope.searchType}&searchText=${requestScope.searchText}&pageNum=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>

	</c:otherwise>
</c:choose>

