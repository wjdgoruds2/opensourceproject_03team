<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script> 
		function writeCheck()
		  {
		   var form = document.writeform;
		   
		  if( !form.subject.value )
		   {
		    alert( "������ �����ּ���" );
		    form.subject.focus();
		    return;
		   }
		 
		  if( !form.content.value )
		   {
		    alert( "������ �����ּ���" );
		    form.content.focus();
		    return;
		   }  
		 
		  form.submit();
		  }
 	</script>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>BOARD ���̺� ���ڵ� ����</title>
</head>
<body>
	<div style="text-align:right">
		�����ID : ${id} <input type=button class="btn btn-info" value="�α׾ƿ�" OnClick="window.location='logout.do'">
	</div>
	<form action ="/board/modify.do" method="get">
		<c:forEach items="${articleList}" var="article">
			<input type="hidden" name="num" value="${article.num}">
			<table class="table table-striped table-bordered table-hover" style="text-align:center">
				<caption style="text-align:center">�Խ��� ����</caption>		
				<tr>
					<td>����</td>
					<td style="text-align:left"><input type="text" name="subject" value="${article.subject}"></td>
				</tr>
				<tr>	
					<td>�ۼ���</td>
					<td style="text-align:left">${article.id}</td>
				</tr>
				<tr>	
					<td>�ۼ�����</td>
					<td style="text-align:left">${article.boarddate}</td>
				</tr>
				<tr>	
					<td>email</td>
					<td style="text-align:left">${article.email}</td>
				</tr>
				<tr>	
					<td>����</td>
					<td style="text-align:left"><textarea name="content" rows="10" placeholder="������ �Է��ϼ���" form="inform">${article.content}</textarea></td>
				</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=submit class="btn btn-warning" value="����" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="���" OnClick="window.location='content.do?num=${article.num}'">
					</td>
				</tr>	
			</table>
		</c:forEach>
	</form>
</body>
</html>