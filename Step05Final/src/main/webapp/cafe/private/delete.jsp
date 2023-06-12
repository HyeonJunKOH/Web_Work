<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//글 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//DB에삭제하기
	boolean isSuccess=CafeDao.getInstance().delete(num);
	//응답하기
	//삭제 성공하면 list.jsp로 리다이렉트 이동시키기
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>
