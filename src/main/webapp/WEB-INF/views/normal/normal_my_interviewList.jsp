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
 		<div class="animated fadeInLeft"><a href="user-detailCompanyInfo.do?companyId=${ivList.companyId}">${ivList.companyName }</a></div><br>
 		<div class="animated fadeInRight"><a style="color:#333;" href="job_posting_detail.do?jobPostingNum=${ivList.jobPostingNum}">${ivList.postingTitle }</a></div>
	</h1>
		<div class="panel panel-default ">
			<div
				class="panel-heading accordion-toggle question-toggle collapsed"
				data-toggle="collapse" data-parent="#faqAccordion"
				data-target="#interview${status.index}">
				<h4 class="panel-title">
					<a href="javascript:return false;" id="interviewText${ivList.interviewNum }" class="ing">${ivList.interviewTitle}</a>
				</h4>
				<button type="submit" id="interviewUpdate${ivList.interviewNum }" >수정</button>
				<button type="submit" id="interviewDelete${ivList.interviewNum }" >삭제</button>
				
			</div>
			<div id="interview${status.index}" class="panel-collapse collapse"
				style="height: 0px;">
				<div class="panel-body">
					<p id="interviewContent${ivList.interviewNum }">${ivList.interviewContent}</p>
					<button type="submit" id="interviewCancel${ivList.interviewNum }" style="visibility: hidden;">취소</button>
				<button type="submit" id="interviewOK${ivList.interviewNum }" style="visibility: hidden;">완료</button><br>
				</div>
			</div>
		</div>			
		
		<script type="text/javascript">
						$(document).ready(function() {							
							var title = "${ivList.interviewTitle}";						
							
							$("#interviewUpdate"+${ivList.interviewNum}).click(function() {
								var interviewNum = ${ivList.interviewNum};
								var text = "<textarea rows=\"1\" cols=\"100\" id=\"interviewTextArea"+interviewNum+"\">";
								text += title;
								text += "</textarea>";	
								$("#interviewText"+interviewNum).html(text);
								
								var content="<textarea rows=\"3\" cols=\"100\" id=\"interviewcontentArea"+interviewNum+"\">${ivList.interviewContent}</textarea>";
								$("#interviewContent${ivList.interviewNum }").html(content); 
								
								$("#interviewTextArea"+interviewNum).focus();
								document.getElementById('interviewOK'+interviewNum).style.visibility = 'visible';
								document.getElementById('interviewCancel'+interviewNum).style.visibility = 'visible';
								document.getElementById('interviewUpdate'+interviewNum).style.visibility = 'hidden';
								document.getElementById('interviewDelete'+interviewNum).style.visibility = 'hidden';
							});
							
							
							 $("#interviewDelete"+${ivList.interviewNum}).click(function() {
								var interviewNum = ${ivList.interviewNum};
							/* 	 if(question == null) {
									//alert("답변이 아직 등록되지 않았습니다.");
									//return false;
								}  */
								var delConfirm = confirm("정말 삭제하시겠습니까?");
								if(delConfirm == false) {
									return false;
								} else {
									$.ajax({
										type:"get",
										data:"interviewNum="+interviewNum,
										url:"deleteInterview.do?",
										success:function(result) {
												alert("면접 신청이 삭제 되었습니다.");
												location.href="getMyInterviewList.do";
										}
									});
								}
							});
							 
							 
							$("#interviewOK"+${ivList.interviewNum}).click(function() {
								var interviewNum = ${ivList.interviewNum};
								$.ajax({
									type:"get",
									data:"interviewNum="+interviewNum+"&title="+$("#interviewTextArea"+interviewNum).val()+"&content="+$("#interviewcontentArea${ivList.interviewNum}").val(),
									url:"updateInterview.do",
									success:function(result) {
										if(result != null) {
											alert("수정되었습니다.");
											$("#interviewText"+interviewNum).text(result.title);
											$("#interviewContent${ivList.interviewNum }").text(result.content);
											document.getElementById('interviewOK'+interviewNum).style.visibility = 'hidden';
											document.getElementById('interviewCancel'+interviewNum).style.visibility = 'hidden';
											document.getElementById('interviewUpdate'+interviewNum).style.visibility = 'visible';
											document.getElementById('interviewDelete'+interviewNum).style.visibility = 'visible';
										} else {
										}
									}
								});
							});
							 
							$("#interviewCancel"+${ivList.interviewNum}).click(function() {
								var interviewNum = ${ivList.interviewNum};
								$("#interviewText"+interviewNum).html(title);
								document.getElementById('interviewOK'+interviewNum).style.visibility = 'hidden';
								document.getElementById('interviewCancel'+interviewNum).style.visibility = 'hidden';
								document.getElementById('interviewUpdate'+interviewNum).style.visibility = 'visible';
								document.getElementById('interviewDelete'+interviewNum).style.visibility = 'visible';
							}); 
						});
					</script>
		
	</c:forEach>
</div>



			
