package com.service;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.BoardRetrieveCommand;
import com.dao.BoardDAO;
import com.service.*;

public class BoardReplyCommand extends HttpServlet {	
	public void execute(HttpServletRequest request, HttpServletResponse response){
		String num=request.getParameter("num");
		BoardDAO dao=new BoardDAO();
		
		BoardDTO data=dao.replyui(num);
		request.setAttribute("replyui", data);
	}
}
