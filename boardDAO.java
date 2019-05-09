package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO{
	
	DateSource dataFactory;
	
	public EmpDAO() {
		try {
			Context ctx = new initialContext();
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch(NamingException e) {
			e.printStackTrace();
		}//end list
	}
	
	//목록 보기
	public ArrayList<BoardDTO> list(){
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataFactory.getConnection();
			
			String query = "SELECT num, author, title, content, to_char(writeday,"
					+ "'YYYY/MM/DD') writeday, readcnt, repRoot, repStep, repindent FROM board order by repRoot desc, repStep asc";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repstep = rs.getInt("repStep");
				int replndent = rs.getInt("replndent");
				
				BOardDTO data = new BoardDTO();
				data.selNum(num);
				data.setAuthor(author);
				data.SetTitle(title);
				data.SetContent(content);
				data.setWriteday(writeday);
				data.setReadcnt(readcnt);
				data.setReadRoot(readRoot);
				data.setRepStep(repStep);
				data.setReplndent(replndent);
				list.add(data);
			}
			catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				}catch(SQLExeption e) {
					e.printStackTrace();
				}
			}//end finally
			
			return list;
		}
	}
	
	//글쓰기
	public void write(String _title, String _author, String _content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataFactory.getConnection();
			String query ="INSERT INTOboard(num, title, content, repRoot,"
					+ "repStep, replndent)values(board_seq.nextval,?,?,?,board_seq.currval,0,0)";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, _title);
			pstmt.setString(2, _author);
			pstmt.setString(3, _content);
			
			int n = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}//end finally
	}
	
	//조회수 1증가
	public void readCount(String _num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataFactory.getConnection();
			String query ="UPDATE board SET readcnt = readcnt + 1 WHERE num=+ _num";
			
			pstmt = con.prepareStatement(query);
			
			int n = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}//end finally
		
	}
	
	//글 자세히 보기
	public BoardDTO retrieve(String _num) {
		
		//조회수 증가
		readCount(_num);
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO data = new BoardDTO();
		
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM board WHERE num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  Integer.parseInt(_num));
			rs.pstmt.executeQuery();
			
			if(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String content = rs.getString("content");
				String writeday = rs.getV("writeday");
				int readcnt = rs.getInt("readcnt");
				
				data.setNum(num);
				data.setTitle(title);
				data.setAuthor(author);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadcnt(readcnt);
				
			}//end if
			
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
		}//end finally
		
		return data;
	}
	
	//글 수정하기
	public void update(String _num, String _title, String _author, String _content) {
		Connection con = null;
		PreparedState pstmt = null;
		
		try {
			con = dataFactory.getConnection();
			String query = "UPDATE board SET title = ?, author = ?, content = ? WHERE num = ?";
			
			pstmt = con.prepareStatement(query);
			
			pstmt = setString(1, _title);
			pstmt = setString(2, _author);
			pstmt = setString(3, _content);
			pstmt = setString(4, Integer.parseInt(_num));
			
			int n = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}//end finally
	}
	
	//글 삭제하기
	public void delete(String _num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = dataFactory.getConnection();
			String query ="DELETE FROM board WHERE num=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  Integer.parseInt(_num));
			int n = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}//end finally
		
	}//end delete
}//end class
