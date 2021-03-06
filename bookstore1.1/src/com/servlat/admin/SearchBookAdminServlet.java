package com.servlat.admin;

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
public class SearchBookAdminServlet extends HttpServlet {
	
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
		//书
		String bookname = request.getParameter("bookName");
		String pid = request.getParameter("publisher");
		//数据库
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		BookDao dao = new BookDao();
		List<Book> booklist = null;
		try{
			dao.getConn(server, dbname, user, pwd);
			if(bookname!=null&&bookname.length()>0&&(pid==null||pid.equals(""))){
				//根据书名查
				booklist=dao.getBookByName(bookname);
			}else if(pid!=null&&pid.length()>0&&(bookname==null||bookname.equals(""))){
				//根据出版社查
				booklist=dao.getBookByPublisher(Integer.parseInt(pid));
			}else if(pid!=null&&pid.length()>0&&bookname!=null&&bookname.length()>0){
				booklist=dao.getBookByNameAndPubliser(bookname,Integer.parseInt(pid));
			}else{//返回所有图书列表
			booklist = dao.getAllBook();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		if(booklist!=null){
			//将图书列表保存到请求对象中
			request.setAttribute("bookList", booklist);
			request.getRequestDispatcher("bookManage.jsp").forward(request, response); //将请求转发到bookManage.jsp这个页面
		}
	}
}
