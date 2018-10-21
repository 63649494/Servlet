<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JSP动作</title>
</head>
<body>
<jsp:useBean id="user" class="model.UserBean" scope="request"/>
<jsp:setProperty property="name" name="user" param="loginName"/>
<jsp:setProperty property="pwd" name="user" param="password"/>
用户名：<jsp:getProperty property="name" name="user"/><br/> 
密&nbsp;码：<jsp:getProperty property="pwd" name="user"/>

</body>
</html>