<%@ page import="java.util.Date" language="java" contentType="text/html; charset=GBK"%>
<%--import��pageָ�� ,Ψһһ��������ͬһ��JSPҳ���г��ֶ�ε�����--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="1">
<title>��һ��JSPҳ��</title>
</head>
<body>
	<h1 align="center">��ӭ��</h1>
		<% 
		Date now = new Date();
		out.println("��ǰʱ��Ϊ��"+now);
		%>
</body>
</html>