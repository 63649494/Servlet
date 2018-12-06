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
<title>�������ϵͳ</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//��ȡ��������ַ
	String dbname = ctx.getInitParameter("dbname");//��ȡ���ݿ���
	String user = ctx.getInitParameter("user");//��ȡ���ݿ��¼��
	String pwd = ctx.getInitParameter("pwd");//��ȡ���ݿ�����
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
		<td>ͼ����Ϣ��ϸ</td>
	</tr>
	<tr >
		<td>ͼƬ<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>ͼ������:</td>
					<td><%=book.getBookName() %></td>
				</tr>
				<tr>
					<td>ISBN:</td>
					<td><%=book.getIsbn() %></td>
				</tr>
				<tr>
					<td>������:</td>
					<td>
						<%
							if(book.getPublisherID()==1){
						%>�����ʵ������<%
							}else if(book.getPublisherID()==2){
						%>�廪��ѧ������<%
							}else if(book.getPublisherID()==3){
						%>���ӹ�ҵ������<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>�۸�:</td>
					<td><%=book.getPrice() %>��</td>
				</tr>
				<tr>
					<td>�����:</td>
					<td><%=book.getCount() %>(��/��)</td>
				</tr>
				<tr>
					<td>ͼ����:</td>
					<td><%=book.getDescription() %></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">����</button>&nbsp;	<!-- ����дtype="button"��������Զ��ύ -->
			<button  type="button" onClick="buy(<%=book.getIsbn() %>)" style="width:30%">��ӵ����ﳵ</button>&nbsp;
			<input type="hidden" name="isbn" value="<%=book.getIsbn()%>"/>
		</td>
	</tr>
</table>		
<%
	}
%>
</body>
</html>