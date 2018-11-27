<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@page import="com.db.UserDao,java.sql.*,com.entity.User,java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script type="text/javascript">


function ret(){
	window.location.href="userManage.jsp";
}
	
function sub(){
	var user = document.getElementById("userName").value;
	var pass = document.getElementById("userPass").value;
	if(user==null||user==""){
		alert("����д�û���");
		doucument.regist.userName.focus();
	}
	else if(pass==null||pass==""){
		alert("����д����");
		doucument.regist.userPass.focus();
	}
	else{
		document.form1.submit();
	}
}

function fun_check_form(){
}

function res(){
	document.getElementById("userName").value="";
	document.getElementById("userPass").value="";
	var chs = document.getElementByName("role");
	for(var i=0;i<chs.length;i++){
			chs[i].status = 'false';
	}
}

</script>
<title>��������̨����ϵͳ</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//��ȡ��������ַ
	String dbname = ctx.getInitParameter("dbname");//��ȡ���ݿ���
	String dbuser = ctx.getInitParameter("user");//��ȡ���ݿ��¼��
	String pwd = ctx.getInitParameter("pwd");//��ȡ���ݿ�����
	UserDao dao = new UserDao();
	try{
		dao.getConn(server, dbname, dbuser, pwd);
		String name = request.getParameter("userName");
		User user = dao.getUserByName(name);
		if(user!=null){
		pageContext.setAttribute("user", user);}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<form method="post" name="form1" action="EditUserServlet">
<table align="center">
	<tr align="center" valign="middle"><!--���� -->
		<td>
		<table style="width:300" cellSpacing=0 cellPadding=0 border=0 align="center">
			<TBODY>
			<tr valign="middle">
				<td class="title_td" height=12>�޸��û���Ϣ</td>
			</tr>
			<tr>
				<table style="width:300">
					<tr>
						<td class="item_td" width="26%">�û�����</td>
						<td class="input_td"><input type="text" name="userName" id="userName" value="${user.username }" style="width:100%" class="input_input" size=30></td>
					</tr>
					<tr>
						<td class="item_td" width="26%">���룺</td>
						<td class="input_td"><input type="text" name="userPass" id="userPass" value="${user.userpass }" style="width:100%" class="input_input" size=30></td>
					</tr>
					<tr>
						<td class="item_td" width="26%">�û����</td>
						<td class="input_td">
							<c:choose>
							<c:when test="${user.role==0 }">
							<input type="radio" name="role" value="0" checked>��ͨ�û�&nbsp;
							<input type="radio" name="role" value="1" >����Ա&nbsp;
							</c:when>
							<c:when test="${user.role==1 }">
							<input type="radio" name="role" value="0" >��ͨ�û�&nbsp;
							<input type="radio" name="role" value="1" checked>����Ա&nbsp;
							</c:when>
							<c:otherwise>
							<input type="radio" name="role" value="0" >��ͨ�û�&nbsp;
							<input type="radio" name="role" value="1" >����Ա&nbsp;
							</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="item_td" width="26%">ע��ʱ�䣺</td>
						<td class="input_td">
							<input type="text" name="regtime" value="${user.regtime }" style="width:100%" class="input_input" size=30>
						</td>
					</tr>
					<tr>
						<td class="item_td" width="26%">��½������</td>
						<td class="input_td">
							<input type="text" name="lognum" value="${user.lognum }" style="width:100%" class="input_input" size=30>
						</td>
					</tr>
				</table>
	</tr>
	<tr><!-- ��ť -->
	<td colspan="2" align="center">&nbsp;
		<button  type="button" onClick="ret()" style="width:20%">����</button>&nbsp;
		<button  type="button" onClick="res()" style="width:20%">����</button>&nbsp;
		<button  type="button" onClick="sub()" style="width:20%">�ύ</button>&nbsp;
	</td>
	</tr>
	</TBODY>
		</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>