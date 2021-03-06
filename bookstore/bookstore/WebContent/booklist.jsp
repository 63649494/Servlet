<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.Book" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
</head>
<body>
<%
	List<Book> bookList = (List<Book>)request.getAttribute("bookList");
	if(bookList==null){
	//如果booklist为空就跳转到SBS处理
%>
	<jsp:forward page="SearchBookServlet">
<%
	}
%>
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>图书一览</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td>&nbsp;图书名称</td>
					<td>
						<input type="text" name="bookName">
					</td>
					<td>&nbsp;出版社</td>
					<td>
						<select name="publisher" id="publisher">
							<option value=""></option>
							<option value="1">人民邮电出版社</option>
							<option value="2">清华大学出版社</option>
							<option value="3">电子工业出版社</option>
						</select>
					</td>
					<td>
						&nbsp;<botton onClick="select()" id="btnSearch" name="btnSearch">查询</botton>
					</td>
				</tr>
			</table>
			<div>
			<table>
				<tr>
					<td>
					<button onClick="showShop()" id="btnSave" name="btnSave">查看购物车</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><span>序号</span></th>
							<th><span>书名</span></th>
							<th><span>出版社</span></th>
							<th><span>ISBN</span></th>
							<th><span>价格</span></th>
							<th><span>操作</span></th>
						</tr>
					</thead>
					<tbody>
						<!-- 使用JSP脚本循环显示 -->
						<%
							for(int i=0;i<bookList.size();i++){
								Book book = bookList.get(i);
						%>
						<tr>
							<td><%=i+1 %></td>
							<td><%=book.getBookName() %></td>
							<td><%
								if(book.getPublisherID()==1){
							%>人民出版社<%
								}else if(book.getPublisherID()==2){
							%>清华大学出版社<%
								}else if(book.getPublisherID()==3){
							%>电子工业出版社<%
								}
							%>
							</td>
							<td><%=book.getIsbn() %></td>
							<td><%=book.getPrice() %></td>
							<td>查看详情</td>
						</tr>
						<%		} %>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>