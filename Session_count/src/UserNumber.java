

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserNumber
 */
public class UserNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserNumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext ctx = this.getServletContext();
		Integer counter = (Integer) ctx.getAttribute("UserNumber");
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>统计人数</title></head>");
		out.println("<body>");
		if(counter!=null){
			out.println("已经有"+counter+"人访问本网站！");
		}else {
			out.println("你是第一个访问本网站的人！");
		}
		out.println("</body></html>");
	}

}
