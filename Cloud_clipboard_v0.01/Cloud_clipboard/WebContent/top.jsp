<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>��ѯ���</title>
</head>
<body topmargin="0px">
<%
//��Session����ȡ��¼��
String clipId = (String)session.getAttribute("clipId");
String clipBoard = (String)session.getAttribute("clipBoard");
String logtime = (String)session.getAttribute("logtime");
%>
		<span>��ѯ�룺<%=clipId %></span>
		<span>���ݣ�<%=clipBoard %></span>
		<span>��¼ʱ�䣺<%=logtime %></span>
</body>
</html>