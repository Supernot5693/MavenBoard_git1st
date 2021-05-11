<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).load(function(){
				
	});
	
	function modify(){
		var num = $("input[name=num]").val();
		var params = $("#insertForm").serialize();
		
		console.log(num);
		console.log(params);
		$.ajax({
			url: './freeBoardModify.ino',
			data: params,
			type: 'post',
			success: function(result){
				
				var goToMain;
				
				if(result.result=='true'){
					alert("수정성공");
					
					goToMain = confirm("")
					
					location = './main.ino';
				} else{
					alert("수정실패");
					location = './freeBoardDetail.ino?num=' + num;
				}
			}
		});
	}
</script>
</head>
<body>

	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">리스트로</a>
	</div>
	<hr style="width: 600px">

	<form name="insertForm" id="insertForm">
		<input type="hidden" name="num" value="${freeBoardOne.NUM }" />
		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">타입 :</td>
					<td style="width: 400px;">
						<select id="codeType" name="codeType">
							<c:forEach var="codeOne" items="${cType}">
								<option value="${codeOne.CODE }"<c:if test="${freeBoardOne.CODETYPE==codeOne.CODE }">selected</c:if>>${codeOne.CODENAME }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">이름 :</td>
					<td style="width: 400px;"><input type="text" name="name" value="${freeBoardOne.NAME }" readonly/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">제목 :</td>
					<td style="width: 400px;"><input type="text" name="title"  value="${freeBoardOne.TITLE }"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">내용 :</td>
					<td style="width: 400px;"><textarea name="content" rows="25" cols="65"  >${freeBoardOne.CONTENT }</textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td align="right">
					<input type="button" value="수정" onclick="modify();">
					<input type="button" value="삭제" onclick="location.href='./freeBoardDelete.ino?num=${freeBoardOne.NUM }'">
					<input type="button" value="취소" onclick="location.href='./main.ino'">
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>


<%-- 	<input type="hidden" name="num" value="${freeBoardDto.num }" />

		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name }" readonly/></div>

		<div style="width: 150px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"  value="${freeBoardDto.title }"/></div>

		<div style="width: 150px; float: left;">작성날자</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate }"/></div>

		<div style="width: 150px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  >${freeBoardDto.content }</textarea></div>
		<div align="right">
		<input type="button" value="수정" onclick="modify()">
		<input type="button" value="삭제" onclick="location.href='./freeBoardDelete.ino?num=${freeBoardDto.num }'">

		<input type="button" value="취소" onclick="location.href='./main.ino'">
		&nbsp;&nbsp;&nbsp;
		</div> --%>

</body>
</html>