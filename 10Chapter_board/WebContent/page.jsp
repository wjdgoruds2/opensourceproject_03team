<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.entity.PageTO" %>

<%
		PageTO to  = ( PageTO)request.getAttribute( "page" );		
		int curPage = to.getCurPage();
		int perPage = to.getPerPage();
		int totalCount  = to.getTotalCount();
		int totalPage = totalCount / perPage;  // ������ ������ ��ȣ����
		if( totalCount  %  perPage  != 0 ) totalPage++;

		for( int i = 1 ; i <=  totalPage ; i++){

          if(  curPage == i ){
			 out.print( "<font size=5 color='blue'>"+i +"</font>" );				
		  }else{
			out.print( "<a href='list.do?curPage="+i+"'>"+i  +"</a>&nbsp;" );
		  }//end if
		}
%>
		