<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <table class="table table-hover">
<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 나의 면접신청 리스트
		</h2>
	</div>
</h4>
</table>
			<div class="panel-group" id="faqAccordion">
				<c:forEach items="${requestScope.ivList}" var="ivoList" varStatus="status">
					<div class="panel panel-default ">
						<div
							class="panel-heading accordion-toggle question-toggle collapsed"
							data-toggle="collapse" data-parent="#faqAccordion"
							data-target="#interview${status.index}">
							<h4 class="panel-title">
								<a href="#" class="ing">${ivoList.title}</a>
							</h4>
						</div>
						<div id="interview${status.index}" class="panel-collapse collapse"
							style="height: 0px;">
							<div class="panel-body">
								
								<p>${ivoList.content}</p>
								
							</div>
						</div>
					</div>			
					</c:forEach>
			</div>
		</div>
	</div>
</div>
			
