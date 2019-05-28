<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script> 
		function writeCheck()
		  {
		   var form = document.writeform;
		   
		  if( !form.subject.value )
		   {
		    alert( "제목을 적어주세요" );
		    form.subject.focus();
		    return;
		   }
		 
		  if( !form.content.value )
		   {
		    alert( "내용을 적어주세요" );
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
	<title>BOARD 테이블 레코드 수정</title>
</head>
<body>
	<div style="text-align:right">
		사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<form action ="/board/modify.do" enctype="multipart/form-data" method="post" name="writeform">
		<c:forEach items="${articleList}" var="article">
				<input type="hidden" name="num" value="${article.num}">
			<table class="table table-striped table-bordered table-hover" style="text-align:center">
				<caption style="text-align:center">게시판 수정</caption>		
				<tr>
					<td>제목</td>
					<td style="text-align:left"><input type="text" name="subject" value="${article.subject}"></td>
				</tr>
				<tr>	
					<td>작성자</td>
					<td style="text-align:left">${article.id}</td>
				</tr>
				<tr>	
					<td>작성일자</td>
					<td style="text-align:left">${article.boarddate}</td>
				</tr>
				<tr>	
					<td>email</td>
					<td style="text-align:left">${article.email}</td>
				</tr>
				<tr>	
					<td>내용</td>
					<td style="text-align:left"><textarea name="content" rows="10" placeholder="내용을 입력하세요" >${article.content}</textarea></td>
				</tr>
				<tr>
				<th>공연지역</th>
				<th style="text-align:left" >
				<select name="area" >
	  			<option selected value="서울특별시">서울특별시</option>
	  			<option selected value="부산광역시">부산광역시</option>
	   			<option selected value="인천광역시">인천광역시</option>
	   			<option selected value="대구광역시">대구광역시</option>
	   			<option selected value="광주광역시">광주광역시</option>
	  			<option selected value="대전광역시">대전광역시</option>
	  			<option selected value="울산광역시">울산광역시</option>
	   			<option selected value="세종특별자치시">세종특별자치시</option>
	   			<option selected value="경기도">경기도</option>
	  			<option selected value="강원도">강원도</option>
	  		 	<option selected value="충청남도">충청남도</option>
	  			<option selected value="충청북도">충청북도</option>
	  			<option selected value="경상북도">경상북도</option>
	  			<option selected value="경상남도">경상남도</option>
	   			<option selected value="전라북도">전라북도</option>
	   			<option selected value="전라남도">전라남도</option>
	   			<option selected value="제주도">제주도</option>
	   			<option selected value="${article.area}">${article.area}</option>
	   			</select>
				</th>
				</tr> 	
			
			<tr>	
				<th>공연장소</th>
				<th style="text-align:left"><input type="text" name="performlocation" value="${article.performlocation}"></th>
			</tr>
			<tr>	
				<th>공연날짜</th>
				<th style="text-align:left"><input type="date" name="performdate" value="${article.performdate}"></th>
			</tr>
			<tr>	
				<th>공연시간</th>
				<th style="text-align:left"><input type="text" name="performtime" value="${article.performtime}"></th>
			</tr>
			<tr>	
				<th>분야</th>
				<th style="text-align:left">
				<select name="type">
	   				<option selected value="뮤지컬">뮤지컬</option>
	   				<option selected value="콘서트">콘서트</option>
	   				<option selected value="연극">연극</option>
	   				<option selected value="클래식/무용">클래식/무용</option>
	   				<option selected value="스포츠">스포츠</option>
	   				<option selected value="레저">레저</option>
	   				<option selected value="전시/행사">전시/행사</option>
	   				<option selected value="아동/가족">아동/가족</option>
	   				<option selected value="기타">기타</option>
	   				<option selected value="${article.type}">${article.type}</option>
				</th>
			</tr> 
			<tr>
				<th>첨부 이미지</th>
				<th style="text-align:left"> <input type="file" name="imgpath" value="${article.imgpath}" >
					<input type="hidden" name="imgpath1" value="${article.imgpath}">
				</th>
											
			</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=button class="btn btn-warning" value="수정" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='content.do?num=${article.num}'">
					</td>
				</tr>
					
			</table>
		
		</c:forEach>
	</form>
</body>
</html>