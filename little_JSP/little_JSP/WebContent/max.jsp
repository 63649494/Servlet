<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! private int a=34;
	private int b=40;
	public int max(int num1,int num2){
		return num1>num2?num1:num2;
	}
%>

<html>
<head>
<title>�����</title>
</head>
<body>
<%=a%>��<%=b%>�е������Ϊ<%=max(a,b)%>
</body>
</html>