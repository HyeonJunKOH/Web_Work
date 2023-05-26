<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String>list=(List)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/firend.jsp</title>
</head>
<body>
	<h1>친구목록</h1>
	<ul>
		<%for(String tmp:list){%>
			<li><%=tmp%></li>
		<%}%>
	</ul>
</body>
</html>