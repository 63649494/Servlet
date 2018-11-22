package com.listener;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.db.DBOper;

/**
 * Application Lifecycle Listener implementation class ListenLognum
 *
 */
public class ListenLognum implements HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public ListenLognum() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent hsbe)  { 
         // TODO Auto-generated method stub
    	if(hsbe.getName().equals("username"||hsbe.getName().equals("adminuser")))
		String username = request.getParameter("username");
		String userpass = request.getParameter("password");
		ServletContext ctx = this.getServletContext();
		//通过ServletContext获取web.xml中设置的初始化参数
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		DBOper db = new DBOper();
		try{
			//连接数据库
			db.getConn(server, dbname, user, pwd);
			//查询用户
			String sql="SELECT username,userpass,role FROM userdetail WHERE username=?AND userpass=?";
			//执行查询
			ResultSet rs=db.executeQuery(sql, new String[]{username,userpass});
			//合法用户
			if(rs!=null&&rs.next()){
				//获取Session
				HttpSession session = request.getSession();
				//讲登录名保存到Session
				session.setAttribute("username",username);
				//讲登录时间保存到Session中
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String logtime=dateFormat.format(new Date());
				session.setAttribute("logtime", logtime);
				//向客户端发送Cookie
				Cookie cookie = new Cookie("userName",username);
				cookie.setMaxAge(60*60*24*30);
				response.addCookie(cookie);
				//跳转到MainServlet
				//out.println("login success");
				RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
				dispatcher.forward(request, response);
			}else{//不合法用户
				out.println("login in false");
				out.println("<br><a href='login.jsp'>重新登录</a>");
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
