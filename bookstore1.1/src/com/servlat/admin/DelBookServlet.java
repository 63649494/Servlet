package com.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.BookDao;

/**
 * Servlet implementation class DelBookServlet
 */
public class DelBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelBookServlet() {
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
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		String delstr = request.getParameter("del");
		//用空格代替|
		String delstr2 = delstr.replace('|', ' ');
		//去除首尾无效空格
		delstr2.trim();
		//对字符串进行切分
		String del[] = delstr2.split(" ");
		ServletContext ctx = this.getServletContext();
		//通过ServletContext获取web.xml中设置的初始化参数
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String dbuser = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		BookDao dao = new BookDao();
		String flag = "false";
		try {
				//连接数据库
			dao.getConn(server,dbname,dbuser,pwd);
			//向books删除记录
			if(del.length>0){
				for(String isbn:del){
					dao.delBookByIsbn(isbn);//删除成功
				}
				flag = "true";
			}
		}catch(Exception e){
			e.printStackTrace();
			out.println("<br>出错了E");
		}finally{
			dao.closeAll();
			}
		out.println(flag);
		out.flush();
		out.close();
		}
}
