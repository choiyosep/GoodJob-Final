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
 		<div class="animated fadeInLeft"><a href="job_posting_detail.do?jobPostingNum=${ivList.jobPostingNum}">${ivList.companyName }</a></div>
 		<div class="animated fadeInRight"><a style="color:#333;" href="job_posting_detail.do?jobPostingNum=${ivList.jobPostingNum}">${ivList.postingTitle }</a></div>
	</h1>
		<div class="panel panel-default ">
			<div
				class="panel-heading accordion-toggle question-toggle collapsed"
				data-toggle="collapse" data-parent="#faqAccordion"
				data-target="#interview${status.index}">
				<h4 class="panel-title">
					<a href="javascript:return false;" class="ing">${ivList.interviewTitle}</a>
				</h4>
				<button type="submit" id="interviewUpdate${ivList.interviewNum }" >수정</button>
				<button type="submit" id="interviewDelete${ivList.interviewNum }" >삭제</button>
				<button type="submit" id="interviewCancel${ivList.interviewNum }" style="visibility: hidden;">취소</button>
				<button type="submit" id="interviewOK${ivList.interviewNum }" style="visibility: hidden;">완료</button><br>
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


<script type="text/javascript">
						$(document).ready(function() {
							var question = "${qavo.question}";
							$("#questionUpdate"+${qavo.qaNum}).click(function() {
								var qanum = ${qavo.qaNum};
								var text = "<textarea rows=\"1\" cols=\"100\" id=\"qaTextArea"+qanum+"\">";
								text += question;
								text += "</textarea>";
								$("#qaText"+qanum).html(text);
								$("#qaTextArea"+qanum).focus();
								document.getElementById('questionOK'+qanum).style.visibility = 'visible';
								document.getElementById('questionCancel'+qanum).style.visibility = 'visible';
								document.getElementById('questionUpdate'+qanum).style.visibility = 'hidden';
								document.getElementById('questionDelete'+qanum).style.visibility = 'hidden';
							});
							$("#interviewDelete"+${qavo.qaNum}).click(function() {
								var qanum = ${qavo.qaNum};
								/* if(question == null) {
									alert("답변이 아직 등록되지 않았습니다.");
									return false;
								} */
								var delConfirm = confirm("정말 삭제하시겠습니까?");
								if(delConfirm == false) {
									return false;
								} else {
									$.ajax({
										type:"get",
										data:"QANum="+qanum,
										url:"deleteQAToQuestion.do?",
										success:function(result) {
											if(result.question == null) {
												alert("해당 질문이 삭제 되었습니다.");
												location.href="getMyQuestionList.do";
											}
										}
									});
								}
							});
							$("#questionOK"+${qavo.qaNum}).click(function() {
								var qanum = ${qavo.qaNum};
								$.ajax({
									type:"get",
									data:"QANum="+qanum+"&question="+$("#qaTextArea"+qanum).val(),
									url:"updateQAToQuestion.do",
									success:function(result) {
										if(result.question != null) {
											alert("해당 질문이 수정되었습니다.");
											$("#qaText"+qanum).text("Q: "+result.question);
											question = result.question;
											document.getElementById('questionOK'+qanum).style.visibility = 'hidden';
											document.getElementById('questionCancel'+qanum).style.visibility = 'hidden';
											document.getElementById('questionUpdate'+qanum).style.visibility = 'visible';
											document.getElementById('questionDelete'+qanum).style.visibility = 'visible';
										} else {
										}
									}
								});
							});
							$("#questionCancel"+${qavo.qaNum}).click(function() {
								var qanum = ${qavo.qaNum};
								$("#qaText"+qanum).html("Q: "+question);
								document.getElementById('questionOK'+qanum).style.visibility = 'hidden';
								document.getElementById('questionCancel'+qanum).style.visibility = 'hidden';
								document.getElementById('questionUpdate'+qanum).style.visibility = 'visible';
								document.getElementById('questionDelete'+qanum).style.visibility = 'visible';
							});
						})
					</script>
			
