<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- normal_register_form -->

<style>
.container {
  padding: 2px;
}
button,
button::after {
  -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
    transition: all 0.3s;
}
button {
  background: #81BEF7;
  border: 3px solid #fff;
  border-radius: 5px;
  font-size: 40px;
  font-weight: bold;
  ;
  position: relative;
  text-transform: uppercase;
}
button:hover {
  color: white;
}
/* BUTTON 1 */
.btn-1::after {
  height: 0;
  left: 0;
  top: 0;
  width: 100%;
}
.btn-1:hover:after {
  height: 100%;
}
.btn-2::after {
  height: 100%;
  left: 0;
  top: 0;
  width: 0;
}
.btn-2:hover:after {
  width: 100%;
}


</style>

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

<script type="text/javascript">
	$(document).ready(function () {
		var gender = "${requestScope.nmvo.gender }";
		var val;
		if(gender == "여") val="female";
		else val="male";
		$("input:radio[name='gender']:radio[value="+val+"]").prop("checked", true);
		
		var retFirVal = false;
		var retSecVal = false;
		
		var idCheckFlag = "";
		var idCheckBtnFlag = false;
		
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
		
		$("#id").keyup(function() {
			idCheckBtnFlag = false;
		});
		
		$("#checkId").click(function() {
			$.ajax({
				type:"get",
				url:"user-checkMemberId.do",	/* 181018 MIRI 'user-'로 변경 */
				data:"id="+$("#id").val(),
				success:function(result) {
					if(result == "ok") {
						idCheckFlag = "ok";
						$("#idView").text("사용 가능합니다.").css("color", "blue").css("font-weight", "bold");
					} else {
						idCheckFlag = "fail";
						$("#idView").text("이미 사용중인 아이디 입니다.").css("color", "red").css("font-weight", "bold");
						$("#id").focus();
					}
				}
			});
			idCheckBtnFlag = true;
		});
		
		$("#normalRegisterForm").submit(function() {
			if(retFirVal == false || retSecVal == false) {
				$("#checkPass").val("");
				$("#password").val("");
				$("#password").focus();
				$("#passwordView").text("비밀번호는 8~10자로 입력하세요.").css("color", "red").css("font-weight", "bold");
				$("#checkPassView").text(" ");
				return false;
			}
			
			if(idCheckFlag == "") {
				alert("아이디 중복체크를 해주시기 바랍니다.");
				$("#id").focus();
				return false;
			} else if(idCheckFlag == "fail") {
				alert("이미 사용중인 아이디입니다.");
				$("#id").val("");
				$("#id").focus();
				return false;
			} else if(idCheckBtnFlag == false) {
				alert("아이디를 다시 한 번 확인해 주세요.");
				$("#id").val("");
				$("#id").focus();
				$("#idView").text("아이디 중복체크를 해주시기 바랍니다.").css("color", "red").css("font-weight", "bold");
				return false;
			}
		});//submit
	});//ready
</script>

<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 개인 회원 가입
		</h2>
	</div>
</h4>	

<form id="normalRegisterForm" action="user-registerNormalMember.do" method="post">
<div class="container">
	<div class="col-md-2"></div>
<div class="col-md-8" style="text-align: center">
  <button class="btn-1" onclick="javascript:location.href='user-registerNormalMemberForm.do'" style="height:80px; width:300px;">개인회원</button>
  <button class="btn-2" onclick="javascript:location.href='user-registerCompanyMemberForm.do'" style="height:80px; width:300px;">기업회원</button><br><br>	
	<div class="col-md-2"></div>
	</div>
	</div>
	<div class="container">
	<div class="col-md-3"></div>
	<div class="col-md-6" style="text-align: left; font-size: 20px; font-weight: bold; " >
	아이디  <br><input type="text" id="id" name="id" required="required" style="height:40px; width:400px;">
	<input type="button" id="checkId" value="중복체크" style="height:40px; width:100px;"><br>
	<span id="idView"> </span><br><br>
	비밀번호  <br><input type="password" id="password" name="password" required="required" style="height:40px; width:500px;"><br>
	<span id="passwordView"> </span><br><br>
	비밀번호 확인  <br><input type="password" id="checkPass" name="checkPass" required="required" style="height:40px; width:500px;"><br>
	<span id="checkPassView"> </span><br><br>
	이메일 주소  <br><input type="text" name="email" required="required" style="height:40px; width:500px;"><br><br>
	이름<br><input type="text" name="name" required="required" style="height:40px; width:500px;"><br><br>
		주소 <br><input type="text" id="sample4_postcode" placeholder="우편번호" readonly="readonly" required="required"style="height:40px; width:400px;">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height:40px; width:100px;"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address" readonly="readonly" required="required"style="height:40px; width:500px;"><br>
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소"readonly="readonly" required="required"style="height:40px; width:500px;">
					<input type="text"placeholder="상세주소" name="address" required="required"style="height:40px; width:500px;">
				<span id="guide" style="color:#999"></span><br><br>
	연락처  <br><input type="text" name="tel" required="required" style="height:40px; width:500px;"><br><br>
	경력사항 <br> <input type="text" name="careerStatus" required="required" style="height:40px; width:500px;"><br><br>
	성별  <br>&nbsp;<input type="radio" name="gender" value="male" required="required">남자 
			    <input type="radio" name="gender" value="female" required="required">여자 
	<br><br>
	
	</div>
	  <div class="col-md-3"></div>
	</div>
	<div class="container" style="text-align: center">
	<input type="submit" value="회원가입" style="height:50px; width:150px;background: #81BEF7;font-size: 20px">
	</div>
</form>



