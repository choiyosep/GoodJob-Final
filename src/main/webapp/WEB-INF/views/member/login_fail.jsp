<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- login_fail -->

<script type="text/javascript">
	if(${sessionScope.mvo.memberType == "2"}) {
		alert("로그인 실패! 아직 관리자에게 승인받지 못했습니다.");
	} else {
		alert("로그인에 실패했습니다! 다시 로그인하세요");
	}
	location.href="user-loginForm.do";
</script>

