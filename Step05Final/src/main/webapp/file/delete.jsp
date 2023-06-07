<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 파일 번호를 이용해서 파일 정보를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	FileDto dto=FileDao.getInstance().getData(num);
	//로그인 된 아이디가 글의 작성자가 일치하는지 확인하기
	String id=(String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		//에러 응답하기
		response.sendError(403,"남의 파일 지우면 혼난다!");
		//메소드를 여기서 끝내기
		return;
	}
	//2. 해당 파일을 파일 시스템에서 실제로 삭제한다.
	//DB에 저장된 파일명을 불러온다.
	String path=application.getRealPath("/upload") + File.separator+dto.getSaveFileName();
	//파일 객체를 생성해서 DB에 저장된 파일 정보를 담는다.
	File f=new File(path);
	//delete 메소드를 호출한다.
	f.delete();
	//3. DB에서 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(dto);
	//4. 응답한다.
	//삭제 성공하면 list.jsp로 리다이렉트 이동시키기
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
%>
