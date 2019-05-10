package com.service;

import java.util.ArrayList;   //ArrayList 클래스를 import 한다.

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;   //BoardDAO 클래스를 import 한다.
import com.entity.BoardDTO;   //BoardDTO 클래스를 import 한다.

public class BoardListCommand implements BoardCommand {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      BoardDAO dao = new BoardDAO();
      
      ArrayList<BoardDTO> list = dao.list();   //BoardDAO를 접근하기 위하여 객체를 생성하고, 목록 보기를 구현한 List() 메서드를 호출하여 리턴받는다.
      
      request.setAttribute("list", list);      //리턴받은 데이터는 list.jsp에서 보여주기 위하여 request scope에 바인딩한다.
      

   }//end execute

}//end classs