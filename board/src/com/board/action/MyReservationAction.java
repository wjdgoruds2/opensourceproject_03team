/**
 * �Խ��� ������ ���� ǥ���ϴ� Action
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

import com.board.beans.reservation;
import com.board.controller.CommandAction;
 
public class MyReservationAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    	String dbUser = "root";
    	String dbPass = "0714";
    	Connection conn = null;
    	Statement stmt = null;    	
    	ResultSet rs = null;
    	String id = null;
    		try{
    			
    			HttpSession session = request.getSession();
    			id = (String) session.getAttribute("id");
        		if(id == null){
        			return "loginerror.jsp";
        		}
    			
        		request.setCharacterEncoding("UTF-8");
    			
    			
    			conn = DriverManager.getConnection(url,dbUser,dbPass);    			    			
    			String query =  "select * from reservation where id ='"+id+"' order by num desc";
    					
    			stmt = conn.createStatement();
    			
    			rs = stmt.executeQuery(query);
    			    			    	
    			ArrayList<reservation> articleList = new ArrayList<reservation>();
    			
        		while(rs.next()){        			
        			reservation article = new reservation();
        			article.setNum(rs.getInt("num"));  
        			article.setId(rs.getString("id"));
        			article.setEmail(rs.getString("email"));
        			article.setName(rs.getString("name"));
        			article.setArea(rs.getString("area"));
        			article.setSubject(rs.getString("subject"));
        			article.setPerformtime(rs.getString("performtime"));
        			article.setPerformdate(rs.getString("performdate"));
        			article.setPerformlocation(rs.getString("performlocation"));
        			article.setType(rs.getString("type"));
        			article.setPhone(rs.getString("phone"));
        			article.setCard(rs.getString("card"));
        			article.setBoarddate(rs.getString("boarddate"));
        			
        			articleList.add(article);
        		}
        		request.setAttribute("articleList",articleList);
        		
    			stmt.close();
    			conn.close();
    			rs.close();
    		 
     } catch(SQLException e) {
    	System.out.println( e.toString() );
    } finally{
    	if(rs != null) try{rs.close();} catch(SQLException ex){}
    	if(stmt != null) try{stmt.close();} catch(SQLException ex){}			
		if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
    	
 
        return "myreservation.jsp";
 
    }
 
}