<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ʮ����</title>
</head>
<body>
<%
	int sum=0;
	for(int i=1;i<=10;i++){
		sum+=i;
		out.println(i+"&nbsp;&nbsp;");
	}
	out.println("<br>��ʮ�����ĺ�Ϊ"+sum);
%>
</body>
</html>