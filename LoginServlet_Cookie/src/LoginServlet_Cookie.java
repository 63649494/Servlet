

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

/**
 * Servlet implementation class LoginServlet_Cookie
 */
public class LoginServlet_Cookie extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cookieName = "userName";
		String cookiePwd = "pwd";
		Cookie[] cookies = request.getCookies();
		String userName = "";
		String pwd = "";
		String isChecked = "";
		//检测是否已登录过
		if(cookies!=null&&cookies.length>0){
			//若登录过 checkbox的状态应该是checked
			isChecked = "checked";
			for(int i=0;i<cookies.length;i++){
				//取登录名
				if(cookies[i].getName().equals(cookieName)){
					userName = cookies[i].getValue();
				}
				//取密码
				if(cookies[i].getName().equals(cookiePwd)){
					pwd = cookies[i].getValue();
				}
			}
		}
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println("<html>\n");
		out.println("<head><title>登录</title></head>\n");
		out.println("<body>\n");
		out.println("<center>\n");
		out.println("<form action='CookieTest'"+" method='post'>\n");
		out.println("姓名:<input type='text' name='UserName' value='"+userName+"'><br/>\n");
		out.println("密码:<input type='password' name='Pwd' value='"+pwd+"'><br/>\n");
		out.println("保存用户名和密码<input type='checkbox'"+" name='SaveCookie' value = 'Yes'"+isChecked+">\n");
		out.println("<br/>\n");
		out.println("<input type='submit'>\n");
		out.println("</form>\n");
		out.println("</center>");
		out.println("</body>\n");
		out.println("</html>\n");
		}
		
		//起初提交后会跳转到HTTP Status 404 The requested resource is not available的错误界面
		//原因是CookieTest一开始并没有按照标准的servlet构建而是用的普通java类，所以编译器没有自行更改web.xml，web.xml里没有CookieTest，所以会跳转错误 找不到地址

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
