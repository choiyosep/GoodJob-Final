<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script type="text/javascript">	
	$(document).ready(function(){		
		$("input[name='recruitCatNumList']").change(function() {	
			$("#empTypeArea").html('');
			var dataString='';				
			$.ajax({
				type:"get",
				url:"user-getDevCatVOListAjax.do",
				dataType:"json",
				data:$("#registerForm").serialize(),
				success:function(catList){		
					var catListString='';
					for(var i=0; i<catList.length; i++){			
						for(var j=0; j<catList[i].length; j++){
							catListString += '<input type="checkbox" class = "recruit" name="devCatNumList" value="'+catList[i][j].devCatNum+'">'+catList[i][j].devCatName+'&nbsp;';
						}
						catListString+='<br>';
					}
					$("#empTypeArea").html($("#empTypeArea").html()+catListString);
				}//success					
			});//ajax 			
		});//change
		$("#reset").click(function() {
			$("#empTypeArea").html('');
			var dataString='';				
			$.ajax({
				type:"get",
				url:"user-DevCatVOListAjax.do",
				dataType:"json",
				data:" ",
				success:function(catList){		
					var catListString='';
					for(var i=0; i<catList.length; i++){			
						for(var j=0; j<catList[i].length; j++){
							catListString += '<input type="checkbox" class = "recruit" name="devCatNumList" value="'+catList[i][j].devCatNum+'">'+catList[i][j].devCatName+'&nbsp;';
						}
						catListString+='<br>';
					}
					$("#empTypeArea").html($("#empTypeArea").html()+catListString);
				}//success					
			});//ajax
		});//click
		
	});//ready
	function checkForm(){
		if($("input[name=locCatNumList]:checked").size()==0){
			alert("지역을 하나 이상 선택해주세요!");
			return false;
		}
		if($("input[name=acaCatNumList]:checked").size()==0){
			alert("학력을 하나 이상 선택해주세요!");
			return false;
		}
		if($("input[name=empTypeCatNumList]:checked").size()==0){
			alert("고용형태를 하나 이상 선택해주세요!");
			return false;
		}
		if($("input[name=recruitCatNumList]:checked").size()==0){
			alert("모집직군을 하나 이상 선택해주세요!");
			return false;
		}
		if($("input[name=devCatNumList]:checked").size()==0){
			alert("개발분야를 하나 이상 선택해주세요!");
			return false;
		}
	}
</script>	

<script>
/* 키워드 인풋 추가/제거 되는 코드 */
var arrInput = new Array(0);
  var arrInputValue = new Array(0);
 
function addInput() {
  arrInput.push(arrInput.length);
  arrInputValue.push("");
  display();
}
 
function display() {
  document.getElementById('parah').innerHTML="";
  for (intI=0;intI<arrInput.length;intI++) {
    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
  }
}
 
function saveValue(intId,strValue) {
  arrInputValue[intId]=strValue;
}  
 
function createInput(id,value) {
  return "<input type='text' name='keywordNameList' id='test "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
 
value +"'><br>";
}
 
function deleteInput() {
  if (arrInput.length > 0) { 
     arrInput.pop(); 
     arrInputValue.pop();
  }
  display(); 
}

function checkForm(){
	if($("input[name=locCatNumList]:checked").size()==0){
		alert("지역을 하나 이상 선택해주세요!");
		return false;
	}
	
	if($("input[name=empTypeCatNumList]:checked").size()==0){
		alert("고용형태를 하나 이상 선택해주세요!");
		return false;
	}
	if($("input[name=recruitCatNumList]:checked").size()==0){
		alert("모집직군을 하나 이상 선택해주세요!");
		return false;
	}
	if($("input[name=devCatNumList]:checked").size()==0){
		alert("개발분야를 하나 이상 선택해주세요!");
		return false;
	}
}
</script>


<div class="col-md-2"></div>
<div class="col-md-8" style="text-align: left ">
<form action="registerJobPosting.do" method="get" id="registerForm">
<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 구인 공고 작성
		</h2>
	</div>
</h4>	
	<h5>제목</h5><input type="text" style="height:40px;width: 684px;" name="title" placeholder="제목을 입력하세요" required="required" style="height:40px; width:400px;"><br>
	<h5>내용</h5><textarea rows="8" cols="94" name="content" placeholder="내용을 입력하세요" required="required"></textarea><br>	
	<h5>경력</h5><input type="text" name="careerStatus" placeholder="ex)경력3년" required="required"><br><br>
	<h5>검색 키워드</h5><input type="text" name="keywordNameList" placeholder="ex)자율복장" required="required"> &nbsp; 
					<input type="button" value="추가" onclick="addInput()"> 
					<input type="button" value="삭제" onclick="deleteInput()"><br>
					<div id="parah"></div>	
					<br><br>
	<table class="table table-bordered" style=" width: 675px;">
		<colgroup>
		        <col width="92px">
		       <%--  <col width="320px"> --%>
		      </colgroup>
		<tbody>
		<tr height="50px">
		      	<th>지역</th>
		        <td>
					<c:forEach items="${requestScope.locCatList}" var="locCat" varStatus="i" >
						<input type="checkbox"  name="locCatNumList" value="${locCat.locNum}">${locCat.locName} &thinsp;&thinsp;
					</c:forEach>
		        </td>      
		      </tr>
		      
		      <tr height="50px">
		      	<th>학력</th>
		        <td>
					<c:forEach items="${requestScope.acaCatList}" var="acaCat" varStatus="i" >
						<input type="checkbox"  name="acaCatNumList" value="${acaCat.academicNum}" >${acaCat.academicName} &thinsp;&thinsp;
					</c:forEach>
		        </td>      
		      </tr>
		      
		      <tr height="50px">
		      	<th>고용형태</th>
		        <td>
					<c:forEach items="${requestScope.empTypeCatList}" var="empTypeCat" varStatus="i" >
						<input type="checkbox"  name="empTypeCatNumList" value="${empTypeCat.empTypeNum}" >${empTypeCat.empTypeName}  &thinsp;&thinsp;
					</c:forEach>
		        </td>      
		      </tr>
		
		
		
		  <tr height="50px">
		      	<th>모집직군</th>
		        <td>
					<c:forEach items="${requestScope.recruitCatList}" var="recruitCat" varStatus="i" >
						<input type="checkbox" class = "recruit" name="recruitCatNumList" value="${recruitCat.rcNum}" >${recruitCat.rcName}  &thinsp;&thinsp;
						<c:if test="${(i.index+1)%4==0}"><br></c:if>					
					</c:forEach>					
		        </td>      
		      </tr>
		      
		      <tr height="50px" >
		        <th>개발분야</th>
		        <td style="padding-top:5px;">
		        	<div id="empTypeArea">		
					</div>					
		        </td>        
		      </tr>      
		      </tbody>
	</table>	
		
		<div class="col-md-12">
		<button id="reset" type="reset"style="height:50px; width:150px;background: #81BEF7;font-size: 20px">초기화</button>	
<<<<<<< HEAD
		<input type="submit" value="등록하기"style="height:50px; width:150px;background: #81BEF7;font-size: 20px"  onclick="return checkForm()">
=======
		<input type="submit" value="등록하기" onclick="return checkForm()" style="height:50px; width:150px;background: #81BEF7;font-size: 20px">
>>>>>>> branch 'master' of https://github.com/choiyosep/GoodJob-Final.git
		</div>
</form>	
</div>
<div class="col-md-2"></div>

</body>
</html> 



