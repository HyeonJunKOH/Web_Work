<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일 목록을 얻어온다.
	List<CafeDto>list=CafeDao.getInstance().getList();
	//로그인된 아이디(로그인이 되어 있지 않으면 null이다.)
	String id=(String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/list.jsp</title>
</head>
<body>
<div class="container">
	<h1>게시글 목록 입니다.</h1>
	<a href="private/insert_form.jsp">새글 작성</a>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(CafeDto tmp:list){%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWriter()%></td>
					<td>
						<a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a>
					</td>
					<td><%=tmp.getViewCount()%></td>
					<td><%=tmp.getRegdate()%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
</div>
</body>
</html>