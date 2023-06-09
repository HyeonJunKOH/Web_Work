package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행(DB에서 읽어왔다고 가정)
		String fortune="동쪽으로 가면 귀인을 만나요!";
		/*
		 * 	HttpServletRequest 객체의 setAttribute(key,value)메소드를 이용해서
		 * 	응답에 필요한 데이터를 담아둘수가 있다.
		 * 	담은 데이터는 응답하기 전까지 유효하며 응답을 마친 이후에는 없어지는 1 회성 데이터
		 * 	value 값은 object type을 리턴하므로 어떠한 형태든 다 받아줄 수 있다.
		 *  단, 얻어낼때도 object type으로 리턴되기 때문에 원래 type을 기억하고 있다가
		 * 	casting 하는 것이 필요하다.
		 * 
		 * 	ex) "fortuneToday" 라는 key 값으로 String type을 담았따면
		 *  얻어낼때는 아래와 같은 code 가 된다.
		 *  
		 *  String a =(String)request.getAttribute("fortuneToday");
		 * 
		 */
		req.setAttribute("fortuneToday", fortune);
		
		//응답을 여기서 하지 않고 jsp 페이지로 응답을 위임할수 있다.
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		/*
		 * 	webapp/test/fortune.jsp 페이지에게 응답을 대신하도록 하고
		 * 	서블릿에 전달 받았던 HttpServletRequest, HttpServletRespons 객체의 참조값을 전달해준다.
		 */
		rd.forward(req, resp);
	}
}
