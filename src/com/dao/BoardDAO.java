package com.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	DataSource dataFactory;
	
	public BoardDAO(){
		
	}
	
	//글쓰기
	public void write(){
	
	
	}
	
	//목록보기
	public ArrayList<BoardDTO> list(String _searchName, String _searchValue){
		ArrayList<BoardDTO> list =new ArrayList<BoardDTO>();
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		try{
			con=dataFactory.getConnection();
			
			String query="SELECT num, author, title, content, to_char(writeday,"
					+ "yyyy/mm/dd)writeday, redcnt FROM board";
			if(_searchName.equals("title")){
				query+="	WHERE title LIKE?";
			}else{
				query+="	WHERE author LIKE ?";
			}
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, "%"+_searchValue+"%");
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				int num=rs.getInt("num");
				String title=rs.getString("title");
				String author=rs.getString("author");
				String content=rs.getString("content");
				String writeday=rs.getString("writedat");
				int readcnt=rs.getInt("readcnt");
				
				BoardDTO data=new BoardDTO();
				data.setNum(num);
				data.setTitle(title);
				data.setAuthor(author);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadcnt(readcnt);
			
				list.add(data);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	
	return list;
	}
		
	//조회수 1증가
	public void readCount(String _num){
		
		Connection con=null;
		PreparedStatement pstmt =null;
		
		try{
			con=dataFactory.getConnection();
			String query="UPDATE board SET readcnt=readcnt+1 WHRE num="+_num;
			
			pstmt=con.prepareStatement(query);
			int n=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		
	}
	//글 자세히 보기
	public BoardDTO retrieve(String _num){
		readCount(_num);
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO data=new BoardDTO();
		
		try{
			con=dataFactory.getConnection();
			String query="SELECT*FROM board WHERE num=?";
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(_num));
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				int num=rs.getInt("num");
				String title=rs.getString("title");
				String author=rs.getString("author");
				String content=rs.getString("content");
				String writeday=rs.getString("writedat");
				int readcnt=rs.getInt("readcnt");
				
				data.setNum(num);
				data.setTitle(title);
				data.setAuthor(author);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadcnt(readcnt);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return data;
	}
	//글 수정하기
	public void update(String _num, String _title, String _author, String _content){
	
	}
	//글 삭제하기
	public void delete(String _num){
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			
			con=dataFactory.getConnection();
			String query="DELETE FROM board WHERE num= ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(_num));
			int n=pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
	}
	
	public BoardDTO replyui(String _num){
		Connection con=null;
		PreparedStatement pstmt=null;
		
		ResultSet rs=null;
		BoardDTO data=new BoardDTO();
		
		try{
			con=dataFactory.getConnection();
			String query="SELECT*FROM board WHERE num =?";
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(_num));
			rs=pstmt.executeQuery();
			if(rs.next()){
				data.setNum(rs.getInt("num"));
				data.setTitle(rs.getString("title"));
				data.setAuthor(rs.getString("author"));
				data.setContent(rs.getString("content"));
				data.setWriteday(rs.getString("writeday"));
				data.setreadcnt(rs.getString("readcnt"));
				data.setRepRoot(rs.getInt("repRoot"));
				data.setRepStep(rs.getInt("repStep"));
				data.setRepindent(rs.getInt("replndent"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					rs.close();
				if(con!=null)
					con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return data;
	}
}
