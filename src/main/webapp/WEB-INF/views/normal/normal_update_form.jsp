<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- normal_update_form -->

<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>${requestScope.nmvo.name }</span>님 회원 정보 수정
		</h2>
	</div>
</h4>	

<script type="text/javascript">
	$(document).ready(function () {
		var gender = "${requestScope.nmvo.gender }";
		var val;
		if(gender == "여") val="female";
		else val="male";
		$("input:radio[name='gender']:radio[value="+val+"]").prop("checked", true);
		
		var retFirVal = false;
		var retSecVal = false;
		
		if($("#password").val() == "") {
			$("#passwordView").text("비밀번호는 8~10자로 입력하세요.").css("color", "red").css("font-weight", "bold");
			retFirVal = false;
		}
		
		$("#password").keyup(function() {
			if($(this).val()  == "") {
				$("#passwordView").text("비밀번호를 입력해주세요.").css("color", "red").css("font-weight", "bold");
				retFirVal = false;
			} else if($(this).val().length < 8 || $(this).val().length > 10) {
				$("#passwordView").text("비밀번호는 8~10자로 입력하세요.").css("color", "red").css("font-weight", "bold");
				retFirVal = false;
			} else if($(this).val().length >= 8 && $(this).val().length <= 10) {
				$("#passwordView").text("사용 가능한 비밀번호입니다.").css("color", "blue").css("font-weight", "bold");
				retFirVal = true;
			}
			
			if($("#checkPass").val() == "") {
				$("#checkPassView").text("비밀번호 확인 황목을 입력해주세요.").css("color", "red").css("font-weight", "bold");
				retSecVal = false;
			} else if($(this).val() != $("#checkPass").val()) {
				$("#checkPassView").text("비밀번호가 일치하지 않습니다.").css("color", "red").css("font-weight", "bold");
				retSecVal = false;
			} else if($(this).val() == $("#checkPass").val()) {
				$("#checkPassView").text("비밀번호가 일치합니다.").css("color", "blue").css("font-weight", "bold");
				retSecVal = true;
			}
		});
	
		$("#checkPass").keyup(function() {
			if($("#password").val() == "") {
				$("#checkPassView").text("비밀번호 항목을 먼저 입력해주세요.").css("color", "red").css("font-weight", "bold");
				retSecVal = false;
			} else if ($(this).val() == "") {
				$("#checkPassView").text("비밀번호 확인 황목을 입력해주세요.").css("color", "red").css("font-weight", "bold");
				retSecVal = false;
			} else if ($("#password").val() != $(this).val()) {
				$("#checkPassView").text("비밀번호가 일치하지 않습니다.").css("color", "red").css("font-weight", "bold");
				retSecVal = false;
			} else if($(this).val() == $("#password").val()){
				$("#checkPassView").text("비밀번호가 일치합니다.").css("color", "blue").css("font-weight", "bold");
				retSecVal = true;
			}
		});
		
		$("#normalUpdateForm").submit(function() {
			if(retFirVal == false || retSecVal == false) {
				$("#checkPass").val("");
				$("#password").val("");
				$("#password").focus();
				$("#passwordView").text("비밀번호는 8~10자로 입력하세요.").css("color", "red").css("font-weight", "bold");
				$("#checkPassView").text(" ");
				return false;
			}
		});
	});
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

<form id="normalUpdateForm" action="updateNormalMember.do" method="post">
	<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6" style="text-align: left; font-size: 20px; font-weight: bold; " >
			아이디  <input type="text" value="${requestScope.nmvo.id }" name="id" readonly="readonly" style="height:40px; width:500px;"><br><br>
			비밀번호  <input type="password" id="password" name="password" required="required" style="height:40px; width:500px;"><br>
			<span id="passwordView"> </span><br><br>
			비밀번호 확인  <input type="password" id="checkPass" name="checkPass" required="required"style="height:40px; width:500px;"><br>
			<span id="checkPassView"> </span><br><br>
			이메일 주소  <input type="text" value="${requestScope.nmvo.email }" name="email" required="required" style="height:40px; width:500px;"><br><br>
			이름  <br><input type="text" value="${requestScope.nmvo.name }" name="name" readonly="readonly" style="height:40px; width:500px;"><br><br>
			주소 <br><input type="text" id="sample4_postcode" placeholder="우편번호" readonly="readonly" required="required"style="height:40px; width:400px;">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:40px; width:100px;"><br>
				<input type="text" id="sample4_roadAddress"value="${requestScope.nmvo.address }" name="address" readonly="readonly" required="required"style="height:40px; width:500px;"><br>
				<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"readonly="readonly" required="required"style="height:40px; width:500px;"> -->
				<!-- 	<input type="text"placeholder="상세주소" name="address" required="required"style="height:40px; width:500px;"> -->
				<span id="guide" style="color:#999"></span><br><br>
			연락처  <br><input type="text" value="${requestScope.nmvo.tel }" name="tel" required="required" style="height:40px; width:500px;"><br><br>
			경력사항  <br><input type="text" value="${requestScope.nmvo.careerStatus }" name="careerStatus" required="required" style="height:40px; width:500px;"><br><br>
			성별  <br>
			<input type="radio" name="gender" value="male" disabled="disabled">남자 &nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="radio" name="gender" value="female" disabled="disabled">여자<br><br>
		</div>
		<div class="col-md-3"></div>
	</div>
	<div class="container" style="text-align: center">
		<input type="submit" value="회원정보수정"  style="height:50px; width:150px;background: #81BEF7;font-size: 20px">
	</div>
</form>
