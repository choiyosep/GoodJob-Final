<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkContent").click(function() {
			alert(1);
		})//click
	});//ready
</script>
<table class="table table-hover">
<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 나의 면접신청 리스트
		</h2>
	</div>
</h4>

<tr>
<th>면접신청번호&nbsp;/&nbsp;구인공고번호</th><th>제목</th><th>기업명</th>
</tr>

<c:forEach items="${requestScope.ivList}" var="ivoList">

<tr>
<td>${ivoList.interviewNum}&nbsp;/&nbsp;${ivoList.jobPostingNum}</td>
<td id="checkContent"><a href="#">${ivoList.title}</a></td>
<td>${ivoList.companyMemberVO.name}</td>
</tr>
</c:forEach>
</table>
