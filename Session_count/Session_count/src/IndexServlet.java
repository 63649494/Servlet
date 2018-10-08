

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext ctx = this.getServletContext();
		synchronized(this){
			Integer counter = (Integer) ctx.getAttribute("UserNumber");
			int tmp = 0;
			if(counter==null){
				counter = new Integer(1);
			}else {
				tmp = counter+1;
				counter = new Integer(tmp);
			}
			ctx.setAttribute("UserNumber", counter);
		}
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>首页</title></head>");
		out.println("<body>这是第一页<br>");
		out.println("<a href='UserNumber'>人数统计</a>");
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
