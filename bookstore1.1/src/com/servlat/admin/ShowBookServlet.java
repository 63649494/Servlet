package com.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.BookDao;
import com.entity.Book;

/**
 * Servlet implementation class ShowBookServlet
 */
public class ShowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String isbn = request.getParameter("isbn").trim();
		PrintWriter out = response.getWriter();
		//数据库
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		BookDao dao = new BookDao();
		String bookJson = "";
		try{
			dao.getConn(server, dbname, user, pwd);
			Book book = dao.getBookByIsbn(isbn);
			if(book!=null){
				bookJson = "{isbn:'"+book.getIsbn()+"',"
							+"bookName:'"+book.getBookName()+"',"
							+"publisherID:'"+book.getPublisherID()+"',"
							+"price:'"+book.getPrice()+"',"
							+"count:'"+book.getCount()+"',"
							+"pic:'"+book.getPic()+"',"
							+"description:'"+book.getDescription().trim()+
							"'"+"}";
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dao.closeAll();
		}
		out.println(bookJson);
		out.flush();
		out.close();
	}
}

