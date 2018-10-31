<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-lg-12">
		<div class="row">
			<h4 class="heading">
				<div class="cta-text">
					<h2>
						<span>GoodJob</span> 나의 질문 모두 보기
					</h2>
				</div>
			</h4>
			<div class="panel-group" id="faqAccordion">
				<c:forEach items="${requestScope.qavo}" var="qavo" varStatus="status">
					<div class="panel panel-default ">
						<div id="buttonSubmit${qavo.qaNum }"
							class="panel-heading accordion-toggle question-toggle collapsed"
							data-toggle="collapse" data-parent="#faqAccordion"
							data-target="#question${status.index}">
							<h4 class="panel-title">
								<a href="#" class="ing" id="qaText${qavo.qaNum }">Q: ${qavo.question }</a>
								<button type="submit" id="questionCancel${qavo.qaNum }" style="visibility: hidden;">취소</button>
								<button type="submit" id="questionOK${qavo.qaNum }" style="visibility: hidden;">완료</button><br>
								<c:if test="${empty qavo.answer }">
									<button type="submit" id="questionUpdate${qavo.qaNum }" >수정</button>
								</c:if>
								<button type="submit" id="questionDelete${qavo.qaNum }" >삭제</button>
							</h4>
						</div>
						<div id="question${status.index }" class="panel-collapse collapse" style="height: 0px;">
							<div class="panel-body">
								<h5>
									<span class="label label-primary">Answer</span>
								</h5>
								<p>${qavo.answer}</p>
							</div>
						</div>
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
							$("#questionDelete"+${qavo.qaNum}).click(function() {
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
				</c:forEach>
			</div>
		</div>
	</div>
</div>