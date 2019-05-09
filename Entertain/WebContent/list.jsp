<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<%

	Connection conn=null;
	PreparedStatement pstmt=null;

	String jdbc_driver="com.mysql.jdbc.Driver";
	String jdbc_url="jdbc:mysql://localhost/jspdb?serverTimezone=UTC";

	try{
   		Class.forName(jdbc_driver);
   		conn=DriverManager.getConnection(jdbc_url,"root","038062");
   		String sql="insert into member values(?,?,?,?,?,?,?,?,?)";
   		pstmt=conn.prepareStatement(sql);
   		pstmt.setString(1,request.getParameter("num"));
   		pstmt.setString(2,request.getParameter("author"));
   		pstmt.setString(3,request.getParameter("title"));
   		pstmt.setString(4,request.getParameter("content"));
   		pstmt.setString(4,request.getParameter("writeday"));
   		pstmt.setString(4,request.getParameter("readcnt"));
   		pstmt.setString(4,request.getParameter("repRoot"));
   		pstmt.setString(4,request.getParameter("repStep"));
   		pstmt.setString(4,request.getParameter("repIndent"));
   
   		if(request.getParameter("num")!=null){
   			pstmt.executeUpdate();
   		}	
		}
	catch(Exception e){
   		System.out.println(e);
		}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록 보기</title>
</head>
<body>
	<h1>게시판 목록 보기</h1>
	
	<table border="1">
		<tr>
			<td colspan="5">
				<form action="search.do">
					<select name="searchName" size="1">
						<option value="author">작성자</option>
						<option value="title">글제목</option>
					</select>
					<input type="text" name="searchValue">
					<input type="submit" value="찾기"	>
				</form>
			</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.title}</td>
				<td>${dto.author}</td>
				<td>${dto.writeday}</td>
				<td>${dto.readcnt}</td>
			</tr>
		</c:forEach>	 
		</table>
		<a href="writeui.do">글쓰기</a>
</body>
</html>