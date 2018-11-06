package com.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.BookDao;
import com.entity.Book;

/**
 * Servlet implementation class AddBookServlet
 */
public class AddBookServlet extends HttpServlet {
	
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
		PrintWriter out = response.getWriter();
		String bookname = request.getParameter("bookName");
		String isbn = request.getParameter("isbn");
		String publisherID = request.getParameter("publisher");
		String price = request.getParameter("price");
		String count = request.getParameter("count");
		String pic = request.getParameter("pic");
		String description = request.getParameter("description");
		//封装
		Book book = new Book();
		book.setBookName(bookname);
		book.setIsbn(isbn);
		book.setPublisherID(Integer.parseInt(publisherID));
		book.setPrice(Double.parseDouble(price));
		if(count!=null&&!count.equals("")){
			book.setCount(Integer.parseInt(count));
		}
		//截取字符串
		String picName = pic.substring(pic.lastIndexOf("\\")+1);//用于去除路径，只留图片名
		book.setPic(picName);
		book.setDesciption(description);
		//将图书插入到数据库中
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String dbuser = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		BookDao dao = new BookDao();
		try{
			//连接数据库
			dao.getConn(server, dbname, dbuser, pwd);
			boolean r = dao.addBook(book);
			if(r){
				out.println("新书上架成功");
				out.println("<br><a href=' addBook.html'>返回</a>");
			}else {
				out.println("失败！");
				out.println("<br><a href=' addBook.html'>返回</a>");
			}
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
