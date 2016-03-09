<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eschool.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker3.min.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		alert("Opeartion Carried Successfully!!!");
		$(location).attr("href","adminhome.jsp");
	});
</script>
</body>
</html>