

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SecondServlet
 */
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecondServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Object obj = request.getAttribute("request_param");
		String request_param = null;
		if(obj!=null){
			request_param=obj.toString();
		}else {
			request_param="null";
		}
		HttpSession session = request.getSession();
		Object obj2 = request.getAttribute("session_param");
		String session_param = null;
		if(obj2!=null){
			session_param = obj2.toString();
		}else {
			session_param = "null";
		}
		response.setContentType("text/heml;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h2>请求对象的参数为:"+request_param+"</h2>");
		out.println("<h2>Session对象的参数为:"+session_param+"</h2>");
		out.println("</body></html>");
		
	}

}
