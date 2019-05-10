package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.BoardDAO;

public class BoardUpdateCommand implements BoardCommand {
   // 글 수정하는 비즈니스 로직 처리 클래스
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      String num = request.getParameter("num");   //클라이언트에서 num을 받아온다.
      String title = request.getParameter( "title" ); //클라이언트에서 입력한 title을 받아온다.
      String author = request.getParameter( "author" );//클라이언트에서 입력한 author을 받아온다.
      String content = request.getParameter( "content" );//클라이언트에서 입력한 content을 받아온다.

      BoardDAO  dao = new BoardDAO();   //DAO(데이터베이스 관리)생성
      dao.update( num , title, author, content ); //DAO(데이터베이스)에 받아온 num, title, author, content를 입력(수정)한다.

   }

}