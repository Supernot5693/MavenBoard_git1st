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
	$(document).ready(function(){
		$("#insertBtn").click(function(){
			
			var name = $("input[name=name]"); 
			var title = $("input[name=title]");
			var content = $("input[name=content]");
			
			if(name.val()==""){
				alert("�̸��� �Է��ϼ���");
				name.focus();
				return false;
			}
			if(title.val()==""){
				alert("������ �Է��ϼ���");
				title.focus();
				return false;
			}
			if(content.val()==""){
				alert("������ �Է��ϼ���");
				content.focus();
				return false;
			}
			
			var params = $("#insertForm").serialize();
			$.ajax({
				url: './freeBoardInsertPro.ino',
				type: 'post',
				data: params,
				success: function(result){
					
					console.log(result);
					var goToMain;
					
					if(result.result=='true'){
						alert("��� ����");
						goToMain = confirm("�������� ���ư��ðڽ��ϱ�?");
						if(goToMain){
							location.href = './main.ino';
						}else{
							location.href = './freeBoardDetail.ino?num=' + result.num;
						}
					}else{
						alert("��� ����");
						location.href = './freeBoardInsert.ino';
					}
				}
			});
		});
	});
	

</script>
</head>
<body>
	<div>
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">

	<form action="./freeBoardInsertPro.ino" id="insertForm">

		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">Ÿ�� :</td>
					<td style="width: 400px;">
						<select id="codeType" name="codeType">
							<c:forEach var="codeOne" items="${codeOne }">
								<option value="${codeOne.CODE }">${codeOne.CODENAME }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">�̸� :</td>
					<td style="width: 400px;"><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">���� :</td>
					<td style="width: 400px;"><input type="text" name="title"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">���� :</td>
					<td style="width: 400px;"><textarea name="content" rows="25" cols="65" ></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td align="right">
					<input type="button" value="�۾���" id="insertBtn">
					<input type="button" value="�ٽþ���" onclick="reset()">
					<input type="button" value="���" onclick="">
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>



</body>
</html>