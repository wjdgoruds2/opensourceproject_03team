package com.service;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

import com.dao.*;
import com.entity.*;

public class BoardRetrieveCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response){
		String num=request.getParameter("num");
		BoardDAO dao=new BoardDAO();
		BoardDTO data=dao.retrieve(num);
		
		request.setAttribute("retrieve", data);
	}
}
