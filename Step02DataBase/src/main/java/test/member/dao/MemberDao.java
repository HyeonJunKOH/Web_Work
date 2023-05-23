package test.member.dao;
/*
 * 	Application 전역에서 MemberDao 객체는 오직 한개만 생성해서 사용하도록 구조를 만들어야 한다.
 * 
 *	1. 외부에서 객체 생성하지 못하도록 생성자의 접근 지정자는 private
 * 	2. 자신의 참조값을 저장할 수 있는 static 필드 만들기
 * 	3. 자신의 참조값을 리턴해주는 public 메소드 만들기
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//2.
	private static MemberDao dao;
	
	//1.
	private MemberDao() {}
	
	//3.
	public static MemberDao getInstance() {
		//서버 시작 후 최초 요청이라면
		if(dao==null) {
			dao=new MemberDao();
		}
		//필드에 지정된 참조값 리턴해주기
		return dao;
	}
	
	//회원 목록을 리턴해주는 메소드
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 미리 생성하기
		List<MemberDto> list=new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다
			//(connection pool에서 얻어오기)
			conn=new DbcpBean().getConn();
			//실행할 sql 문
			String sql="SELECT num, name, addr"
					+  " from member"
					+  " order by num asc";
			pstmt=conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			
			//select 문 수행하고 결과값 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 RusultSet에 담긴 내용 추출
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적 시키기
				list.add(dto);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();//connection이 connection pool에 반납된다.
			} catch (Exception e) {
				
			}
		}
		//회원목록이 담긴 ArrayList 객체 리턴해 주기
		return list;
		
	}
}
