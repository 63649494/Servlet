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
	//���booklistΪ�վ���ת��SBS����
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
					<td>ͼ��һ��</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td>&nbsp;ͼ������</td>
					<td>
						<input type="text" name="bookName">
					</td>
					<td>&nbsp;������</td>
					<td>
						<select name="publisher" id="publisher">
							<option value=""></option>
							<option value="1">�����ʵ������</option>
							<option value="2">�廪��ѧ������</option>
							<option value="3">���ӹ�ҵ������</option>
						</select>
					</td>
					<td>
						&nbsp;<botton onClick="select()" id="btnSearch" name="btnSearch">��ѯ</botton>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>