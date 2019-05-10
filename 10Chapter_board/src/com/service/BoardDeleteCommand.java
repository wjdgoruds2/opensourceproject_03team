package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;

public class BoardDeleteCommand implements BoardCommand {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      String num = request.getParameter("num");   //num에 해당되는 파라미터를 얻는다
      
         BoardDAO  dao = new BoardDAO();   
       dao.delete( num );               //num에 해당되는 파라미터를 얻어서 BoardDAO 클래스의 delete 메서드에 넘긴다.
   }
}