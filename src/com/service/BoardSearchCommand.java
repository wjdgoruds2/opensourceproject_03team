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

public class BoardSearchCommand extends HttpServlet {	
	public void execute(HttpServletRequest request, HttpServletResponse response){
		String searchName = request.getParameter("searchName");
		String searchValue=request.getParameter("searchValue");
		
		BoardDAO dao=new BoardDAO();
		ArrayList <BoardDTO> list= dao.search(searchName,searchValue);
		
		request.setAttribute("list",list);
	}
}
