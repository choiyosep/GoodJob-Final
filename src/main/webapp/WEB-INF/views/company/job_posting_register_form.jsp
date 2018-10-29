<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		});
	});
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
						<input type="checkbox"  name="locCatNumList" value="${locCat.locNum}" >${locCat.locName} &thinsp;&thinsp;
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
		<input type="submit" value="등록하기"style="height:50px; width:150px;background: #81BEF7;font-size: 20px">
		</div>
</form>	
</div>
<div class="col-md-2"></div>





