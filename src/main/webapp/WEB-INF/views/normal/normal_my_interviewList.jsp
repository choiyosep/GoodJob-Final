<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath }/resources/css/title.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 나의 면접신청 리스트
		</h2>
	</div>
</h4>

<div class="panel-group" id="faqAccordion">
	<c:forEach items="${requestScope.ivList}" var="ivList" varStatus="status">
	<h1>
 		<div class="animated fadeInLeft">${ivList.companyName }</div>
 		<div class="animated fadeInRight">${ivList.postingTitle }</div>
	</h1>
		<div class="panel panel-default ">
			<div
				class="panel-heading accordion-toggle question-toggle collapsed"
				data-toggle="collapse" data-parent="#faqAccordion"
				data-target="#interview${status.index}">
				<h4 class="panel-title">
					<a href="javascript:return false;" class="ing">${ivList.interviewTitle}</a>
				</h4>
			</div>
			<div id="interview${status.index}" class="panel-collapse collapse"
				style="height: 0px;">
				<div class="panel-body">
					<p>${ivList.interviewContent}</p>
				</div>
			</div>
		</div>			
	</c:forEach>
</div>
			
