<%@page import="com.between.biz.TbUserBizImpl"%>
<%@page import="com.between.biz.TbBoardBizImpl"%>
<%@page import="com.between.biz.TbUserBiz"%>
<%@page import="com.between.dto.TbBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.between.dto.TbUserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% TbUserDto dto = (TbUserDto) session.getAttribute("dto");
	
	String userId = request.getParameter("userId");
	TbUserBiz biz = new TbUserBizImpl();
	List<TbBoardDto> list = biz.userBoardList(userId);
	
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function allchk(bool) {
		$("input[name=chk]").each(function () {
			$(this).prop("checked",bool);
		});
		
		
	}

	//유효성 검사 (체크를 하나도 안하면 submit이벤트 취소 )
	$(function () {
		$("#muldelform").submit(function () {
			if($("#muldelform input:checked").length == 0){
				alert("하나이상 체크해 주세요");
			    return false;//이벤트 전파 막음 
		    }
		});
		
		$("input[name=chk]").click(function () {
			if($("input[name=chk]").length == $("input[name=chk]:checked").length){
				$("input[name=all]").prop("checked",true);
				
			}else{
				$("input[name=all]").prop("checked",false);
			}
		}); // chk 전체를 선택하게되면 all의 체크박스에 체크가 되고, 하나라도 없을 경우 all체크박스가 해제됨
		
		
	});

	
	
	
</script>




<body>

<h1><%=dto.getUserId() %>내글 목록보기</h1>

	<div align="right">
		<form action="TbUser.do" method="post">
			<input type="hidden" name="command" value="search">
			<input type="hidden" name="userId" value="<%=dto.getUserId()%>">
			<input type="text" name="boardTitle">
			<input type="submit" value="검색">
			<input type="button" value="모든 글 보기 " onclick="location.href='TbUser.do?command=mylist&userId=<%=dto.getUserId() %>'">
		</form>	
	</div>
	
	<div>
	<form action="TbUser.do" method="post" id="muldelform">
	<input type="hidden" name="command" value="muldel">
	<input type="hidden" name="userId" value="<%=dto.getUserId() %>">
	<h1><%=dto.getUserId() %></h1>
	<fieldset>
		<table>
			<col width="20px" >
			<col width="100px" >
			<col width="200px" >
			<col width="150px" >
			<col width="100px" >
			<tr>
				<th><input type="checkbox" name="all" onclick="allchk(this.checked);"/></th>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
<%
	if(list.size() == 0){
%>
					<tr>
						<th colspan="5">-------작성된 글이 없습니다.-------</th>
					</tr>

<% 		
	}else{
		for(int i =0; i<list.size(); i++){
			
%>
						<tr>
							<td><input type="checkbox" name="chk" value="<%=list.get(i).getBoardNum() %> " ></td>
							<td align="center" ><%=list.get(i).getBoardNum() %></td>
							<td>
								<a href="TbUser.do?command=userboarddetail&boardNum=<%=list.get(i).getBoardNum() %>" ><%=list.get(i).getBoardTitle() %></a>
							</td>
							<td align="center"><%=list.get(i).getBoardGender() %></td>
							<td align="center"><%=list.get(i).getBoardDate() %></td>
						</tr>

<%		
		}
	}
%>			
			<tr>
				<td colspan="5" align="right" >
					<input type="button" value="글수정" onclick="location.href='TbUser.do?command=userboardupdateform'"/>
					<input type="submit" value="글삭제">
					<input type="button" value="마이페이지로" onclick="location.href='TbUser.do?command=mypage&logindto1=<%=dto.getUserStatus()%>'">
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
	</div>



</body>
</html>