package com.board.action;
 
import java.sql.*;
import java.util.ArrayList;
 


import javax.servlet.http.HttpServletRequest;
 
import javax.servlet.http.HttpServletResponse;
 
import javax.servlet.http.HttpSession;

import com.board.beans.reply;
 
import com.board.controller.CommandAction;
 
public class ContentreplyAction implements CommandAction {
	
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	
    	Connection conn = null;
    	Statement stmt = null;    	
    	ResultSet rs = null;   
 
    	
    	try {
    		//���� Ȯ���� �α��λ��°� �ƴϸ� �α���â ȣ��
    		HttpSession session = request.getSession();
    		String id = (String) session.getAttribute("id");
    		if(id == null){    			
    			return "loginerror.jsp";
    		}
    		
    		String jdbcDriver = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    		
    			//	+
    			//				"useUnicode=true&characterEncoding = euc-kr";
    		String dbUser = "root";
    		String dbPass = "0714";
    		String subject = request.getParameter("subject");
    		String query = "select * from reply where subject ='"+subject+"' order by boarddate desc";
    		
    		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    		
    		stmt = conn.createStatement();    		
    		rs = stmt.executeQuery(query);    		
    		
    		//��ȸ�� ����Ʈ�� �޾ƿ�
    		ArrayList<reply> Replylist = new ArrayList<reply>();    		
    		
    		while(rs.next()){
    			reply article = new reply();
    			article.setcount(rs.getInt("count"));
    			article.setSubject(rs.getString("subject"));
    			article.setTitle(rs.getString("title"));
    			article.setContent(rs.getString("content"));
    			article.setId(rs.getString("id"));
    			article.setEmail(rs.getString("email"));
    			article.setBoarddate(rs.getString("boarddate"));
    			
    			Replylist.add(article);
    		 
    		}
    		request.setAttribute("Replylist",Replylist);
    		
    	
    		
    	} catch(SQLException ex){
    		
    	} finally{
    		if(rs != null) try{rs.close();} catch(SQLException ex){}
    		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}
    		
    		if(conn != null) try{conn.close();} catch(SQLException ex) {}
    	}
 
        return "replylist.jsp";
 
    }
 
}