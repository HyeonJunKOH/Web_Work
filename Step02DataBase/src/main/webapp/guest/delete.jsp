<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 글의 정보를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String pwd=request.getParameter("pwd");
	//2. DB에서 삭제 한다.
	GuestDto dto=new GuestDto();
	dto.setNum(num);
	dto.setPwd(pwd);
	boolean isdelete=GuestDao.getInstance().delete(dto);
	//3. 응답한다.


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/delete.jsp</title>
</head>
<body>
	<%if(isdelete){%>
		<% 
			//삭제 성공하면 list.jsp로 리다이렉트 이동시키기
			String cPath=request.getContextPath();
			response.sendRedirect(cPath+"/guest/list.jsp");
		%>
	<%}else{%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			location.href="${pageContext.request.contextPath}/guest/list.jsp";
		</script>
	<%}%>
</body>
</html>