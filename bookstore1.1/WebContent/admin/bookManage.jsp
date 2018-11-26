<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��������̨����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<script type="text/javascript">
	function select(){
		document.search.submit();
	}
	function ckbSelect(sta,flag){
		for(var i=0;i<document.getElementsByName(flag).length;i++){
			document.getElementsByName(flag)[i].checked = sta;
		}
	}
	function addIt(){
		window.location.href = "addBook.html";
	}
	function editIt(){
		var allCheck = document.getElementsByName("userId");
		var num = 0;
		var isbn="";
		for(var i=0;i<allCheck.length;i++){
			if(allCheck[i].checked){
				num++;
				isbn=allCheck[i].value;
			}
		}
		if(num==1){
			window.location.href="editBook.jsp?isbn="+isbn;
		}else if(num==0){
			alert("û��ѡ����Ϣ��");
			return;
		}else{
			alert("��ֻѡ��һ����Ϣ");
			return;
		}
		
	}
</script>
</head>
<body>
<c:if test="${bookList==null}">
	<jsp:forward page="SearchBookAdminServlet"></jsp:forward>
</c:if>
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
		
		<form method="post" name="search" action="SearchBookAdminServlet">
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
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">��ѯ</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>ͼ���б�</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="addIt()">����ͼ��</button>
					<button onClick="deleteIt()">ɾ��</button>
					<button onClick="editIt()">�޸�ͼ����Ϣ</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="checkAll" onClick="onClick=ckbSelect(this.checked,'userId')"></th>
							<th><span>���</span></th>
							<th><span>����</span></th>
							<th><span>������</span></th>
							<th><span>ISBN</span></th>
							<th><span>�۸�(��)</span></th>
							<th><span>�����(��/��)</span></th>
						</tr>
					</thead>
					<tbody><!-- һ��ʼ����ʾ��������Ϊjavabean�е�һ��Ԫ������ƴ���� -->
						<!-- ʹ��JSP�ű�ѭ����ʾ -->
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
									�����ʵ������</c:when>
									<c:when test="${book.publisherID==2 }">
									�廪��ѧ������</c:when>
									<c:when test="${book.publisherID==3 }">
									���ӹ�ҵ������</c:when>
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