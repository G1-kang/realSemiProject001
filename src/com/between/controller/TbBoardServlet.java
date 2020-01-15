package com.between.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.between.biz.TbBoardBiz;
import com.between.biz.TbBoardBizImpl;
import com.between.dto.TbBoardDto;

import static com.between.controller.ServletUtil.*;

@WebServlet("/test.do")
public class TbBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public TbBoardServlet() {
	}
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		TbBoardBiz biz = new TbBoardBizImpl();
		
		String command = request.getParameter("command");
		
		if(command.equals("boardlist")) {
			List<TbBoardDto> list = biz.selectList();
			request.setAttribute("list", list);
			dispatch("TbBoardList.jsp",request,response);
		} else if(command.equals("boarddetail")) {
			int boardNum = Integer.parseInt(request.getParameter("boardnum"));
			TbBoardDto dto = biz.selectOne(boardNum);
			request.setAttribute("dto", dto);
			dispatch("TbBoardDatail.jsp",request,response);
		} else if(command.equals("boardwriteform")) {
			response.sendRedirect("TbBoardWriteForm.jsp");
		} else if(command.equals("boardwriteres")) {
			
			
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		doGet(request, response);
	}
	
}