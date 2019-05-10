package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;


public class BoardReplyCommand implements BoardCommand {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      String num = request.getParameter("num");            //num에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
      String title = request.getParameter( "title" );         //title에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
      String author = request. getParameter( "author" );      //author에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
      String content = request.getParameter( "content" );      //content에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
      String repRoot = request.getParameter( "repRoot" );      //repRoot에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
      String repStep = request.getParameter( "repStep" );      //repStep에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
      String repIndent = request.getParameter( "repIndent" );   //repIndent에 reply.jsp에서 넘어온 파라미터 값을 얻는다.
   
      BoardDAO  dao = new BoardDAO();   //파라미터 값을 BoardDAO 클래스의 reply 메서드를 사용하여 전달한다.
       dao.reply( num, title, author, content, repRoot, repStep , repIndent );

   }

}