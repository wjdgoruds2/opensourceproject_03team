package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.BoardDAO;
public class BoardWriteCommand implements BoardCommand {

	public void execute(HttpServletRequest request,HttpServletResponse reponse)
	{
		String title=request.getParameter("title");
		String author=request.getParameter("author");
		String content=request.getParameter("content");
		
		BoardDAO dao=new BoardDAO();
		dao.write(title,author,content);
	}
}
