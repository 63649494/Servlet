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
	//Èç¹ûbooklistÎª¿Õ¾ÍÌø×ªµ½SBS´¦Àí
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
					<td>Í¼ÊéÒ»ÀÀ</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td>&nbsp;Í¼ÊéÃû³Æ</td>
					<td>
						<input type="text" name="bookName">
					</td>
					<td>&nbsp;³ö°æÉç</td>
					<td>
						<select name="publisher" id="publisher">
							<option value=""></option>
							<option value="1">ÈËÃñÓÊµç³ö°æÉç</option>
							<option value="2">Çå»ª´óÑ§³ö°æÉç</option>
							<option value="3">µç×Ó¹¤Òµ³ö°æÉç</option>
						</select>
					</td>
					<td>
						&nbsp;<botton onClick="select()" id="btnSearch" name="btnSearch">²éÑ¯</botton>
					</td>
				</tr>
			</table>
			<div>
			<table>
				<tr>
					<td>
					<button onClick="showShop()" id="btnSave" name="btnSave">²é¿´¹ºÎï³µ</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><span>ÐòºÅ</span></th>
							<th><span>ÊéÃû</span></th>
							<th><span>³ö°æÉç</span></th>
							<th><span>ISBN</span></th>
							<th><span>¼Û¸ñ</span></th>
							<th><span>²Ù×÷</span></th>
						</tr>
					</thead>
					<tbody>
						<!-- Ê¹ÓÃJSP½Å±¾Ñ­»·ÏÔÊ¾ -->
						<%
							for(int i=0;i<bookList.size();i++){
								Book book = bookList.get(i);
						%>
						<tr>
							<td><%=i+1 %></td>
							<td><%=book.getBookName() %></td>
							<td><%
								if(book.getPublisherID()==1){
							%>ÈËÃñ³ö°æÉç<%
								}else if(book.getPublisherID()==2){
							%>Çå»ª´óÑ§³ö°æÉç<%
								}else if(book.getPublisherID()==3){
							%>µç×Ó¹¤Òµ³ö°æÉç<%
								}
							%>
							</td>
							<td><%=book.getIsbn() %></td>
							<td><%=book.getPrice() %></td>
							<td>²é¿´ÏêÇé</td>
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