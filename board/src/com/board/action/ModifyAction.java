/**
 * ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;
import com.mysql.jdbc.PreparedStatement;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
 
public class ModifyAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    	String dbUser = "root";
    	String dbPass = "0714";
    	Connection conn = null;
    	Statement stmt = null;   
    	
    	String num="";
    	
    		try{   			
    			HttpSession session = request.getSession();
            	
        		if(session.getAttribute("id") == null){
        			return "loginerror.jsp";
        		}
        		
        		MultipartRequest multi = null;	

        		int sizeLimit = 10 * 1024 * 1024 ; // 10¸Þ°¡ÀÔ´Ï´Ù.
        		String imgpath = request.getRealPath("/img");    // ÆÄÀÏÀÌ ¾÷·ÎµåµÉ ½ÇÁ¦ tomcat Æú´õÀÇ WebContent ±âÁØ
        		String subject="NONE";
            	String content="NONE";
            	String area="NONE";
            	String performtime ="NONE";
            	String performdate ="NONE";
            	String performlocation ="NONE";
            	String type="NONE";
            	

        	        		
        		try{
        		
        		multi=new MultipartRequest(request, imgpath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy()); 
        		Enumeration<?> files = multi.getFileNames(); 
        		String file1 = (String)files.nextElement(); 
        		String filename1 = multi.getFilesystemName(file1); 
        		
        		if(filename1==null) {
        			imgpath=multi.getParameter("imgpath1");
        			
        		}
        		else {
        			imgpath =  filename1;
        		}

        		
        			
            	request.setCharacterEncoding("UTF-8");
            	//Á¦¸ñ°ú ³»¿ëÀ» ÀÔ·Â ¹Þ¾Æ º¯¼ö¿¡ ÀúÀå
            	
            	
            	subject = multi.getParameter("subject");
            	content = multi.getParameter("content");
            	area = multi.getParameter("area");
            	performtime = multi.getParameter("performtime");
            	performdate = multi.getParameter("performdate");
            	performlocation = multi.getParameter("performlocation");
            	type =multi.getParameter("type");
            	num = multi.getParameter("num"); 
            
            	
            	}catch (Exception e) {        	 
        		e.printStackTrace();	} 
    			
    			
        		System.out.println(imgpath);			
    			
    			conn = DriverManager.getConnection(url,dbUser,dbPass);    			    			    			
    					
    			stmt = conn.createStatement();
   			    			    		
    			String sql = "UPDATE board SET subject='" + subject + "' ,content='" + content + "' "
    					+ ",area='" + area + "' ,performlocation='" + performlocation + "' ,performdate='" + performdate + "' "
    							+ ",performtime='" + performtime + "' ,type='" + type + "' ,imgpath='" + imgpath + "',boarddate=NOW() WHERE num=" + num;
    			stmt.executeUpdate(sql);
    			
    			request.setAttribute("num", num);


    			stmt.close();
    			conn.close();    			
    		 
     } catch(SQLException e) {			
    	System.out.println( e.toString() );
    } finally{    	
    	
    	if(stmt != null) try{stmt.close();} catch(SQLException ex){}			
		if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
    		
        return "modify.jsp";
 
    }
 
}