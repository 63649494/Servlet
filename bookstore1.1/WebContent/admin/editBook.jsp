<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@page import="com.db.BookDao,java.sql.*,com.entity.Book,java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script type="text/javascript">
function changPic(obj){
	var filename = obj.value;
	var filetype = filename.split(".");
	var filenumber = filetype.length-1;
	if(filetype[filenumber].toUpperCase()!="JPG"&&filetype[filenumber].toUpperCase()!="GIF"){
		alert("���ϴ�jpg��gif��ʽ��ͼƬ");
		obj.focus();
		return false;
	}else{
		document.getElementById("showPic").src=filename;
	}
}

function ret(){
	window.location.href="bookManage.jsp";
}
	
function sub(){
	document.form1.submit();
}

function fun_check_form(){
}

function checkIsFloat(){
	var nc=event.keyCode;
	if(nc<48||nc>57){
		if(nc==46){
			var s=document.form1.price.value;
			for(var i=0;i<s.length;i++){
				if(s.charAt(i)=='.'){
					event.keyCode=0;
					return;
				}
			}
		}else{
			event.KeyCode=0;
			return;
		}
	}
}

function res(){
	document.getElementById("bookName").value="";
	document.getElementById("publisher").value="";
	document.getElementById("price").value="";
	document.getElementById("count").value="";
	//document.getElementById("delFile").innerHTML="<input name=pic type=file size=18 onChange='changPic(this)'>"; ��֪���Ǹ����õ�
	document.getElementById("showPic").src="../images/sou1.png";
	document.getElementById("description").value="";
	
}


</script>
<title>��������̨����ϵͳ</title>
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

<form method="post" name="form1" action="EditBookServlet">
<table align="center">
			<tr>
		<td>�޸�ͼ����Ϣ</td>
	</tr>
	<tr >
		<td>ͼƬ<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>ͼ������:</td>
					<td>
					<input type="text" name="bookName" value="${book.bookName }" style="width:100%" class="input_input" size=30>
					</td>
				</tr>
				<tr>
					<td>ISBN:</td>
					<td><input type="text" name="isbn" value="${book.isbn }" style="width:100%" class="input_input" size=30 readonly></td>
				</tr>
				<tr>
					<td>������:</td>
					<td>
						<select name="publisher">
						<option value="${book.publisherID }">
							<c:choose>
								<c:when test="${book.publisherID==1}">�����ʵ������</c:when>
								<c:when test="${book.publisherID==2}">�廪��ѧ������</c:when>
								<c:when test="${book.publisherID==3}">���ӹ�ҵ������</c:when>
							</c:choose>
						</option>
						<option value="1">�����ʵ������</option>
						<option value="2">�廪��ѧ������</option>
						<option value="3">���ӹ�ҵ������</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>�۸�:</td>
					<td><input type="text" name="price" value="${book.price }" style="width:70%" class="input_input" size=30>��</td>
				</tr>
				<tr>
					<td>�����:</td>
					<td><input type="text" name="count" value="${book.count }" style="width:100%" class="input_input" size=30>(��/��)</td>
				</tr>
				<tr>
					<td>ͼ�����:</td>
					<td>
					<input name="pic" value="${book.pic}" id="pic" type="file" size="18" onChange="changPic(this)">
					</td>
				</tr>
				<tr>
					<td>ͼ����:</td>
					<td><textarea type="text" name="description" rows="12" style="width:100%" class="input_input" size=30>${book.description }</textarea></td>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">����</button>&nbsp;	<!-- ����дtype="button"��������Զ��ύ -->
			<button  type="button" onClick="res()" style="width:30%">����</button>&nbsp;
			<button  type="button" onClick="sub()" style="width:30%">�ύ</button>&nbsp;
		</td>
	</tr>
</table>		
</form>

</body>
</html>