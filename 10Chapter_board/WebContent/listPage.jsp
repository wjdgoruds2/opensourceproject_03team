<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��Ϻ���</title>
</head>
<body>
<hr style="color:blue;">
<h1 style="text-align:center;">�Խ��� ��� ����</h1>
<hr style="color:blue;">
<center>
<table width=600 style="text-align:center;">
	<tr>
		<td colspan="6">
		 <form  action="search.do" >
				<select name="searchName" size="1">
					<option value="author">�ۼ���</option>
					<option value="title">������</option>
            </select>
				<input type="text"  name="searchValue" >
				<input type="submit" value="ã��">
          </form>
		</td>
	</tr>
    <tr>
	   <td>��ȣ</td>
	   <td>����</td>
	   <td>�ۼ���</td>
	   <td>��¥</td>
	   <td>��ȸ��</td>
	</tr>
<c:forEach items="${list}" var="dto">
   	<tr>
	   <td>${dto.num}</td>
	   <td>
	   <c:forEach begin="1" end="${dto.repIndent }">
	    <%= "&nbsp;&nbsp;" %>
	   </c:forEach>   
	   <a href="retrieve.do?num=${dto.num}">${dto.title}</a>
	   </td>
	   <td>${dto.author}</td>
	   <td>${dto.writeday}</td>
	   <td>${dto.readcnt}</td>
	</tr>

</c:forEach>	

<tr></tr>
    <!-- page -->
	<tr style="text-align:center">
		<br>
		<td colspan="6"><jsp:include page="page.jsp" flush="true"/></td>
	</tr>
	 </table>
	 </center>
	 <center>
<a href="writeui.do">�۾���</a>
</center>
</body>
</html>