<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>��Ĺ��ﳵ</title>
<script type="javascript">
	function goOn(){}
	function ret(){}
</script>
</head>
<body>
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>�ҵĹ��ﳵ</td>
				</tr>
			</table>
			<div>
			<table>
				<tr>
					<td>
						<button onClick="ret()">��������</button>&nbsp;
						<button onClick="goOn()">��������</button>
					</td>
				</tr>
			</table>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th>���</th>
							<th>����</th>
							<th>�۸�(��)</th>
							<th>����(��/��)</th>
							<th>����</th>
						</tr>
					</thead>
					<tbody>
						<%
							//�����ܼ۸�
							double money = 0;
							//��ȡ���ﳵ�б�
							List<Book> cart = (List<Book>)session.getAttribute("cart");
							if(cart!=null){
								for(int i=0;i<cart.size();i++){
									Book book = cart.get(i);
									money = money + book.getPrice();
								
						%>
						<tr>
							<td><%=i %></td>
							<td><%=book.getBookName() %></td>
							<td><%=book.getPrice() %></td>
							<td><%=book.getCount() %></td>
							<td>�ӹ��ﳵ��ɾ��</td>
							<!--���</th>
							<th>����</th>
							<th>�۸�(��)</th>
							<th>����(��/��)</th>
							<th>����</th> -->
						</tr>
						<%
								}
							}
						%>
					</tbody>
				</table>
				<table>
					<tr>
						<td>�����۸�(��)��</td>
						<td><%=money %></td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>