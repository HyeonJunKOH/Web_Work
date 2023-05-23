<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao=MemberDao.getInstance();
 	//회원 목록 얻어오기
 	List<MemberDto>list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>회원 목록 입니다.</h1>
		<table class="table table-success table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getName()%></td>
				<td><%=tmp.getAddr()%></td>
			</tr>
			<%}%>
			</tbody>
		</table>
	
	</div>
</body>
</html>