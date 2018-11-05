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
	<jsp:forword page="SeachBookServlet">
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
		</td>
	</tr>
</table>
</body>
</html>