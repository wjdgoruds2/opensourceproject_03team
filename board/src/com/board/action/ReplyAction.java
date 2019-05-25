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

import com.board.beans.reply;
import com.board.controller.CommandAction;
 
public class ReplyAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	request.setCharacterEncoding("UTF-8");
    	//제목과 내용을 입력 받아 변수에 저장
    	String subject = request.getParameter("subject");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	String count = request.getParameter("count");
    	
    	
    	
    	
    	String id = null;
    	String email = null;
    	Class.forName("com.mysql.jdbc.Driver");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    
    	try{
    		HttpSession session = request.getSession();
    		//세션을 읽어 로그인 상태가 아니면 로그인 창으로 이동
        	id = (String) session.getAttribute("id");
        	email = (String) session.getAttribute("email");
    		if( id == null){
    			return "loginerror.jsp";
    		}
    		
    		String jdbcDriver = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    		          // +
						//		"useUnicode=true&characterEncoding = euc-kr";
			String dbUser = "root";
			String dbPass = "038062";
    		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
      		pstmt = conn.prepareStatement(      				
    				"insert into reply values(NULL,?,?,?,?,?,now())");
    				pstmt.setString(1, id);
    				pstmt.setString(2, subject);
    				pstmt.setString(3, title);
    				pstmt.setString(4, content);
    				pstmt.setString(5, email);
    				//쿼리 실행
    				pstmt.executeUpdate();
    		
        			conn.close();
        			
    	} catch(SQLException ex){
			
		}finally{
    		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
    		if(conn != null) try{conn.close();} catch(SQLException ex){}
    		}
    	
 
        return "reply.jsp";
 
    }
 
}