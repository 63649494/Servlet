<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>color</title>
</head>
<body>
<%--ÉùÃ÷Á½¸öÑÕÉ«µÄÈ«¾Ö±äÁ¿ --%>
<%!
	private String color1 = "EFBEBEB";
	private String color2 = "F8F8F8";
%>

<!-- ±í¸ñ -->>
<table border='1' align='center'>
<% 
	for(int i=11;i<16;i++){
		String color = "";
		if(i%2==0){
			color=color1;
		}else{
			color=color2;
		}
%>	
<tr bgcolor="<%=color%>">
<td>
ÐÕÃû<%=i%>
</td>
<td>
<%=i%>
</td>
</tr>
<%
}	//´ËÓÒÀ¨ºÅ¶ÔÓ¦ÉÏ·½for£¬¿É¼ûJSPµÄ´úÂë¿ÉÒÔ·Ö¶Î£¬ÔÚº¯ÊýÖÐÌí¼Óhtml
%>
</table>

</body>
</html>