<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.User" %>
<%@ page import="com.db.UserDao" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ÍøÉÏÊéµêºóÌ¨¹ÜÀíÏµÍ³</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<script type="text/javascript">
	function select(){
		document.search.submit();
	}
	function ckbSelect(sta,flg){
		for(var i=0;i<document.getElementsByName(flag).length;i++){
			document.getElementsByName(flag)[i].checked = sta;
		}
	}
	function addIt(){
		window.location.href = "addUser.html";
	}
</script>
</head>
<body>

<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>ÓÃ»§Ò»ÀÀ</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		
		<form method="post" name="search" action="SearchUserServlet">
			<table>
				<tr>
					<td>&nbsp;Í¼ÊéÃû³Æ</td>
					<td>
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">²éÑ¯</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>ÓÃ»§ÐÅÏ¢ÁÐ±í</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="addIt()">ÐÂÔöÓÃ»§</button>
					<button onClick="deleteIt()">É¾³ý</button>
					<button onClick="editIt()">ÐÞ¸ÄÓÃ»§ÐÅÏ¢</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="checkAll" onClick="onclick=ckbSelect(this.checked,'userId')"></th>
							<th><span>ÐòºÅ</span></th>
							<th><span>ÓÃ»§Ãû</span></th>
							<th><span>ÃÜÂë</span></th>
							<th><span>ÓÃ»§Àà±ð</span></th>
							<th><span>×¢²áÊ±¼ä</span></th>
							<th><span>µÇÂ½´ÎÊý</span></th>
						</tr>
					</thead>
					<tbody>
						<%
							if(request.getAttribute("userList")==null){
								ServletContext ctx = this.getServletContext();
								String server = ctx.getInitParameter("server");//»ñÈ¡·þÎñÆ÷µØÖ·
								String dbname = ctx.getInitParameter("dbname");//»ñÈ¡Êý¾Ý¿âÃû
								String user = ctx.getInitParameter("user");//»ñÈ¡Êý¾Ý¿âµÇÂ¼Ãû
								String pwd = ctx.getInitParameter("pwd");//»ñÈ¡Êý¾Ý¿âÃÜÂë
								UserDao dao = new UserDao();
							}
						%>
					
						<!-- Ê¹ÓÃJSP½Å±¾Ñ­»·ÏÔÊ¾ -->
						<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td>
							<input type="checkbox" name="userId" value="${book.isbn }" calss="input_radio">
							</td>
							<td>${status.count}</td>
							<td>${book.bookName }</td>
							<td>
								<c:choose>
									<c:when test="${book.publisherID==1 }">
									ÈËÃñ³ö°æÉç</c:when>
									<c:when test="${book.publisherID==2 }">
									Çå»ª´óÑ§³ö°æÉç</c:when>
									<c:when test="${book.publisherID==3 }">
									µç×Ó¹¤Òµ³ö°æÉç</c:when>
								</c:choose>
							</td>
							<td>${book.isbn}</td>
							<td>${book.price}</td>
							<td>${book.count}</td>
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