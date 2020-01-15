<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속닥속닥 작성</title>
</head>
<body>
	
	
	<div>
	<form action="TbBoard.do" method="post" >
	<input type="hidden" name="command" value="boardwriteres"/>
	<input type="hidden" name="userId" value="${dto.userId } }" />
	<fieldset>
		<table>
			<tr>
				<th>작성자</th>
				<td>${dto.boardGender }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boardTitle" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="30" name="boardContent"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" >
					<input type="submit" value="작성"/>
					<input type="button" value="취소" onclick="history.back();" /> 
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
	</div>
	


</body>
</html>