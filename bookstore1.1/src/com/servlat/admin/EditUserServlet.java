package com.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.UserDao;
import com.entity.User;

/**
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
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
		PrintWriter out = response.getWriter();
		String username = request.getParameter("userName");
		String userpass = request.getParameter("userPass");
		String role = request.getParameter("role");
		String regtime = request.getParameter("regtime");
		String lognum = request.getParameter("lognum");
		//封装
		User user = new User();
		user.setUsername(username);
		user.setUserpass(userpass);
		user.setRole(Integer.parseInt(role));
		user.setRegtime(regtime);
		user.setLognum(Integer.parseInt(lognum));
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String dbuser = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		UserDao dao = new UserDao();
		try{
			//连接数据库
			dao.getConn(server, dbname, dbuser, pwd);
			boolean r = dao.editUser(user);
			if(r){
				response.sendRedirect("userManage.jsp");
			}else {
				out.println("失败！");
				out.println("<br><a href='userManage.jsp'>返回</a>");
			}
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

