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
<title>ÍøÉÏÊéµêÏµÍ³</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//»ñÈ¡·þÎñÆ÷µØÖ·
	String dbname = ctx.getInitParameter("dbname");//»ñÈ¡Êý¾Ý¿âÃû
	String user = ctx.getInitParameter("user");//»ñÈ¡Êý¾Ý¿âµÇÂ¼Ãû
	String pwd = ctx.getInitParameter("pwd");//»ñÈ¡Êý¾Ý¿âÃÜÂë
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
		<td>Í¼ÊéÐÅÏ¢ÏêÏ¸</td>
	</tr>
	<tr >
		<td>Í¼Æ¬<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>Í¼ÊéÃû³Æ:</td>
					<td><%=book.getBookName() %></td>
				</tr>
				<tr>
					<td>ISBN:</td>
					<td><%=book.getIsbn() %></td>
				</tr>
				<tr>
					<td>³ö°æÉç:</td>
					<td>
						<%
							if(book.getPublisherID()==1){
						%>ÈËÃñÓÊµç³ö°æÉç<%
							}else if(book.getPublisherID()==2){
						%>Çå»ª´óÑ§³ö°æÉç<%
							}else if(book.getPublisherID()==3){
						%>µç×Ó¹¤Òµ³ö°æÉç<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>¼Û¸ñ:</td>
					<td><%=book.getPrice() %>£¤</td>
				</tr>
				<tr>
					<td>¿â´æÁ¿:</td>
					<td><%=book.getCount() %>(±¾/Ì×)</td>
				</tr>
				<tr>
					<td>Í¼Êé¼ò½é:</td>
					<td><%=book.getDescription() %></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">·µ»Ø</button>&nbsp;	<!-- ±ØÐëÐ´type="button"£¬·ñÔò»á×Ô¶¯Ìá½» -->
			<button  type="button" onClick="buy(<%=book.getIsbn() %>)" style="width:30%">Ìí¼Óµ½¹ºÎï³µ</button>&nbsp;
			<input type="hidden" name="isbn" value="<%=book.getIsbn()%>"/>
		</td>
	</tr>
</table>		
<%
	}
%>
</body>
</html>