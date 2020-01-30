<%@page import="com.between.dto.TbDictionaryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니캉 내캉</title>
<style type="text/css">

	.left{
		float: left;
		width: 500px;
		height: 500px;
	}
	.right{
		float:right;
		width: 500px;
		height: 500px;
	}
	.dicBtn{
		outline: none;
		border: none;
		color: skyblue;
		background-color: white;
	}
	#like{
		cursor: pointer;
	}

</style>
</head>
<body>
	
	<%@ include file="./form/mainPage.jsp" %>
	<%
		if(userInfo==null){
			pageContext.forward("index.jsp");
		}
		
		List<TbDictionaryDto> list = (List<TbDictionaryDto>)request.getAttribute("list");
		
	
	%>
	
	<div><br/>
	
	<div id="list" >
	<table>
		<col width="300px">
		<col width="50px">
		<col width="50px" >
		<tr>
			<th>키워드</th>
			<th>공감</th>
		</tr>
<%
		for(int i =0 ; i < list.size(); i++){
%>
		<tr class="row" >
			<td><%=list.get(i).getDicKeyword() %></td>
			<td><input class="dicBtn" type="button" value="<%=list.get(i).getDicLike()%>"/></td>
			<td><input class="dicBtn" id="like" type="button" value="공감" onclick="location.href='TbDic.do?command=like'"/></td>
		</tr>
<%		
		}
%>
		</table>
	</div>
	
	<input type="text" name="search"/><input type="button" value="검색"/>
	
	</div>
	
	<div id="left" >
	<table>
		
		<col width="150px">
		<col width="150px">
		
	<tr>
		<td>남자어</td>
	</tr>
	</table>
	</div>
	
	<div id="right">
	<table>
		<col width="150px">
		<col width="150px">
	<tr>
		<td>여자어</td>
	</tr>
	</table>
	</div>

</body>
</html>