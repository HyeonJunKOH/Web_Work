<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 title을 읽어온다.
	String title=request.getParameter("title");
	String viewCount=request.getParameter("viewCount");
	String content=request.getParameter("content");
	//글의 작성자(업로더)는 Httpsession 객체에서 읽어온다.
	String writer=(String)session.getAttribute("id");
	//업로드 된 글의 정보를 CafeDto에 담고
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setViewCount(viewCount);
	//DB에 저장하고 응답하기
	boolean isSuccess=CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<p>
			<%=writer%> 님이 업로드한 <%=content%> 게시글을 저장했습니다.
			<a href="${pageContext.request.contextPath}/cafe/list.jsp">글 목록보기</a>
		</p>
	<%}else{%>
		<p>
			업로드 실패!
			<a href="insert_form.jsp">다시 시도</a>
		</p>
	<%}%>
</body>
</html>