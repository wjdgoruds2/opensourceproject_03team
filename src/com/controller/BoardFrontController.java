package com.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.*;

@WebServlet("+.do")
public class BoardFrontController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
		
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("EUC-KR");
		
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String com=requestURI.substring(contextPath.length());
		BoardCommand command =null;
		String nextPage=null;
		
		//목록 보기
		if(com.equals("/list.do")){
			command=new BoardListCommand();
			command.execute(request,response);
			nextPage="list.jsp";
		}
		
		//글쓰기 폼
		if(com.equals("/writeui.do")){
			nextPage="write.jsp";
		}
		
		//글쓰기
		if(com.equals("/write.do")){
			command=new BoardWriteCommand();
			command.execute(request, response);
			nextPage="list.do";
		}
		
		//글 자세히 보기
		if(com.equals("/retrieve.do")){
			command=new BoardRetrieveCommand();
			command.execute(request,response);
			nextPage="retrieve.jsp";
		}
		
		//글 검색하기
		if(com.equals("/search.do")){
			command=new BoardSearchCommand();
			command.excute(request,response);
			nextPage="list.jsp";
		}
		
		//답변글 입력 폼 보기
		if(com.equals("/replyui.do")){
			command=new BoardReplyCommand();
			command.excute(request,response);
			nextPage="reply.jsp";
		}
		
		RequestDispatcher dis=request.getRequestDispatcher(nextPage);
		dis.forward(request,response);
	}
}
