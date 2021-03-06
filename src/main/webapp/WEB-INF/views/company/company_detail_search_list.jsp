<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="jobPostingList" value="${postListVO.jobPostingList}"/>
<c:set var="pb" value="${postListVO.pagingBean}"/>

<%--Controller에서 받아온 기업정보리스트를 아래 div 구간에 정보들을 집어 넣고 반복문을 돌려보기  --%>	
			<c:choose>
				<c:when test="${empty jobPostingList}">
					<span align="center">		
						<h3>검색 결과가 없습니다.</h3>
					</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${jobPostingList}" var="cmvo">
						<div class="col-lg-3">
							<%-- <div class="box">
								<div class="box-gray aligncenter">
									<div class="icon">
									<h4><a href="job_posting_detail.do?jobPostingNum=${cmvo.jobPostingVO.jobPostingNum}">${cmvo.jobPostingVO.title}</a></h4>
										<a href="job_posting_detail.do?jobPostingNum=${cmvo.jobPostingVO.jobPostingNum}"><img height="100px" width="100px" src="/GoodJob/resources/upload/companyLogo/${cmvo.picturePath}"></a>
									</div>
									<p>${cmvo.jobPostingVO.content }</p>
			
								</div>
								<div class="box-bottom">
									<a href="job_posting_detail.do?jobPostingNum=${cmvo.jobPostingVO.jobPostingNum}">채용정보 확인하기</a>
								</div>
							</div>	 --%>						
							
							<div class="thumbnail">
						      <a href="job_posting_detail.do?jobPostingNum=${cmvo.jobPostingVO.jobPostingNum}"><img src="/GoodJob/resources/upload/companyLogo/${cmvo.picturePath}" ></a>
						      <div class="caption" style="height: 200px; width: auto;
						    border-bottom-width: 1px;">
						    	<div style="height: 60px; width: auto">
						        <h4><a href="job_posting_detail.do?jobPostingNum=${cmvo.jobPostingVO.jobPostingNum}">${cmvo.jobPostingVO.title}</a></h4>
						        </div>
						        <div style="height: 70px; width: auto">
						        <p>${cmvo.jobPostingVO.content }</p>
						        </div>
						       <div style="height: 30px; width: auto">
						        <p align="center"><a href="job_posting_detail.do?jobPostingNum=${cmvo.jobPostingVO.jobPostingNum}" class="btn btn-primary">채용정보 확인하기</a></p>
						        </div>
						      </div>
						    </div>
							
						</div>
					</c:forEach>
				</c:otherwise>				
			</c:choose>
			
		
			<!-- 이부분 class 속성 col-lg-12 주셔야 리스트가 망가지지 않습니다. 10-23 cherwoo -->
			<div class="col-lg-12">
			<!--  -->
			<div align="center">
			<ul class="pagination">
				<c:if test="${pb.previousPageGroup }">
					<li>
					<a onclick="paging(${pb.startPageOfPageGroup-1})">&laquo;</a>
				</c:if>
				<c:forEach begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}" var="pagenum">
					<c:choose>
						<c:when test="${pagenum==pb.nowPage}">
							<li class="active"><a href="#">${pagenum}</a></li>
						</c:when>
						<c:otherwise>
							<li><a onclick="paging(${pagenum})">${pagenum}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>				
				<c:if test="${pb.nextPageGroup }">
					<li><a onclick="paging(${pb.endPageOfPageGroup+1})">&raquo;</a></li>
				</c:if>
			</ul>
		</div>	
	</div>


<script type="text/javascript">
	function paging(pageNum){
		$("#pageNumInput").val(pageNum);
		$("#pagingForm").submit();
	}
</script>
	
	
<form action="${pageContext.request.contextPath}/user-company_detail_search_list.do" id="pagingForm">	
	<input type="hidden" name="pageNum" value="" id="pageNumInput">	
	<c:forEach items="${paramValues.acaCatNumList}" var="acaCatNum">
		<input type="hidden" name="acaCatNumList" value="${acaCatNum}">		
	</c:forEach>
	<c:forEach items="${paramValues.locCatNumList}" var="locCatNum">
		<input type="hidden" name="locCatNumList" value="${locCatNum}">		
	</c:forEach>
	<c:forEach items="${paramValues.empTypeCatNumList}" var="empTypeCatNum">
		<input type="hidden" name="empTypeCatNumList" value="${empTypeCatNum}">		
	</c:forEach>
	<c:forEach items="${paramValues.recruitCatNumList}" var="recruitCatNum">
		<input type="hidden" name="recruitCatNumList" value="${recruitCatNum}">		
	</c:forEach>
	<c:forEach items="${paramValues.devCatNumList}" var="devCatNum">
		<input type="hidden" name="devCatNumList" value="${devCatNum}">		
	</c:forEach>	
</form>
