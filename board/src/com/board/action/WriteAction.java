/**
 * 글을 작성 하고 데이터베이스에 넣는 Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;
 
public class WriteAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	request.setCharacterEncoding("UTF-8");
    	//제목과 내용을 입력 받아 변수에 저장
    	String subject = request.getParameter("subject");
    	String content = request.getParameter("content");
    	String area = request.getParameter("area");
    	String performtime = request.getParameter("performtime");
    	String performdate = request.getParameter("performdate");
    	String performlocation = request.getParameter("performlocation");
    	String type = request.getParameter("type");
    	
    	
    	
    	
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
    				"insert into board values(NULL,?,?,?,?,?,?,?,?,?,now(),0)");
    				pstmt.setString(1, id);
    				pstmt.setString(2, subject);
    				pstmt.setString(3, content);
    				pstmt.setString(4, area);
    				pstmt.setString(5, performtime);
    				pstmt.setString(6, performdate);
    				pstmt.setString(7, performlocation);
    				pstmt.setString(8, type);
    				pstmt.setString(9, email);
    				//쿼리 실행
    				pstmt.executeUpdate();
    				
    	} catch(SQLException ex){
			
		}finally{
    		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
    		if(conn != null) try{conn.close();} catch(SQLException ex){}
    		}
    	
 
        return "write.jsp";
 
    }
 
}