<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function deleteCompanyMember() {
		var delConfirm = confirm("${requestScope.cmvo.companyId}님 정말 회원 탈퇴를 하시겠습니까?");
		if (delConfirm == true) {
			location.href = "deleteMember.do";
		} else {
			return;
		}
	}
</script>

<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>${sessionScope.mvo.name }</span>님 회원 정보
		</h2>
	</div>
</h4>

<div class="container">
	<div class="col-sm-3"></div>
	<div class="col-sm-6" style="text-align: center">
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<td>${requestScope.cmvo.companyId}</td>
			</tr>
			<tr>
				<th>기업로고</th>
				<td><img
					src="/GoodJob/resources/upload/companyLogo/${requestScope.cmvo.picturePath}"
					height="100px" width="100px"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${requestScope.cmvo.email }</td>
			</tr>
			<tr>
				<th>회사명</th>
				<td>${requestScope.cmvo.name }</td>
			</tr>
			<tr>
				<th>회사주소</th>
				<td>${requestScope.cmvo.address }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${requestScope.cmvo.tel }</td>
			</tr>
			<tr>
				<th>회사소개</th>
				<td>${requestScope.cmvo.introduction }</td>
			</tr>
			<tr>
				<th>기업형태</th>
				<td>${requestScope.cmvo.companyType }</td>
			</tr>
			<tr>
				<th>업종</th>
				<td>${requestScope.cmvo.industry }</td>
			</tr>
			<tr>
				<th>매출액</th>
				<td>${requestScope.cmvo.sales }</td>
			</tr>
			<tr>
				<th>설립일</th>
				<td>${requestScope.cmvo.dateOfEstablishment }</td>
			</tr>
			<tr>
				<th>사원수</th>
				<td>${requestScope.cmvo.numOfEmployees }</td>
			</tr>
		</table>
		<button class="btn-1" onclick="javascript:location.href='updateCompanyMemberForm.do'"
			style="height: 40px; width: 100px;">기업정보수정</button>
		<button class="btn-1" onclick="deleteCompanyMember()"
			style="height: 40px; width: 100px;">회원탈퇴</button>
	</div>
	<div class="col-sm-3"></div>
</div>
