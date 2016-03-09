<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/eschool.css"> 
</head>
<body background="images/bg.jpg">
<div style="position:fixed;margin-top:5%;margin-left:5%;z-index:999;"><a href="index.jsp" style="color:#F30E0E;"><span class="glyphicon glyphicon-home"></span>Home</a></div>
<form class="logcont form-horizontal" action="LoginServlet" method="post">
	<h2>School Management System</h2><br/>
	Username&nbsp;&nbsp;&nbsp;<input type="text" name="name"/><br/><br/>
	Password&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password"/><br/><br/>
	<input type="submit" value="Submit">
	<input type="reset" value="Cancel"><br/>
</form> 
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
  
</body>
</html>