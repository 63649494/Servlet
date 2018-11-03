package cb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddServlet
 */
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
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
		
		try {
			//连接数据库
		out.println("<br>这是添加字段页面desu");
		db.getConn(server,dbname,user,pwd);
		Random ra =new Random();
		int a=ra.nextInt(9999)+1;
		clipId=String.valueOf(a);
		out.println("<br>最终随机码为"+clipId);
		//向userdetail插入一条记录
		String sql = "INSERT INTO clipboard(clipId,clipBoard) values(?,?)";
		//执行插入操作，username和userpass放入数组当参数
		out.println("<br>clipBoard="+clipBoard+" clipId="+clipId);
		int rs = db.executeUpdate(sql, new String[]{clipId,clipBoard});
		out.println("<br>"+rs+"是当前rs值\n");
		if(rs>0){//插入成功
				out.println("<br>插入成功");
				out.println("<br>随机码为"+clipId);
				out.println("<br><a href='index.html'>请查询</a>");
		}else{
			out.println("<br>插入失败");
			out.println("<br><a href='index.html'>请重新插入</a>");		
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
		out.println("<br>出错了CNFE");
	}catch(Exception e){
		e.printStackTrace();
		out.println("<br>出错了E");
	}
	}
}

	
