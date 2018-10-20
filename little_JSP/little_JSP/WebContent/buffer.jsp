<%@ page language="java" contentType="text/html; charset=GBK"
buffer = "1kb" autoFlush = "false"
%>
<%--buffer为缓冲区的大小
	autoFlush表示是否自动清空缓冲区 false时满了会异常 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Buffer and autoFlush</title>
</head>
<body>
<%
	for(int i=0;i<1000;i++)
		out.println(i);
%>
</body>
</html>