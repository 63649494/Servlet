<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.db.BookDao" %>
<%@ page import="com.entity.Book" %>
<html>
<head>
<script type="text/javascript">
	function ret(){
		window.location.href="./booklist.jsp";
	}
	function buy(isbn){
		window.location.href="./BuyServlet?isbn="+isbn;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>网上书店系统</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//获取服务器地址
	String dbname = ctx.getInitParameter("dbname");//获取数据库名
	String user = ctx.getInitParameter("user");//获取数据库登录名
	String pwd = ctx.getInitParameter("pwd");//获取数据库密码
	BookDao dao = new BookDao();
	try{
		dao.getConn(server, dbname, user, pwd);
		String isbn = request.getParameter("isbn");
		Book book = dao.getBookByIsbn(isbn);
		pageContext.setAttribute("book", book);
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<%
	Book book = (Book)pageContext.getAttribute("book");
	if(book!=null){
%>
<table align="center">
			<tr>
		<td>图书信息详细</td>
	</tr>
	<tr >
		<td>图片<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>图书名称:</td>
					<td><%=book.getBookName() %></td>
				</tr>
				<tr>
					<td>ISBN:</td>
					<td><%=book.getIsbn() %></td>
				</tr>
				<tr>
					<td>出版社:</td>
					<td>
						<%
							if(book.getPublisherID()==1){
						%>人民邮电出版社<%
							}else if(book.getPublisherID()==2){
						%>清华大学出版社<%
							}else if(book.getPublisherID()==3){
						%>电子工业出版社<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>价格:</td>
					<td><%=book.getPrice() %>￥</td>
				</tr>
				<tr>
					<td>库存量:</td>
					<td><%=book.getCount() %>(本/套)</td>
				</tr>
				<tr>
					<td>图书简介:</td>
					<td><%=book.getDescription() %></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">返回</button>&nbsp;	<!-- 必须写type="button"，否则会自动提交 -->
			<button  type="button" onClick="buy(<%=book.getIsbn() %>)" style="width:30%">添加到购物车</button>&nbsp;
			<input type="hidden" name="isbn" value="<%=book.getIsbn()%>"/>
		</td>
	</tr>
</table>		
<%
	}
%>
</body>
</html>