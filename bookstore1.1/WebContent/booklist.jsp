<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<script type="text/javascript">
	function showShop(){
		window.parent.frmMain.location = "cart.jsp";
	}
	function select(){
		document.search.submit();
	}
</script>
</head>
<body>
<c:if test="${bookList==null}">
	<jsp:forward page="SearchBookServlet"></jsp:forward>
</c:if>
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
		
		<form method="post" name="search" action="SearchBookServlet">
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
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">查询</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>图书列表</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
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
					<tbody><!-- 一开始不显示数据是因为javabean中的一个元素名字拼错了 -->
						<!-- 使用JSP脚本循环显示 -->
						<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${book.bookName }</td>
							<td>
								<c:choose>
									<c:when test="${book.publisherID==1 }">
									人民邮电出版社</c:when>
									<c:when test="${book.publisherID==2 }">
									清华大学出版社</c:when>
									<c:when test="${book.publisherID==3 }">
									电子工业出版社</c:when>
								</c:choose>
							</td>
							<td>${book.isbn}</td>
							<td>${book.price}</td>
							<td>
								<a href="book.jsp?isbn=${book.isbn}">查看详情</a>
								<a href="BuyServlet?isbn=${book.isbn}">
									<img src="./images/buy.gif" width="40" height="17" style="border:0px"/>
								</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>