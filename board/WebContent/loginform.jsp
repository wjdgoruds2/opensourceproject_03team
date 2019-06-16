<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE HTML>
<!--
   Arcana by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>회원가입 페이지</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="css/main.css" />
      <link rel="stylesheet" href="css/main2.css" />
      
      <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
      
      
      
      <style>
         body{
            text-align: center;
         }
         form{
            margin: 0px;
         }}
      </style>
      
      
<script> 
function writeCheck()
  {
   var form = document.writeform;
 
  if( !form.id.value )
   {
    alert( "ID을 적어주세요" );
    form.id.focus();
    return;
   }
  if( !form.password.value )
  {
   alert( "비밀번호를 적어주세요" );
   form.password.focus();
   return;
  }
  if( !form.name.value )
  {
   alert( "이름을 적어주세요" );
   form.name.focus();
   return;
  }
  if( !form.email.value )
  {
   alert( "이메일을 적어주세요" );
   form.email.focus();
   return;
  }
 
  form.submit();
  }
 </script>
   </head>
   <body class="is-preload">
      <div id="page-wrapper">

         <!-- Header -->
            <div id="header">

               <!-- Logo -->
                  <h1 id="logo">한눈에 보는 <em>문화 생활 정보</em></h1>

               <!-- Nav -->
                  <nav id="nav">
                     <ul>
                        <li class="current"></li>
                        <li>   
                        </li>
                     </ul>
                  </nav>
            </div>
      </div>
      
      <br/><br/>
      <div align="center">
      <span style="font-size: 50px;"><b>회원가입<b/></span>
      
      </div>
      
      <div class="form-container" align="center">
  <form class="form-1" action ="/board/join.do" method="post" name="writeform">
    <lable>ID
      <input type="id" name="id">
      </lable>

  <br/>

    <lable>PASSWORD
      <input class="input-2" type="password" name="password">
      </lable>
    <div class="progress-bar_wrap">
      <div class="progress-bar_item progress-bar_item-1"></div>
      <div class="progress-bar_item progress-bar_item-2"></div>
      <div class="progress-bar_item progress-bar_item-3"></div>
    </div>
    
    <lable>NAME
      <input class="input-3" type="name" name="name">
      </lable>
    
  <br/>

    <lable>EMAIL
      <input class="input-4" type="email" name="email">
      </lable>
    
    <br/><br/>
    
   <div style="text-align: center;">
      <input type=button class="btn btn-success" value="등록" Onclick="javascript:writeCheck();">
      <input type=button class="btn btn-secondary" value="취소" OnClick="window.location='login.jsp'">
   </div><br/>
  </form>
</div>


      <!-- Scripts -->
         <script src="js/jquery.min.js"></script>
         <script src="js/jquery.dropotron.min.js"></script>
         <script src="js/browser.min.js"></script>
         <script src="js/breakpoints.min.js"></script>
         <script src="js/util.js"></script>
         <script src="js/main.js"></script>
         <script src="js/main2.js"></script>

   </body>
</html>