package cb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		String clipBoard = request.getParameter("clipBoard");
		String clipId = request.getParameter("clipId");
		ServletContext ctx = this.getServletContext();
		//通过ServletContext获取web.xml中设置的初始化参数
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		DBOper db = new DBOper();
		try{	//查询随机码，有则返回剪贴板内容，没有则提示
			db.getConn(server, dbname, user, pwd);
			String sql = "SELECT clipBoard FROM clipboard WHERE clipId=?";
			ResultSet rs = db.executeQuery(sql, new String[]{clipId});
			if(rs!=null&&rs.next()){
				clipBoard = rs.getString("clipBoard");
				//获取Session
				HttpSession session = request.getSession();
				//讲登录名保存到Session
				session.setAttribute("clipId",clipId);
				session.setAttribute("clipBoard",clipBoard);
				//讲登录时间保存到Session中
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String logtime=dateFormat.format(new Date());
				session.setAttribute("logtime", logtime);
				//向客户端发送Cookie
				Cookie cookie = new Cookie("clipId",clipId);
				cookie.setMaxAge(60*60*24*30);
				response.addCookie(cookie);
				//跳转到MainServlet
				RequestDispatcher dispatcher = request.getRequestDispatcher("top.jsp");
				dispatcher.forward(request, response);
			}else{
				out.print("没有对应的随机码，操作失败");
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			out.print("操作失败c");
		}catch(Exception e){
			e.printStackTrace();
			out.print("操作失败e");
		}
	}

}
