<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

<!-- company_mypage -->
<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>${sessionScope.mvo.name }</span>님 마이페이지
		</h2>
	</div>
</h4>	

<script type="text/javascript">
$(document).ready(function(){
	var companyId="${requestScope.cmvo.companyId}";
	
	$("#myposting").click(function(){
	    $.ajax({
		type:"get",
		url:"isJobPosting.do",
		data:"companyId="+companyId,
		success:function(result) {
		 	if(result=="asd"){
				alert("등록된 구인공고가 없습니다")
				return false;
			}else{
				location.href = "companyMyJobPosting.do?companyId="+companyId;
			} 
		}//success
		});//ajax  
	});//click
});//ready
</script>

<div class="demo10">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">MYINFO</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 기업정보
                        </span>
                    </div>
                    <div class="pricing-content">
                        <ul>
                            <li>수정/탈퇴</li>
                        </ul>
                        <a href="companyMemberInfo.do?companyId=${requestScope.cmvo.companyId }" class="read">바로가기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">REGISTER</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 등록하기
                        </span>
                    </div>
                    <div class="pricing-content">
						<ul>
                            <li>구인 공고 등록하기</li>
                        </ul>
                        <a href="registerJobPostingForm.do" class="read">바로가기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">MYPOSTING</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 게시글
                        </span>
                    </div>
                    <div class="pricing-content">
                        <ul>
                            <li>상세 보기</li>
                            <li>수정/삭제</li>
                            <li>면접 신청자</li>
                            <li>질의 응답</li>
                        </ul>
                        <a href="#" id="myposting" class="read">바로가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


