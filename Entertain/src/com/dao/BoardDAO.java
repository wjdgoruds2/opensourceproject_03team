package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.catalina.Context;
import org.apache.tomcat.jdbc.pool.DataSource;

import com.entity.BoardDTO;



public class BoardDAO {
	DataSource dataFactory;

	public BoardDAO() {
		try {
			Context ctx=new InitialContext();
			dataFactory=(DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		}catch(NamingException e) {
			e.printStackTrace();
		}
		
		}
		public ArrayList<BoardDTO> list(){
			ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				con=dataFactory.getConnection();
				
				String query="SELECT num,author,title,content,to_char(writeday,'YYYY/MM/DD')writeday,readcnt,repRoot,repStep,repIndent FROM board order by repRoot desc,repStep asc";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					int num=rs.getInt("num");
					String author=rs.getString("author");
					String title=rs.getString("title");
					String content=rs.getString("content");
					String writeday=rs.getString("writeday");
					int readcnt=rs.getInt("readcnt");
					int repRoot=rs.getInt("repRoot");
					int repStep=rs.getInt("repStep");
					int repIndent=rs.getInt("repIndent");
					
					BoardDTO data=new BoardDTO();
					data.setNum(num);
					data.setAuthor(author);
					data.setTitle(title);
					data.setContent(content);
					data.setReadcnt(readcnt);
					data.setRepRoot(repRoot);
					data.setRepStep(repStep);
					data.setRepIndent(repIndent);
					list.add(data);
				}
						
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			return list;
		}
		
	
public void update(String _num, String _title, String _author, String _content) {

	Connection con = null;
	PreparedStatement pstmt = null;

	try {
		con = DriverManager.getConnection(this.url, this.username, this.pass);
		String query = "UPDATE board SET  title = ?  ,  author = ? , content = ?  WHERE num = ?";

		pstmt = con.prepareStatement(query);

		pstmt.setString(1, _title);
		pstmt.setString(2, _author);
		pstmt.setString(3, _content);
		pstmt.setInt(4, Integer.parseInt(_num));

		int n = pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}// end update

public void makeReply(String _root, String _step) {
	Connection connection = null;
	PreparedStatement pstmt = null;

	try {
		connection = DriverManager.getConnection(this.url, this.username, this.pass);
		String query = "UPDATE board SET repStep = repStep + 1 WHERE  repRoot = ? AND  repStep > ? ";
		pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(_root));
		pstmt.setInt(2, Integer.parseInt(_step));
		int n = pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (connection != null)
				connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}//

public void reply(String _num, String _title, String _author, String _content, String _repRoot, String _repStep, String _repIndent) {
	
	makeReply(_repRoot, _repStep);
	Connection connection = null;
	PreparedStatement pstmt = null;
	try {
		connection = DriverManager.getConnection(this.url, this.username, this.pass);
		String query = "INSERT INTO board ( title, author, content, repRoot, repStep, repIndent ) values ( ? , ? , ? , ?, ?, ?) ";
		pstmt = connection.prepareStatement(query);

		pstmt.setString(1, _title);
		pstmt.setString(2, _author);
		pstmt.setString(3, _content);
		pstmt.setInt(4, Integer.parseInt(_repRoot));
		pstmt.setInt(5, Integer.parseInt(_repStep) + 1);
		pstmt.setInt(6, Integer.parseInt(_repIndent) + 1);

		int n = pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (connection != null)
				connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}// end reply
}


