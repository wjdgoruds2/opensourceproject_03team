<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
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
	<form id="inform" action ="/board/write.do" method="post">
		<table style="text-align:center" class="table table-striped table-bordered table-hover">
			<caption style="text-align:center">�Խ��� �ۼ�</caption>
			<tr >
				<th>����</th>
				<th style="text-align:left"><input type="text" name="subject"></th>
			</tr>
			<tr>
				<th>�ۼ���</th>
				<th style="text-align:left">${id} </th>
			</tr>
			<tr>
				<th>email</th>
				<th style="text-align:left"><input type="email" name="email"></th>
			</tr>
			<tr>	
				<th>����</th>
				<th style="text-align:left"><textarea name="content" rows="10" placeholder="������ �Է��ϼ���" form="inform"></textarea></th>
			</tr>	
			<tr>
				<th></th>
				<th style="text-align:right">		
					<input type=submit class="btn btn-success" value="���" Onclick="javascript:writeCheck();">
					<input type=button class="btn btn-secondary" value="���" OnClick="window.location='list.do'">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>