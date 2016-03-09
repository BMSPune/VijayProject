<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eschool.css"> 

</head>
<body background="images/bg.jpg">
<div style="position:fixed;margin-top:5%;margin-left:5%;z-index:999;"><a href="index.jsp" style="color:#F30E0E;"><span class="glyphicon glyphicon-home"></span>Home</a></div>
<div>
	<h2 style="text-align:center;margin-top:2%;">School Management System</h2><br/>
	<form action="RegisterServlet"  method="post" class="form-horizontal" enctype="multipart/form-data">
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Name:</label>
			<div class="col-md-7">
				<input type="text" name="name"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Select Image:</label>
			<div class="col-md-7">
				<input type="file" name="image"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Student Id:</label>
			<div class="col-md-7">
				<input type="text" name="uname"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Password:</label>
			<div class="col-md-7">
				<input type="password" name="password"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Confirm Password:</label>
			<div class="col-md-7">
				<input type="password"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">E-mail ID:</label>
			<div class="col-md-7">
				<input type="text" name="email"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group hidden">	
			<label class="col-xs-5 control-label">Role:</label>
			<div class="col-md-7">
				<input type="text"  name="role" value="student"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Address:</label>
			<div class="col-md-7">
				<input type="text" name="address"/>
			</div>
		</div><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Year:</label>
			<div class="col-md-7">
				<select name="year">
					 <option value="default">---Select Year---</option>
					 <option value="First Year">First Year</option>
					 <option value="Second Year">Second Year</option>
					 <option value="Third Year">Third Year</option>
					 <option value="Final Year">Final Year</option>
				 </select>
			</div>
		</div><br/>		 
		<div class="col-md-12 form-group">	
			<label class="col-xs-5 control-label">Contact No.:</label>
			<div class="col-md-7">
				<input type="text" name="contact" maxlength="10"/>
			</div>
		</div><br/>
		<div class="submitCan">
			<input type="submit" value="Submit" name="add">&nbsp;&nbsp;&nbsp;		
			<input type="reset" value="Cancel">
		</div>
	</form> 
	
</div> 

<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>