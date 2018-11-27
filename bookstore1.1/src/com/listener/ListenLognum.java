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
    	if(hsbe.getName().equals("username")||hsbe.getName().equals("adminuser")){
    		ServletContext ctx = hsbe.getSession().getServletContext();
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
    			String username = hsbe.getValue().toString();
    			String sql="UPDATE userdetail SET lognum=lognum+1 WHERE username="+username;//null+1=null
    			db.executeUpdate(sql, null);
    		}catch(ClassNotFoundException e){
    			e.printStackTrace();
    		}catch(Exception e){
    			e.printStackTrace();
    		}finally{
    			db.closeAll();
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
