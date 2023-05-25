<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식의 한글이 깨지지 않게
	request.setCharacterEncoding("utf-8");
	//방명록에서 작성한 내용들 추출
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String pwd = request.getParameter("pwd");
	//추출한 방명록 정보를 GuestDto객체에 담는다.
	GuestDto dto=new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	//DB에 저장한다.
	GuestDao dao=GuestDao.getInstance();
	boolean isinsert=dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insert.jsp</title>
</head>
<body>
	<!-- 이 주석은 웹브라우저에게 출력되지만 웹브루아주거 무시하는 주석 -->
	<%-- 이 주석은 jsp페이지가 무시하는 주석(웹브라우저에 출력되지 않는다. --%>
	<%--javascript 응답하기 --%>
	<div class="container">
		<h1>알림</h1>
			<%if(isinsert){%>
				<p>
					<strong><%=writer%></strong> 님의 방명록이 작성 되었습니다.
					<a href="/Step02DataBase/guest/list.jsp">확인</a>
				</p>
				<%}else{%>
				<p>
					작성실패!
					<a href="insertform.jsp">다시 작성해주세요/</a>
				</p>
			<%}%>
	
	
	</div>
</body>
</html>