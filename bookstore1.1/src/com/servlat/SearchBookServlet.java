package com.servlat;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.BookDao;
import com.entity.Book;

/**
 * Servlet implementation class SearchBookServlet
 */
public class SearchBookServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		response.setContentType("text/html;charset=gbk");
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		BookDao dao = new BookDao();
		List<Book> booklist = null;
		try{
			dao.getConn(server, dbname, user, pwd);
			booklist = dao.getAllBook();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(booklist!=null){
			request.setAttribute("bookList", booklist);
		}
		request.getRequestDispatcher("booklist.jsp").forward(request, response); //将请求转发到booklist.jsp这个页面
	}

}
