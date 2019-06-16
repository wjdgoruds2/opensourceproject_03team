package com.board.action;
 
import java.net.URLDecoder;
import java.sql.*;
import java.util.ArrayList;
 


import javax.servlet.http.HttpServletRequest;
 
import javax.servlet.http.HttpServletResponse;
 
import javax.servlet.http.HttpSession;

import com.board.beans.board;
 
import com.board.controller.CommandAction;
 
public class ContentTypeAction implements CommandAction {
	
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	//��ȣ�� �Է¹޾ƿ� ������ ����
    	Connection conn = null;
    	Statement stmt = null;    	
    	ResultSet rs = null;   
    	
    	int number = 1;
    	if(request.getParameter("number")!=null) {
    		number=  Integer.parseInt(request.getParameter("number"));
    	}
    	
    	//��ȸ�� ������ ���� ���� ����
    	int score = 0;
    	
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
    		String type = request.getParameter("type");  
        	String types = URLDecoder.decode(type,"UTF-8");
    		String query = "select * from board where type ='"+types+"' order by boarddate desc";
    		
    		request.setAttribute("types",types);
    		
    		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    		
    		stmt = conn.createStatement();    		
    		rs = stmt.executeQuery(query);    		
    		
    		//��ȸ�� ����Ʈ�� �޾ƿ�
    		ArrayList<board> articleList = new ArrayList<board>();
    		
    		while(rs.next()){
    			board article = new board();
    			article.setNum(rs.getInt("num"));    			
    			article.setSubject(rs.getString("subject"));
    			article.setContent(rs.getString("content"));
    			article.setId(rs.getString("id"));
    			article.setBoarddate(rs.getString("boarddate"));
    			score = Integer.parseInt(rs.getString("score")) + 1;
    			article.setScore(String.valueOf(score));
    			article.setEmail(rs.getString("email"));
    			article.setArea(rs.getString("area"));
    			article.setPerformdate(rs.getString("performdate"));
    			article.setPerformlocation(rs.getString("performlocation"));
    			article.setPerformtime(rs.getString("performtime"));
    			article.setType(rs.getString("type"));
    			articleList.add(article);
    		}

    		request.setAttribute("number",number );
    		request.setAttribute("number_",number+1 );
    		request.setAttribute("startnumber", (number-1)*4);
    		request.setAttribute("endnumber", (number-1)*4+3);
    		request.setAttribute("_number",number-1 );
    		request.setAttribute("_size",(articleList.size()/4)+1 );
    		request.setAttribute("articleList",articleList);
    	
    		
    	} catch(SQLException ex){
    		
    	} finally{
    		if(rs != null) try{rs.close();} catch(SQLException ex){}
    		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}
    		
    		if(conn != null) try{conn.close();} catch(SQLException ex) {}
    	}
 
        return "typelist.jsp";
 
    }
 
}