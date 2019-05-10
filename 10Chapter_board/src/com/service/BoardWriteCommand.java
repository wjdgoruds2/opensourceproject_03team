package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;

//게시판 글쓰기 처리
public class BoardWriteCommand implements BoardCommand {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      //클라이언트가 요청(request)를 하면 서버에서 응답(response)해준다.
   
            String title = request.getParameter( "title" );   //클라이언트가 입력한 title을 받아온다.
            String author = request.getParameter( "author" ); //클라이언트가 입력한 author을 받아온다.
            String content = request.getParameter( "content" ); //클라이언트가 입력한 content를 받아온다.


            BoardDAO dao = new BoardDAO();   //DAO(데이터베이스)를 생성
            dao.write( title, author , content );   //DAO(데이터베이스)에 받아온 title, author, content를 입력한다.
      

   }

}