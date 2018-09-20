import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

public class CookieTest extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Cookie userCookie = new Cookie("userName",request.getParameter("UserName"));
	Cookie pwdCookie = new Cookie("pwd",request.getParameter("Pwd"));
	if(request.getParameter("SaveCookie")!=null&&request.getParameter("SaveCookie").equals("Yes")){
		userCookie.setMaxAge(7*24*60*60);
		pwdCookie.setMaxAge(7*24*60*60);
	}else{
		userCookie.setMaxAge(0);
		pwdCookie.setMaxAge(0);
	}
	response.addCookie(userCookie);
	response.addCookie(pwdCookie);
	PrintWriter out = response.getWriter();
	out.println("Welcome,"+request.getParameter("UserName"));
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);}
}
