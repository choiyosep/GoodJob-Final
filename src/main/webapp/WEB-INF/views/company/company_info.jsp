<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-lg-12">
		<div class="row">
			<h4 class="heading">
				<div class="cta-text">
					<h2>
						<span>GoodJob </span>기업정보
					</h2>
				</div>
			</h4>
<c:set var="cmvoList"  value="${postListVO.cmvoList}"></c:set>
<c:set var="pb"  value="${postListVO.pagingBean}"></c:set>
<script type="text/javascript">
$(document).ready(function(){	
	$("input[name='recruitCatNumList']").change(function() {
		$("#empTypeArea").html('');
		var dataString='';				
		$.ajax({
			type:"get",
			url:"user-DevCatVOListAjax.do",
			dataType:"json",
			data:$("#portfolioSearchList").serialize(),
			success:function(catList){		
				var catListString='';
				for(var i=0; i<catList.length; i++){			
					for(var j=0; j<catList[i].length; j++){
						catListString += '<input type="checkbox" class = "recruit" name="devCatNumList" value="'+catList[i][j].devCatNum+'">'+catList[i][j].devCatName+'&nbsp;';
					}
					catListString+='<br>';
				}
				$("#empTypeArea").html($("#empTypeArea").html()+catListString);
			}//success					
		});//ajax
	});//change
	/* 	$("#SearchBtn").click(function(){
			$("#portfolioSearchList").submit();
		}); */
		
	$("#reset").click(function() {
		$("#empTypeArea").html('');
		/* var dataString='';				
		$.ajax({
			type:"get",
			url:"user-DevCatVOListAjax.do",
			dataType:"json",
			data:" ",
			success:function(catList){		
				var catListString='';
				for(var i=0; i<catList.length; i++){			
					for(var j=0; j<catList[i].length; j++){
						catListString += '<input type="checkbox" class = "recruit" name="devCatNumList" value="'+catList[i][j].devCatNum+'">'+catList[i][j].devCatName+'&nbsp;';
					}
					catListString+='<br>';
				}
				$("#empTypeArea").html($("#empTypeArea").html()+catListString);
			}//success					
		});//ajax */
	});

});//ready
</script>

<div class="cta-text">
	<h2>
		<span>GoodJob </span>기업 검색
	</h2>
</div>
<div class="container"
	style="padding-left: 120px; padding-right: 120px;">
	<form action="user-portfolioSearchList.do" method="get"
		id="portfolioSearchList">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">기업형태</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.locCatList}" var="locCat"
					varStatus="i">
					<input type="checkbox" id="locCatNumList" name="locCatNumList"
						value="${locCat.locNum}">${locCat.locName}&nbsp;
				</c:forEach>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">업종</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.acaCatList}" var="acaCat"
					varStatus="i">
					<input type="checkbox" id="acaCatNumList" name="acaCatNumList"
						value="${acaCat.academicNum}" >${acaCat.academicName}&nbsp;
	</c:forEach>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">주소</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.empTypeCatList}" var="empTypeCat"
					varStatus="i">
					<input type="checkbox" name="empTypeCatNumList"
						id="empTypeCatNumList" value="${empTypeCat.empTypeNum}">${empTypeCat.empTypeName}&nbsp;
	</c:forEach>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">모집 직군</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.recruitCatList}" var="recruitCat"
					varStatus="i">
					<input type="checkbox" class="recruit" name="recruitCatNumList"
						id="recruitCatNumList" value="${recruitCat.rcNum}">${recruitCat.rcName}  &thinsp;&thinsp;
			<c:if test="${(i.index+1)%3==0}">
						<br>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">개발 분야</h3>
			</div>
			<div class="panel-body">
				<input type="hidden" name="a" value="b">
				<div id="empTypeArea"></div>

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