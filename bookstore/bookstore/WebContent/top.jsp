<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>�������ϵͳ</title>
<script language="javascript">
function userCancel(){
	if(window.confirm("ȷ��ע����")){		//������window��Ҫ˳�ִ��windows
		window.parent.location="./DestroyServlet";
	}
}
</script>
</head>
<body topmargin="0px">
<%
//��Session����ȡ��¼��
String username = (String)session.getAttribute("username");
String logtime = (String)session.getAttribute("logtime");
%>
	<div class="top_header">
	<img src="./images/banner01.jpg" style="cursor:auto"/>
		<div class="headfont" style="position:absolute;right:1px;top:58px;z-index:1000;">
		<span>��¼����<%=username %></span>
		<span>��¼ʱ�䣺<%=logtime %></span>
		<span onClick="userCancel()" style="cursor:hand">[ע��]</span>
		</div>
	</div>
</body>
</html>