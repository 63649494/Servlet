<%@ page import="java.util.Date" language="java" contentType="text/html; charset=GBK"%>
<%--import：page指令 ,唯一一个可以在同一个JSP页面中出现多次的属性--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="1">
<title>第一个JSP页面</title>
</head>
<body>
	<h1 align="center">欢迎！</h1>
		<% 
		Date now = new Date();
		out.println("当前时间为："+now);
		%>
</body>
</html>