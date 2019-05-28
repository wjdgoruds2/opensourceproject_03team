/**
 * 글을 작성 하고 데이터베이스에 넣는 Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.reservation;
import com.board.controller.CommandAction;
 
public class ReservationAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	request.setCharacterEncoding("UTF-8");
    	//제목과 내용을 입력 받아 변수에 저장
    	String subject = request.getParameter("subject");
    	String email = request.getParameter("email");
    	String name = request.getParameter("name");
    	String area = request.getParameter("area");
    	String performtime = request.getParameter("performtime");
    	String performdate = request.getParameter("performdate");
    	String performlocation = request.getParameter("performlocation");
    	String type = request.getParameter("type");
    	String phone = request.getParameter("phone");
    	String card = request.getParameter("card");

    	
    	
    	
    	String id = null;
 
    	Class.forName("com.mysql.jdbc.Driver");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    
    	try{
    		HttpSession session = request.getSession();
    		//세션을 읽어 로그인 상태가 아니면 로그인 창으로 이동
        	id = (String) session.getAttribute("id");
        
    		if( id == null){
    			return "loginerror.jsp";
    		}
    		
    		String jdbcDriver = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    		          // +
						//		"useUnicode=true&characterEncoding = euc-kr";
			String dbUser = "root";
			String dbPass = "0714";
    		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
      		pstmt = conn.prepareStatement(      				
    				"insert into reservation values(NULL,?,?,?,?,?,?,?,?,?,?,?,now())");
    				pstmt.setString(1, id);
    				pstmt.setString(2, email);
    				pstmt.setString(3, name);
    				pstmt.setString(4, area);
    				pstmt.setString(5, subject);
    				pstmt.setString(6, performtime);
    				pstmt.setString(7, performdate);
    				pstmt.setString(8, performlocation);
    				pstmt.setString(9, type);
    				pstmt.setString(10, phone);
    				pstmt.setString(11, card);
    				//쿼리 실행
    				pstmt.executeUpdate();
    		
        			conn.close();
        			
    	} catch(SQLException ex){
			
		}finally{
    		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
    		if(conn != null) try{conn.close();} catch(SQLException ex){}
    		}
    	
 
        return "reservationcheck.jsp";
 
    }
 
}