package com.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.entity.BoardDTO;
public class BoardSearchCommand implements BoardCommand {
   // 글 찾는 비즈니스 로직 처리 클래스
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      String searchName = request.getParameter( "searchName" );   //클라이언트에서 찾고싶은 이름을 받아온다.
      String searchValue = request.getParameter( "searchValue" );   //클라이언트에서 찾고싶은 값을 받아온다.

      BoardDAO dao = new BoardDAO();

      ArrayList<BoardDTO>  list = dao.search( searchName ,  searchValue );
      //DAO(데이터베이스)에서 serchName과 searchValue를 이용해 값이 있는지 찾아온다.

      request.setAttribute(  "list"  ,   list );   // 받아온 list를 jsp에 넘겨준다.


   }

}