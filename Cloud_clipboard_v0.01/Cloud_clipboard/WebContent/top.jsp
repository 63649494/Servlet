<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>查询结果</title>
</head>
<body topmargin="0px">
<%
//从Session中提取登录名
String clipId = (String)session.getAttribute("clipId");
String clipBoard = (String)session.getAttribute("clipBoard");
String logtime = (String)session.getAttribute("logtime");
%>
		<span>查询码：<%=clipId %></span>
		<span>内容：<%=clipBoard %></span>
		<span>登录时间：<%=logtime %></span>
</body>
</html>