<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>�Խ���</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
<body>
<div style="text-align:right">
�����ID : ${id} <input type=button class="btn btn-info" value="�α׾ƿ�" OnClick="window.location='logout.do'"><br/><br/>
<input  type=button class="btn btn-danger" value="������� ���ư���" OnClick="window.location='list.do?'">
</div>
<c:if test="${not empty Replylist}"> 
<c:forEach items="${Replylist}" var="Arrayreply">
<table style="text-align:center" class="table table-striped table-bordered table-hover">
		<caption style="text-align:center">��� </caption>
		
		<tr >
				<td>��ȣ</td>
				<td style="text-align:left">${Arrayreply.count}</td>
				<td>����</td>
				<td colspan='2' style="text-align:left">${Arrayreply.title}</td>
				
		</tr>
		<tr>
			<td>�ۼ���</td>
			<td style="text-align:left">${Arrayreply.id}</td>		
			<td>�ۼ�����</td>
			<td style="text-align:left">${Arrayreply.boarddate}</td>					
		</tr>
			
		<tr >
			<td>����</td>
			<td  colspan='3' style="text-align:left">${Arrayreply.content}</td>						
		</tr>
			
		</table>
		<div style="text-align:right">
		<c:if test="${Arrayreply.id eq id}">
			<input type=button class="btn btn-danger" value="�����ϱ�" OnClick="window.location='replydelete.do?count=${Arrayreply.count}'">
			<input type=button class="btn btn-warning" value="�����ϱ�" OnClick="window.location='replymodifyform.do?count=${Arrayreply.count}'">	
		</c:if>	
		</div>
		</c:forEach>
		</c:if>
<c:if test="${empty Replylist}">
		 <script language=javascript>
				  	self.window.alert("�ۼ��� �ıⰡ �����ϴ�.ó�� �ı⸦ �����ּ���!");
				  	location.href="list.do";//���۹�ȣ�� ������ �����ҵ�?
		 </script>
		
		</c:if> 
	
</body>