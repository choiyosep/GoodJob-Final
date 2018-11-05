<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			
<c:set var="cmvoList"  value="${postListVO.cmvoList}"></c:set>
<c:set var="pb"  value="${postListVO.pagingBean}"></c:set>
<script type="text/javascript">
$(document).ready(function(){		
	/* 	$("#SearchBtn").click(function(){
			$("#portfolioSearchList").submit();
		}); */		
});//ready
</script>
<div class="row">
	<div class="col-lg-12">
		<div class="row">
		
<div class="cta-text">
	<h2>
		<span>GoodJob </span>기업 검색
	</h2>
</div>
<div class="container" style="padding-left: 120px; padding-right: 120px;">
<form action="user-companySearchList.do" method="get">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">기업형태</h3>
			</div>
			<div class="panel-body">
					<input type="checkbox" name="companyTypeList" value="대기업">대기업&nbsp;
					<input type="checkbox" name="companyTypeList" value="중견기업">중견기업&nbsp;
					<input type="checkbox" name="companyTypeList" value="중소기업">중소기업&nbsp;
					<input type="checkbox" name="companyTypeList" value="공기업">공기업&nbsp;
			</div>
		</div>		

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">주소</h3>
			</div>
			<div class="panel-body">
				<input type="radio" name="address"	value="서울"  >서울&nbsp;
				<input type="radio" name="address"	value="경기" >경기&nbsp;
				<input type="radio" name="address"	value="기타" >기타&nbsp;					
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">기업명</h3>
			</div>
			<div class="panel-body">
					<input type="text" class="recruit" name="companyName" id="" style="height:40px; width:500px;">			
			</div>
		</div>
		
	<span id="enter"></span>
	<div class="cta-text">
		<button type="reset" class="btn btn-default" id="reset">초기화</button>
		&nbsp;&nbsp;
		<button type="submit" id="SearchBtn" class="btn btn-default">상세 검색</button>
		<!-- <button type="reset" onclick="location.href='home.do'"
			class="btn btn-default">홈으로</button> -->
	</div>
</form>

</div>
<br><br>







<%--Controller에서 받아온 기업정보리스트를 아래 div 구간에 정보들을 집어 넣고 반복문을 돌려보기  --%>	
<c:forEach items="${cmvoList}" var="cmvo">
<div class="col-lg-3">
	<div class="box">	
		<div class="box-gray aligncenter">
			<h4><a href="user-detailCompanyInfo.do?companyId=${cmvo.companyId}">${cmvo.name}</a></h4>
			<div class="icon" style="margin-bottom: 20px;">
				
				<a href="user-detailCompanyInfo.do?companyId=${cmvo.companyId}"><img src="/GoodJob/resources/upload/companyLogo/${cmvo.picturePath}" height="100px" width="100px" ></a>
			</div>
			<p>${cmvo.introduction}</p>

		</div>
		<div class="box-bottom">
			<a href="user-detailCompanyInfo.do?companyId=${cmvo.companyId}">기업정보 자세히보기</a>
		</div>
	</div>					
</div>
<!-- <div class="col-lg-1">
</div> -->
</c:forEach>	
		</div>
	</div>
	<div class="col-lg-12">
		<div align="center">
			<ul class="pagination">
				<c:if test="${pb.previousPageGroup }">
					<li><a
						href="${pageContext.request.contextPath}/user-allCompanyInfo.do?pageNum=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}" var="pagenum">
					<c:choose>
						<c:when test="${pagenum==pb.nowPage}">
							<li class="active"><a href="#">${pagenum}</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath}/user-allCompanyInfo.do?pageNum=${pagenum}">${pagenum}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>				
				<c:if test="${pb.nextPageGroup }">
					<li><a
						href="${pageContext.request.contextPath}/user-allCompanyInfo.do?pageNum=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>	
	</div>	
</div>