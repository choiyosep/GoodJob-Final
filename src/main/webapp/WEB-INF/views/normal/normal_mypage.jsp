<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

<!-- normal_mypage -->
<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>${sessionScope.mvo.name }</span>님 마이페이지
		</h2>
	</div>
</h4>	

<div class="demo10">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">MYINFO</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 회원정보
                        </span>
                    </div>
                    <div class="pricing-content">
                        <ul>
                            <li>수정/탈퇴</li>
                        </ul>
                        <a href="normalMemberInfo.do?normalId=${requestScope.nmvo.id }" class="read">바로가기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">PORTFOLIO</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 이력서
                        </span>
                    </div>
                    <div class="pricing-content">
                        <c:choose>
							<c:when test="${empty povo.title }">
								<ul>
		                            <li>이력서 등록하기</li>
		                        </ul>
		                        <a href="registerPortfolioForm.do" class="read">바로가기</a>
							</c:when>
							<c:otherwise>
								<ul>
		                            <li>내 이력서 보기</li>
		                        </ul>
		                        <a href="normalDetailPortfolio.do?normalId=${requestScope.nmvo.id }" class="read">바로가기</a>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">QUESTION</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 질의응답
                        </span>
                    </div>
                    <div class="pricing-content">
                        <ul>
                            <li>내 질문 조회</li>
                        </ul>
                        <a href="getMyQuestionList.do" class="read">바로가기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="pricingTable10">
                    <div class="pricingTable-header">
                        <h3 class="heading">INTERVIEW</h3>
                        <span class="price-value">
                            <span class="currency">#</span> 면접
                        </span>
                    </div>
                    <div class="pricing-content">
                        <ul>
                            <li>내 면접 조회</li>
                        </ul>
                        <a href="getMyInterviewList.do?normalId=${requestScope.nmvo.id}" class="read">바로가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
