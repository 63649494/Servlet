

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletNumber
 */
public class ServletNumber extends HttpServlet {
	int number=0;
    public ServletNumber() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//因为有中文所以要写gbk
		response.setContentType("text/html;charset=GBK");
		//获取输出流
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		//同步
		synchronized (this) {
			number++;
			out.println("<h1>您是第"+number+"个访问该页面！</h1>");
		}

		out.println("</body>");
		out.println("</html>");
	}

}
