<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JSP����</title>
</head>
<body>
<jsp:useBean id="user" class="model.UserBean" scope="request"/>
<jsp:setProperty property="name" name="user" param="loginName"/>
<jsp:setProperty property="pwd" name="user" param="password"/>
�û�����<jsp:getProperty property="name" name="user"/><br/> 
��&nbsp;�룺<jsp:getProperty property="pwd" name="user"/>

</body>
</html>