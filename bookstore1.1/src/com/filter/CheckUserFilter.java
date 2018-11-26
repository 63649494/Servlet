package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class CheckUserFilter
 */
public class CheckUserFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CheckUserFilter() {
        // TODO Auto-generated constructor stub
    }
    
    private FilterConfig filterConfig;
    //登录界面，用户没登录时，将会首先转到这个页面
    private String loginPage = "adminLogin.jsp";
   

    public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//获得web.xml中的初始化参数
		filterConfig = config;
		if(filterConfig.getInitParameter("loginPage")!=null){
			loginPage = filterConfig.getInitParameter("loginPage");
		}
	}
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		filterConfig = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		//获得请求页面
		String uri = req.getRequestURI();
		//判断是否已登录
		HttpSession session = req.getSession(true);
		if(uri.endsWith(loginPage)||uri.endsWith("AdminLoginServlet")||session.getAttribute("adminuser")!=null){
			chain.doFilter(req, res);
			return;
		}else{
			res.sendRedirect(loginPage);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	

}
