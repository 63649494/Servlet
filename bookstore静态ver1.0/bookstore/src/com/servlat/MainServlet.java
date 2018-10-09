package com.servlat;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MainServlet
 */
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID=1L;	//作用:有了SUID之后，那么如果序列化的类已经保存了在本地中，中途你更改了类后，SUID变了，那么反序列化的时候就不会变成原始的类了，还会抛异常，主要就是用于版本控制。
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		String logtime = (String)session.getAttribute("logtime");
		out.println("登录名："+username+"&nbsp;登录时间："+logtime);
		out.println("欢迎"+username);
	}
}
