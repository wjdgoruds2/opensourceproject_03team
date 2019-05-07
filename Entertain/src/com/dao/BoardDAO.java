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
		
	}


