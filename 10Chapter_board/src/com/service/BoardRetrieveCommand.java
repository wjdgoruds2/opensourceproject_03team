package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.BoardDAO;
import com.entity.BoardDTO;


public class BoardRetrieveCommand implements BoardCommand {
   //게시판 글 자세히 보기 비즈니스 로직 처리 클래스
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      String num = request.getParameter("num");   // 클라이언트에서 num을 받아온다.
      BoardDAO  dao = new BoardDAO();
      BoardDTO data = dao.retrieve( num );   //DAO(데이터베이스)에서 num에 해당되는 보드를 받아온다.
      
      request.setAttribute( "retrieve" , data ); // 받아온 data(개시판 글)를 retrieve값으로 jsp에 넘겨준다.
   }

}