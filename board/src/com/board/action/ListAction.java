/**
 * ����Ʈ�� �����ֱ� ���� Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.board;
import com.board.controller.CommandAction;
 
public class ListAction implements CommandAction {
	
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");    	    
    	Connection conn = null;
    	Statement stmt = null;
    	ResultSet rs = null;    	
    	
    	//�˻��ɼǰ� �˻����� �޾� ������ ����
    	String opt = request.getParameter("opt");
    	String condition = request.getParameter("condition");
    	int number = 1;
    	if(request.getParameter("number")!=null) {
    		number=  Integer.parseInt(request.getParameter("number"));
    	}
    	
    	
    	try {
    		HttpSession session = request.getSession();
    		//�α����� �Ǿ����� ������ �����˾��� �α���ȭ������ �̵�    		    		
    		String id = (String) session.getAttribute("id");    		
    		if(id == null){    			
    			return "loginerror.jsp";
    		}
    		
    		String jdbcDriver = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    		           // +
    					//		"useUnicode=true&characterEncoding = euc-kr";
    		String dbUser = "root";
    		String dbPass = "0714";
    		String query = null; 
    		
    		if(opt == null){    			
    			query = "select * from board order by boarddate desc";
    		}else if(opt.equals("0")){    			
    			query = "select * from board where subject like '%"+condition+"%' order by num";        		
    		}else if(opt.equals("1")){    			
    			query = "select * from board where content like '%"+condition+"%' order by num";        		
    		}else if(opt.equals("2")){    			
    			query = "select * from board where id like '%"+condition+"%' order by num";        		
    		}
    		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    		
    		stmt = conn.createStatement();    		
    		rs = stmt.executeQuery(query);    		
    		
    		ArrayList<board> articleList = new ArrayList<board>();    		
    		
    		while(rs.next()){
    			board article = new board();
    			article.setNum(rs.getInt("num"));
    			article.setSubject(rs.getString("subject"));
    			article.setContent(rs.getString("content"));
    			article.setId(rs.getString("id"));
    			article.setBoarddate(rs.getString("boarddate"));
    			article.setScore(rs.getString("score"));
    			article.setArea(rs.getString("area"));
    			article.setPerformdate(rs.getString("performdate"));
    			article.setPerformlocation(rs.getString("performlocation"));
    			article.setPerformtime(rs.getString("performtime"));
    			article.setType(rs.getString("type"));
    			article.setimgpath(rs.getString("imgpath"));
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
    		ex.printStackTrace();
    	} finally{
    		if(rs != null) try{rs.close();} catch(SQLException ex){}
    		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}
    		
    		if(conn != null) try{conn.close();} catch(SQLException ex) {}
    	}
 
        return "list.jsp";
 
    }
 
}