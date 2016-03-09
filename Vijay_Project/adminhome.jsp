<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Admin</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/eschool.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css">
</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">School Management System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">    
      <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
	    <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="width:180px;">${sessionScope.user.name}<span></span>
	    <img class="img-circle" style="width:20%;" src="ProfilePicture?id=${sessionScope.user.id }"/>
	    <span class="caret"></span></a>
	    <ul class="dropdown-menu">
	      <li><a href="#"> <c:out value="${sessionScope.user.role}"/></a></li>
	      <li><a href="LogoutServlet">Logout</a></li>
	    </ul>
	  </li>
      </ul>
    </div>
  </div>
</nav>


<div class="container-fluid">
<ul class="nav nav-pills nav-justified">
	<li class="active"><a data-toggle="pill" href="#home">Home</a></li>
    <li><a data-toggle="pill" href="#timetable">Timetable</a></li>  
    <li><a data-toggle="pill" href="#menu1">Books</a></li>
    <li><a data-toggle="pill" href="#menu2">Teacher</a></li>
    <li><a data-toggle="pill" href="#menu3">Subject</a></li>
    <li><a data-toggle="pill" href="#menu4">Upload Study Material</a></li>
</ul>  
  
  <div class="tab-content border1" style="margin-top:2%;padding:1%;">
  	<div id="home" class="tab-pane fade in active">
      <h1>HOME</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="timetable" class="tab-pane fade">
      <h1>TIMETABLE</h1>
      <input type="button"  value="Change Year" class="btn btn-default" id="change_yy"></input>
      <input type="button" value="Add Timetable" class="btn btn-default" id="add_tt"></input>
      <input type="button" value="Update Timetable" class="btn btn-default" id="update_tt"></input>
      <input type="button"  value="View Timetable" class="btn btn-default" id="view_tt"></input>
	<div class="default-text">Welcome Page</div>
	<div class="about-add_tt hide">
	  <div class="container">
		  <c:if test="${sessionScope.timetableYear!=null}">
		  	Adding Timetable for ${sessionScope.timetableYear}		            
		  <h3><b><u>Add Timetable</u></b></h3> 
		  	<form action="TimeTableController"  method="post" class="form-horizontal">
				<div class="col-md-12">	
					<div class="col-md-6 form-group">
					<label class="col-xs-3 control-label">Date:</label>
					<div class="col-md-6">				
		    			<div class="form-group">
				            <div class="input-group date" id="datetimepicker1">
				                <input id="datepicker1" type="text" class="form-control"  name="date" />	<span class="input-group-addon"><span id="cal" class="glyphicon-calendar glyphicon"></span></span>
				            </div>
				            <input id="outputAdd" class="hidden" name="week"  readonly="readonly"  value="weekDa();"  />
				        </div>
		        </div>
					</div>	
				</div><br/><br/><br/>
						
				<table class="table table-responsive table-hover table-bordered" id="ttview">
				    <thead>
				      <tr>
				        <th>Time slot</th>
				        <th>Subject</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>9:00 a.m.-10:00 a.m.</td>
				        <td>
				        <select id="sub" name="lecture0" required>
				        <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>					 
						</select>
						</td>
				      </tr>
				      <tr>
				        <td>10:00 a.m.-11:00 a.m.</td>
				        <td>
				        <select id="sub" name="lecture1" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>
						</select>
						</td>
				      </tr>
				      <tr>
				        <td>11:00 a.m.-12:00 a.m.</td>
				        <td>
				        <select id="sub"  name="lecture2" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>
						</select>
						</td>
				      </tr>
				      <tr>
				        <td class="submitCan">12:00 a.m.-01:00 p.m.</td>
				        <td class="submitCan">Break Time</td>
				      </tr>
				      <tr>
				        <td>01:00 p.m-02:00 p.m</td>
				        <td>
				        <select id="sub" name="lecture3" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>
						</select>
						</td>
				      </tr>
				      <tr>
				        <td>02:00 p.m-03:00 p.m</td>
				        <td>
				        <select id="sub" name="lecture4" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>
						</select>
						</td>
				      </tr>
				      <tr>
				        <td>03:00 p.m-04:00 p.m</td>
				        <td>
				        <select id="sub" name="lecture5" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>
						</select>
						</td>
				      </tr>
				    </tbody>
				  </table>
				
				<div class="submitCan">
					<input type="submit" name="add" value="Submit"/>
					<input type="reset" value="Cancel"/>
				</div>
			</form>
			</c:if>
			  <c:if test="${sessionScope.timetableYear==null }">
			    	<br/><h1>Please select Year From (Change Year) Tab before performing operations.</h1> 
			    </c:if>  
		</div>
	</div>
	<div class="about-update_tt hide">
	  <div class="container">		 
		  <c:if test="${sessionScope.timetableYear!=null}">
		  	Updating Timetable for ${sessionScope.timetableYear}		     
		  		<form action="TimeTableController"  method="post" class="form-horizontal">
				<div class="col-md-6"> 						
						<div class="form-group">
				            <div class="input-group date" id="datetimepicker2">
				                <input name="date" id="datepicker2" type="text" class="form-control" />	<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
				            </div>
				        </div>
					<input class="hidden" type="text" name="year" value="${sessionScope.timetableYear}"/>							
					<input type="submit" value="Get List" />
				</div>				
				</form>
				<c:if test="${sessionScope.timetable!=null }">
				<form method="post" action="TimeTableController">
				<table class="table table-responsive table-hover table-bordered" id="updatettview">
				    <thead>
				      <tr>
				        <th>Time slot</th>
				        <th>Existing</th>
				        <td>Updated</td>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach var="lecture" items="${sessionScope.timetable }" varStatus="index">
				    <tr>
				    	<td>${lecture.timming }</td>
				    	<td>${lecture.lecture }</td>
				    	<td class="hidden"><input value="${lecture.id }" name="id${index.index }"/></td>
				    	<td>
				    		<select name="lect${index.index }" required>
				    		<c:forEach var="subject" items="${sessionScope.subList }">				    		
				    			<option value="${subject.subname }">${subject.subname }</option>				    							    	
				    		</c:forEach>
				    		</select>
				    	</td>				    	
				    </tr>
				    </c:forEach>				    
				    </tbody>
				  </table>				
				<div class="submitCan">
					<input type="submit" value="Update" name="update"/>					
				</div>
			</form>
			</c:if>
			</c:if>  
			  <c:if test="${sessionScope.timetableYear==null }">
			    	<br/><h1>Please select Year From (Change Year) Tab before performing operations.</h1> 
			    </c:if>
		</div>
	</div>
	<div class="about-view_tt hide">
	  <div class="container">		  
		  <c:if test="${sessionScope.timetableYear!=null}">
		  	Viewing Timetable for ${sessionScope.timetableYear}		  
		  		<div class="row">
					<form action="TimeTableController" method="post">
					<div class="col-md-4">
						<h4 style="text-align:right;">Select a date</h4>
					</div>
			          <div class="col-md-6">
			            <div class="form-group">
				            <div class="input-group date" id="datetimepicker3">
				                <input name="date" id="datepicker3" type="text" class="form-control" />	<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
				            </div>
				        </div>
				         <div id="output"></div>
			          </div>
			         <input class="hidden" type="text" name="year" value="${sessionScope.timetableYear}"/>
			          <input type="submit"/>
					</form>			  					
					<c:if test="${sessionScope.timetable!=null }">
			          <table class="table table-responsive table-hover table-bordered">
					    <thead>
					      <tr>
					        <th>Time</th>
					        <th>Lecture</th>					        
					      </tr>
					    </thead>
					    <tbody>
					    	<c:forEach items="${sessionScope.timetable }" var="lecture">
					    		<tr>
						    	<td>${lecture.timming }</td>	
						    	<td>${lecture.lecture }</td>			     
					        </tr> 					 
					    	</c:forEach>
					    </tbody>
					  </table>
					  </c:if>
			    </div>
			    </c:if>        
			    <c:if test="${sessionScope.timetableYear==null }">
			    	<br/><h1>Please select Year From (Change Year) Tab before performing operations.</h1> 
			    </c:if>
		</div>
	</div>
	<div class="about-change_yy hide">
		<form action="SubControllerServlet" method="post">
			<select name="year">
				<c:forEach var="year" items="${sessionScope.yearsList }">
					<option value="${year}">${year}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Get Subject"/>
		</form>
	</div>
    </div>
    
    <div id="menu1" class="tab-pane fade">
      <h1>Books</h1>
      <input type="button" value="Add Books" class="btn btn-default" id="add_book"/>
      <input type="button" value="Update Books" class="btn btn-default" id="update_book"/>
      <input type="button" value="Delete Books" class="btn btn-default" id="delete_book"/>
      <input type="button"  value="View all Books" class="btn btn-default" id="view_book"/>
	<div class="default-text">Welcome Page</div>
	<div class="about-view_book hide">
	  <div class="container">
		  <h3><b><u>Books Available</u></b></h3>            
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Book Name</th>
		        <th>Author</th>
		        <th>Price</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${sessionScope.booksList }" var="book">
		      <tr>
		      <td><c:out  value="${book.name }"/></td>
		      <td><c:out  value="${book.author }"/></td>
		      <td><c:out  value="${book.price }"/></td>
		      </tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
	<div class="about-add_book hide">
	  <h3><b><u>Add Book</u></b></h3>
	  <form action="BookServlet"  method="post" class="form-horizontal">
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Name of the book:</label>
			<div class="col-md-5">
				<input type="text" name="name" required/>
			</div>
		</div>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Author of the book:</label>
			<div class="col-md-5">
				<input type="text" name="author" required/>
			</div>
		</div>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Price of the book:</label>
			<div class="col-md-5">
				<input type="text" name="price" required/>
			</div>
		</div>
		<!-- <div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Upload the book:</label>
			<div class="col-md-5">
				<input type="file"/>
			</div>
		</div> -->
		<input type="submit" value="Submit" name="add"/>
		<input type="reset" value="Cancel"/>
	</form>
   </div>
	<div class="about-update_book hide">
	  <h3><b><u>Update a book</u></b></h3>
	  <div class="container">         
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Book Name</th>
		        <th>Author</th>
		        <th>Price</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>
		     <c:forEach items="${sessionScope.booksList }" var="book">
		      <form method="post" action="BookServlet">
		      <tr>
		      <td class="hidden"><input type="text" value="<c:out value="${book.id }" ></c:out>" name="id"/></td>		        
		        <td><input type="text" value="<c:out value="${book.name}"></c:out>" name="name"/></td>
		        <td><input type="text" value="<c:out value="${book.author}"></c:out>" name="author"/></td>
		        <td><input type="text" value="<c:out value="${book.price}"></c:out>" name="price"/></td>
		        <td><span class="glyphicon glyphicon-edit"></span><input type="submit" value="Update"  name="update"/></td>		      
		      </tr>
		      </form>
		      </c:forEach>
		    </tbody>
		  </table>
	</div>
	</div>
	<div class="about-delete_book hide">
	  <h3><b><u>Delete a book</u></b></h3>
	  <div class="container">         
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Book Name</th>
		        <th>Author</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${sessionScope.booksList }" var="book">
		      <tr>
		        <td><c:out value="${book.name }"></c:out></td>
		        <td><c:out value="${book.author }"></c:out></td>
		        <td><c:out value="${book.price }"></c:out></td>		        		        
		        <td><a href="BookServlet?id=<c:out value="${book.id }"></c:out>"><span class="glyphicon glyphicon-remove"></span>&nbsp;Delete</a></td>
		      </tr>		
		      </c:forEach>      
		    </tbody>
		  </table>
	</div>
	</div>    
    </div>
    
    <div id="menu2" class="tab-pane fade">
        <h1>Teacher</h1>
      <input type="button" value="Add Teacher" class="btn btn-default" id="add_teacher"></input>
      <input type="button" value="View Teacher" class="btn btn-default" id="view_teacher"></input>
      <input type="button" value="Update Teacher" class="btn btn-default" id="update_teacher"></input>
      <input type="button" value="Delete Teacher" class="btn btn-default" id="delete_teacher"></input>
	<div class="default-text">Welcome Page</div>
	<div class="about-view_teacher hide">
	  <div class="container">
		  <h3><b><u>Teacher Details</u></b></h3>            
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Teacher Name</th>
		        <th>E-mail ID</th>
		        <th>Contact Address:</th>
		        <th>Contact No:</th>
		        <th>Profile Picture:</th>
		        <th>Username</th>
		        <th>Password</th>
		      </tr>
		    </thead>
		    <tbody>
		     <c:forEach items="${sessionScope.staffList }" var="staff">
		      <tr>		        
		       <td><c:out value="${staff.name }"></c:out></td>
		       <td><c:out value="${staff.email }"></c:out></td>
		        <td><c:out value="${staff.address }"></c:out></td>
		        <td><c:out value="${staff.contact }"></c:out></td>
		        <td><image class="img-responsive img-circle" style="height:100px;width:100px;" src = "ProfilePicture?id=<c:out value="${staff.id }"></c:out>" /><input type="file" name="profpic"/></td>
		        <td><c:out value="${staff.uname }"></c:out></td>
		        <td><c:out value="${staff.password }"></c:out></td>		        
		      </tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
	<div class="about-add_teacher hide">
	  <h3><b><u>Add Teacher</u></b></h3>
	  <form action="RegisterServlet"  enctype="multipart/form-data"  method="post" class="form-horizontal">
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Name of the Teacher:</label>
			<div class="col-md-5">
				<input type="text" name="name" required/>
			</div>
		</div><br/><br/><br/>
				<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Profile Picture:</label>
			<div class="col-md-5">
				<input type="file" name="profpic" required/>
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Email ID:</label>
			<div class="col-md-5">
				<input type="email" name="email" required/>
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Contact Address:</label>
			<div class="col-md-5">
				<input type="text" name="address" required/>
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Contact No:</label>
			<div class="col-md-5">
				<input type="text" name="contact" required/>
			</div>			
		</div><br/><br/><br/>
		<div class="col-md-12 form-group hidden">	
			<label class="col-xs-3 control-label">Role:</label>
			<div class="col-md-5">
				<input name="role"  value="teacher" required/ >
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Username:</label>
			<div class="col-md-5">
				<input type="text" name="uname" required/>
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Password:</label>
			<div class="col-md-5">
				<input type="text" name="password" required/>
			</div>
		</div><br/><br/><br/>
		<div class="submitCan">
			<input type="submit" value="Submit" name="add"/>
			<input type="reset" value="Cancel"/>
		</div>
	</form>
   </div>
	<div class="about-update_teacher hide">
	  <h3><b><u>Update Teacher</u></b></h3>
	  <div class="container">         
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Teacher Name</th>
		        <th>E-mail ID</th>
		        <th>Contact Address:</th>
		        <th>Contact No:</th>
		        <th>Profile Picture:</th>
		        <th>Username</th>
		        <th>Password</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${sessionScope.staffList }" var="staff">
		      <form method="post" action="RegisterServlet" enctype="multipart/form-data">
		      <tr>		        
		        <td class="hidden"><input  value="<c:out value="${staff.id }"></c:out>"  name="id" type="text"/></td>
		        <td class="hidden"><input value="<c:out value="${staff.role }"></c:out>"  name="role" type="text"/></td>
		       <td><input class="form-control" value="<c:out value="${staff.name }" ></c:out>" name="name" type="text"/></td>
		       <td><input class="form-control" value="<c:out value="${staff.email }"></c:out>" name="email" type="text"/></td>
		        <td><input class="form-control" value="<c:out value="${staff.address }"></c:out>" name="address" type="text"/></td>
		        <td><input class="form-control" value="<c:out value="${staff.contact }"></c:out>" name="contact" type="text"/></td>
		         <td><image class="img-responsive img-circle" style="height:100px;width:100px;" src = "ProfilePicture?id=<c:out value="${staff.id }"></c:out>" />
		         <input type="file" value="<c:out value="${staff.profPic }"></c:out>"  name="profpic"/></td>
		        <td><input class="form-control" value="<c:out value="${staff.uname }"></c:out>" name="uname" type="text"/></td>
		        <td><input class="form-control" value="<c:out value="${staff.password }"></c:out>" name="password" type="text"/></td>
		        <td><input class="form-control  btn btn-info" value="Update" type="submit" name="update"/></td>		      
		      </tr>
		      </form>
		      </c:forEach>
		    </tbody>
		  </table>
	</div>
	</div>
	<div class="about-delete_teacher hide">
	  <h3><b><u>Delete Teacher</u></b></h3>
	  <div class="container">         
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Teacher Name</th>
		        <th>E-mail ID</th>
		        <th>Contact Address:</th>
		        <th>Contact No:</th>
		        <th>Username</th>
		        <th>Password</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${sessionScope.staffList }" var="staff">
		      <tr>		        
		       <td><c:out value="${staff.name }"></c:out></td>
		       <td><c:out value="${staff.email }"></c:out></td>
		        <td><c:out value="${staff.address }"></c:out></td>
		        <td><c:out value="${staff.contact }"></c:out></td>
		        <td><c:out value="${staff.uname }"></c:out></td>
		        <td><c:out value="${staff.password }"></c:out></td>
		        <td><a href="RegisterServlet?id=<c:out value="${staff.id }"></c:out>"><span class="glyphicon glyphicon-remove"></span>&nbsp;Delete</a></td>
		      </tr>
		      </c:forEach>
		    </tbody>
		  </table></div>
	</div> 
    </div>
    
    <div id="menu3" class="tab-pane fade">
      <h1>Subject</h1>
      <input type="submit" value="Add Subject" class="btn btn-default" id="add_subject"></input>
      <input type="submit" value="View all Subjects" class="btn btn-default" id="view_subject" name="view"></input>      
      <input type="submit" value="Update Subject" class="btn btn-default" id="update_subject" name="update"></input>
      <input type="submit" value="Delete Subject" class="btn btn-default" id="delete_subject" name="delete"></input>
	<div class="default-text">Welcome Page</div>
	<div class="about-view_subject hide">
	  <div class="container">
		  <h3><b><u>Subject detail</u></b></h3>            
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Subject Name</th>
		        <th>Teacher</th>
		        <th>Class</th>
		      </tr>
		    </thead>
		    <tbody>		     
		<c:forEach items="${sessionScope.subList}" var="sub">
			<tr><td><c:out value="${sub.subname} " /></td>
			<td><c:out value="${sub.teacher} " /></td>
			<td><c:out value="${sub.class_year} " /></td></tr>
		</c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
	<div class="about-add_subject hide">
	  <h3><b><u>Add Subject</u></b></h3>
	  <form action="SubControllerServlet " method="post" class="form-horizontal">
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Name of the Subject:</label>
			<div class="col-md-5">
				<input type="text" name="subject" required/>
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Teacher Incharge:</label>
			<div class="col-md-5">
				<!-- <input type="text" name="teacher" required/> -->
				<select name="teacher" required>
					<c:forEach items="${sessionScope.staffList }" var="staff">
						<option value="${staff.name}">${staff.name}</option>
					</c:forEach>
				</select>
			</div>
		</div><br/><br/><br/>
		<div class="col-md-12 form-group">	
			<label class="col-xs-3 control-label">Class:</label>
			<div class="col-md-5">
				<select name="year" required>
					 <c:forEach items="${sessionScope.yearsList }" var="year">
				          <option value="${year }">${year }</option>	
				          </c:forEach>
				 </select>
			</div>
		</div><br/><br/><br/>
		<input type="submit" value="Submit" name="add"/>
		<input type="reset" value="Cancel"/>
	</form>
   </div>
	<div class="about-update_subject hide">
	  <h3><b><u>Update a Subject</u></b></h3>
	  <div class="container">         
		  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Subject Name</th>
		        <th>Teacher</th>
		        <th>Class</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>
		     <c:forEach items="${sessionScope.subList}" var="sub">
		     <form action="SubControllerServlet" method="post"><tr>
		     <td class="hidden"><input name="id" value="<c:out value="${sub.id}"/>"  type="text"/></td>
		        <td><input name="subject" value="<c:out value="${sub.subname}"/>" type="text"/></td>
		        <td><input name="teacher" value="<c:out value="${sub.teacher}"/>" type="text"/></td>
		        <td>
		        	<select name="class_year" required>
					 <c:forEach items="${sessionScope.yearsList }" var="year">
					 		<c:choose>
							 		<c:when test="${year==sub.class_year }">
							 				<option value="${year }" selected>${year }</option>
							 		</c:when>
							 		<c:when test="${year!=sub.class_year }">
							 				<option value="${year }">${year }</option>
							 		</c:when>						          
					 		</c:choose>
				          </c:forEach>
				 </select>
		        </td>
		        <td><span class="glyphicon glyphicon-edit"></span><input name="update" value="Update" type="submit" /></td>
		      </tr></form></c:forEach>
		    </tbody>
		  </table>
	</div>
	</div>
	<div class="about-delete_subject hide">
	  <h3><b><u>Delete a Subject</u></b></h3>
	  <div class="container">    
	  	  <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Subject Name</th>
		        <th>Teacher</th>
		        <th>Class</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>		    		    		
		     <c:forEach items="${sessionScope.subList}" var="sub"> <tr>		     
		        <td><c:out value="${sub.subname}"/></td>
		        <td><c:out value="${sub.teacher}"/></td>
		        <td><c:out value="${sub.class_year}"/> </td>
		        <td><span class="glyphicon glyphicon-remove"></span><a href="SubControllerServlet?id=<c:out value="${sub.id}"/>" >Delete</a></td>
		      </tr></c:forEach>
		    </tbody>
		  </table>
	</div>
	</div>    
    </div>
    
    <div id="menu4" class="tab-pane fade">
      <h1>Upload Study Material</h1>
      <input type="button" value="Select Year" class="btn btn-default" id="select_year" name="add_study"></input>
      <input type="button" value="Add Study Material" class="btn btn-default" id="add_study" name="add_study"></input>
      <input type="button" value="View Study Material" class="btn btn-default" id="view_study" name="view_study"></input>      
      <input type="button" value="Update Study Material" class="btn btn-default" id="update_study" name="update_study"></input>
      <input type="button" value="Delete Study Material" class="btn btn-default" id="delete_study" name="delete_study"></input>
	<div class="default-text">Welcome Page</div>
	<div class="about-select_year hide">
	<h1>Select Year</h1>
	<form action="SubControllerServlet" method="post">
			<select name="year">
				<c:forEach var="year" items="${sessionScope.yearsList }">
					<option value="${year}">${year}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Get Subject"/>
		</form>
	</div>
	<div class="about-add_study hide">
	 <c:if test="${sessionScope.timetableYear==null }">
	  			<h1>Please select year first from (Select Year) Tab</h1>
	  		</c:if> 
	  		<c:if test="${sessionScope.timetableYear!=null }">
	 <h3>Add Study Material </h3><br/>
	 	<form action="FileUploadServlet" method="post" enctype="multipart/form-data" class="form-horizontal">
				<div class="col-md-12">	
					<div class="col-md-12 form-group">
					<label class="col-xs-3 control-label">Subject</label>
					<div class="col-md-6">				
		    			<select id="sub" name="subject" style="width:50%" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname}</option>	
				          </c:forEach>
						</select>
		        	</div>
					</div>
					<div class="col-md-12 form-group">
					<label class="col-xs-3 date control-label">Class:</label>
					<div class="col-md-6">
			           <%--  <select name="year"  style="width:50%" required>
							 <c:forEach items="${sessionScope.yearsList }" var="year">
				          <option value="${year }">${year }</option>	
				          </c:forEach>
						 </select> --%>
						 <input value="${sessionScope.timetableYear }" readonly="readonly"/>
					</div>
					</div>
					<div class="col-md-12 form-group">
					<label class="col-xs-3 date control-label">Chapter:</label>
					<div class="col-md-6">
						<input type="text" name="chapter" required/>
					</div>
					</div>	
					<div class="col-md-12 form-group">
					<label class="col-xs-3 date control-label">Select file to Upload</label>
					<div class="col-md-6">
						<input type="file" name="uploadFile" required/>
					</div>
					</div>			
				</div><br/><br/><br/>										
				<div class="submitCan">
					<input type="submit" name="add" value="Submit"/>
					<input type="reset" value="Cancel"/>
				</div>
			</form>
			</c:if>
	</div>
	<div class="about-view_study hide">
	  <c:if test="${sessionScope.timetableYear==null }">
	  			<h1>Please select year first from (Select Year) Tab</h1>
	  		</c:if> 
	  		<c:if test="${sessionScope.timetableYear!=null }">
	  <h3>View Study Material </h3> 
	  	<table class="table table-responsive table-hover table-bordered">
				    <thead>
				      <tr>
				        <th>Year</th>
				        <th>Subject</th>
				        <th>Chapter</th>
				        <th>Document</th>
				      </tr>
				    </thead>
				    <tbody>
				      <c:forEach items="${sessionScope.documents }" var="document">
				      <tr>
				        <td><c:out value="${document.year }"></c:out></td>
				        <td><c:out value="${document.subject }"></c:out></td>
				        <td><c:out value="${document.name }"></c:out></td>
				        <td><a href="document_upload/<c:out value="${document.url }"></c:out>"  download>Download</a></td>
				      </tr>
				      </c:forEach>
				    </tbody>
		 </table>
		 </c:if>
   </div>
	<div class="about-update_study hide">
	  		<c:if test="${sessionScope.timetableYear==null }">
	  			<h1>Please select year first from (Select Year) Tab</h1>
	  		</c:if> 
	  		<c:if test="${sessionScope.timetableYear!=null }">
	  <h3>Update Study Material </h3>
	  			<table class="table table-responsive table-hover table-bordered">
				    <thead>
				      <tr>
				        <th>Subject</th>
				        <th>Chapter</th>
				        <!-- <th>Year</th> -->
				        <th>Document</th>
				        <th>Action</th>
				      </tr>
				    </thead>
				    <tbody>
				     <c:forEach items="${sessionScope.documents }" var="document">
				     <form method="post" action="FileUploadServlet" enctype="multipart/form-data">
				      <tr>
				      <td class="hidden"><input name="id" value="<c:out value="${document.id}"/>"  type="text"/></td>
				        <td>
				        <select name="subject">	
				        <c:forEach items="${ sessionScope.subList }" var="subject">					       					        				       				        	
				        	<c:choose>
				        		<c:when test="${subject==document.subject }">
				        			<option value="${subject.subname}" selected>${subject.subname}</option>
				        		</c:when>
				        		<c:when test="${subject!=document.subject }">
				        			<option value="${subject.subname}" >${subject.subname}</option>
				        		</c:when>
				        	</c:choose>					        				        					        		        				      				        		              				       
				        </c:forEach>					        
				        </select></td>
				        <td class="hidden"><input value="${sessionScope.timetableYear }" name="year"/></td>
				        <td><input value="<c:out value="${document.name }"></c:out>" name="chapter"/></td>
				        <td><input type="file" name="document" required/></td>
				        <td><input type="submit" name="update" value="Update"/></td>
				      </tr>
				      </form>
				      </c:forEach>
				    </tbody>
		 	</table>
	  		</c:if>
	</div>
	<div class="about-delete_study hide">
	<c:if test="${sessionScope.timetableYear==null }">
	  			<h1>Please select year first from (Select Year) Tab</h1>
	  		</c:if> 
	  		<c:if test="${sessionScope.timetableYear!=null }">
		<h3>Delete Study Material </h3> 
			<table class="table table-responsive table-hover table-bordered">
				    <thead>
				      <tr>
				        <th>Year</th>
				        <th>Subject</th>
				        <th>Chapter</th>
				        <th>Action</th>
				      </tr>
				    </thead>
				    <tbody>
				      <c:forEach items="${sessionScope.documents }" var="document">
				      <tr>
				        <td><c:out value="${document.year }"></c:out></td>
				        <td><c:out value="${document.subject }"></c:out></td>
				        <td><c:out value="${document.name }"></c:out></td>
				        <td><a href="FileDelete?id=${document.id }&url=${document.url }" >Delete</a></td>
				      </tr>
				      </c:forEach>
				    </tbody>
		 	</table>
		 	</c:if>
	</div>    
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script>
/**********************************datepicker*******************************************/
$(document).ready(function() {
	$('#updateLink').click(function(){
		var date = $('#datepicker2').val();
		var year=$('#updateyear').val();
		//alert(date+"	"+year);
		$(location).attr("href","TimeTableController?date="+date+"&year="+year);
	});
	$('#outputAdd').hide();
	$('#datetimepicker1').datetimepicker({
	    format: 'D/M/YYYY-dddd',    
	    calendarWeeks:true
	});
	$('#datetimepicker2').datetimepicker({
	    format: 'D/M/YYYY-dddd',    
	    calendarWeeks:true
	});
	$('#datetimepicker3').datetimepicker({
	    format: 'D/M/YYYY-dddd',    
	    calendarWeeks:true
	});
	$('#datetimepicker1').on('dp.change',weekDA);
	function weekDA (){
		$('#ttview').show();
		$('#outputAdd').show();
		$('#outputAdd').attr('value',moment($("#datepicker1").val(), "D/M/YYYY").week());
	}
	$('#datetimepicker2').on('dp.change', function (){
		//$('#datepicker2').attr('disabled','disabled');
	});
	$('#datetimepicker3').on('dp.change', function (e) {
	    var kk = $("#datepicker3").val();
	    $("#output").html(
	        "Week Number: " + moment(kk, "D/M/YYYY").week()
	    );
	});
});
/**********************************disable*******************************************/
$('#year').hide();
$('#ttview').hide();
/*$('#year').change(function(){
	$('#ttview').show();
});*/
$('#updateyear').change(function(){
	//$('#updateyear').attr('disabled','disabled');
});
</script>
<script>
/**********************************tab change*******************************************/
$('.btn').on("click", function(e) {
	  var $this = $(this),
	      $id = $this.attr('id'),
	      $class = '.' + $('.about-' + $id).attr('class').replace('hide', '');
	  
	  $('.default-text').addClass('hide');
	  $('.about-' + $id).removeClass('hide');
	  $('div[class*=about]').not($class).addClass('hide');
	});
</script>
</body>
</html>