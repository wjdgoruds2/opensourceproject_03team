/**
 * 글을 작성 하고 데이터베이스에 넣는 Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
 
public class WriteAction implements CommandAction {
 
    @SuppressWarnings("deprecation")
	public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	//
		MultipartRequest multi = null;	

		int sizeLimit = 10 * 1024 * 1024 ; // 10메가입니다.
		String imgpath = request.getRealPath("/img");    // 파일이 업로드될 실제 tomcat 폴더의 WebContent 기준
		String subject="NONE";
    	String content="NONE";
    	String area="NONE";
    	String performtime ="NONE";
    	String performdate ="NONE";
    	String performlocation ="NONE";
    	String type="NONE";

		
		
		try{
			System.out.print(imgpath+"\n");
			multi=new MultipartRequest(request, imgpath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy()); 
			Enumeration<?> files = multi.getFileNames(); 
			String file1 = (String)files.nextElement(); 
			String filename1 = multi.getFilesystemName(file1); 
			
			if(filename1==null) {
    			imgpath=null;
    			
    		}
    		else {
    			imgpath = filename1;
    		}
			System.out.println(imgpath);
			
    	request.setCharacterEncoding("UTF-8");
    	//제목과 내용을 입력 받아 변수에 저장
    	subject = multi.getParameter("subject");
    	content = multi.getParameter("content");
    	content = content.replace("\r\n","<br>");
    	area = multi.getParameter("area");
    	performtime = multi.getParameter("performtime");
    	performdate = multi.getParameter("performdate");
    	performlocation = multi.getParameter("performlocation");
    	type =multi.getParameter("type");
    	
    	}catch (Exception e) {
		e.printStackTrace();	} 
    	
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
    				"insert into board values(NULL,?,?,?,?,?,?,?,?,?,?,now(),0)");
    				pstmt.setString(1, id);
    				pstmt.setString(2, subject);
    				pstmt.setString(3, content);
    				pstmt.setString(4, area);
    				pstmt.setString(5, performtime);
    				pstmt.setString(6, performdate);
    				pstmt.setString(7, performlocation);
    				pstmt.setString(8, type);
    				pstmt.setString(9, email);
    				pstmt.setString(10, imgpath);
    				
    				
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