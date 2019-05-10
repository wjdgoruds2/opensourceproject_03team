package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.entity.BoardDTO;


public class BoardReplyUICommand implements BoardCommand {
   //답변 글 입력 폼 보기 로직 처리 클래스
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      String num = request.getParameter("num");   //클라이언트에서 num을 받아온다.
      BoardDAO  dao = new BoardDAO();      
      BoardDTO data = dao.replyui( num );   //DAO(데이터베이스)에서 num에 해당하는 답변을 받아옴
      
      request.setAttribute( "replyui" , data );   // data(답변 글)를 replyui값으로 jsp에 넘겨준다.

   }

}