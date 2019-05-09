package com.controller;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import com.service.BoardCommand;
import com.service.BoardListCommand;
import com.service.BoardWriteCommand;

@WebServlet("*.do")
public class BoardFrontController extends HttpServlet {

	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		request.setCharacterEncoding("EUC-KR");
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String com=requestURI.substring(contextPath.length());
		
		BoardCommand command=null;
		String nextPage=null;
		if(com.equals("/list.do")) {
			command=new BoardListCommand();
			command.execute(request, response);
			nextPage="list.jsp";
		}
		if(com.equals("/writeui.do")) {
			nextPage="write.jsp";
		}
		if(com.equals("/write.do")) {
			command = new BoardWriteCommand();
			command.execute(request,response);
			nextPage="list.do";
		}
	RequestDispatcher dis=request.getRequestDispatcher(nextPage);
	dis.forward(request,response);
	}
}
