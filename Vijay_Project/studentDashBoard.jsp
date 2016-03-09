<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student's Panel</title>
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
	    <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="width:180px;">${sessionScope.user.name}<span></span><img class="img-circle" style="width:20%;" src="ProfilePicture?id=${sessionScope.user.id }"/>
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
	<li class="active"><a data-toggle="pill" href="#home"  class="home">Home</a></li>
    <li><a data-toggle="pill" href="#timetable" class="schedule">Timetable</a></li>  
    <li><a data-toggle="pill" href="#menu1" class="books">Books</a></li>
    <li><a data-toggle="pill" href="#menu2" class="subject">Subject</a></li>
    <li><a data-toggle="pill" href="#menu3" class="marks">Marks</a></li>
    <li><a data-toggle="pill" href="#menu4" class="documents">Study Material</a></li>
</ul>  
  
  <div class="tab-content border1" style="margin-top:2%;padding:1%;">
  	<div id="home" class="tab-pane fade in active">
      <h1>HOME</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="timetable" class="tab-pane fade " style="margin: auto;width:30%;">
      <h1>TIMETABLE</h1>      
      		<form action="TimeTableController" method="post">
      			 <div class="input-group date" id="datetimepicker1">
				          <input id="datepicker1" type="text" class="form-control"  name="date" />	<span class="input-group-addon"><span id="cal" class="glyphicon-calendar glyphicon"></span></span>
				 </div>
				 <input class="hidden" type="text" value="${sessionScope.user.year }" name="year" />
      			<input type="submit" name="studenttimetable" value="Get Timetable"/>
      		</form>
      <table class="table table-responsive table-hover table-bordered">
					    <thead>
					      <tr>
					        <th>Time</th>
					        <th>Lectures</th>
					      </tr>
					    </thead>
					    <tbody>					 						   
					    <c:forEach items="${sessionScope.timetable }" var="lectures">
					    <tr>
					    <td>${lectures.timming}</td>
					    <td>${lectures.lecture}</td>
					    </tr>
					    </c:forEach>	  
					    </tbody>
					  </table>
    </div>
    
    <div id="menu1" class="tab-pane fade">
      <h1>Books</h1>
      <div class="container">
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
    
    <div id="menu2" class="tab-pane fade">
      <h1>Subject</h1>
        <table class="table table-responsive table-hover table-bordered">
		    <thead>
		      <tr>
		        <th>Subject</th>
		        <th>Teacher</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${sessionScope.subList }" var="sub">
		      <tr>
		      <td><c:out  value="${sub.subname }"/></td>
		      <td><c:out  value="${sub.teacher }"/></td>			      	      
		      </tr>
		      </c:forEach>
		    </tbody>
		  </table>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h1>MARKS</h1>
      <form action="ResultServlet" method="post"  class="form-horizontal">
			<div class="col-md-6 form-group">
			<input value="${sessionScope.user.year}" class="hidden" name="year"/>
			<label class="col-md-3 control-label"> Exam</label>
			<div class="col-md-3">
			   <select name="exam"  required>
			   <c:forEach var="exam" items="${sessionScope.examsList}">			   
					<option value="${exam}">${exam}</option>
			   </c:forEach>
				 </select>
			</div>
			</div>
			<input type="submit"  name="viewStudent" value="Get List"/>
	  </form>
	<c:if test="${sessionScope.resultList!=null }">
		<table class="table table-responsive table-hover table-bordered" style="margin-top:2%;">
		<tr>
			<th>Subject</th>
			<th>Marks Obtained</th>
			<th>Marks Out Of</th>
		</tr>
		<c:forEach var="marks" items="${sessionScope.resultList }">
			<tr>
			<td>${marks.subject}</td>
			<td>${marks.scoredMarks }</td>
			<td>${marks.out_of }</td>
		</tr>
		</c:forEach>		
	</table>
	</c:if>
    </div>
    
    <div id="menu4" class="tab-pane fade">
      <h1>Study Material</h1>
	<table class="table table-responsive table-hover table-bordered" style="margin-top:2%;">
		<tr>
			<th>Subject</th>
			<th>Chapter</th>
			<th>Action</th>
		</tr>
		<c:forEach var="doc" items="${sessionScope.documents}">
		<tr>
			<td>${doc.subject}</td>
			<td>${doc.name}</td>
			<td><a class="${fn:toLowerCase(doc.name)}" href="document_upload/${doc.url}" download><span class="glyphicon glyphicon-download"></span>Download</a></td>
		</tr>		
		</c:forEach>		
	</table>
    </div>
    
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/annyang.js"></script>
<script>
var commands = {
	    'jarvis navigate to *val': function(val) {
	      alert("Ok "+val);
	      val = val.replace(" ","");	      
	      window.location.href =val+".jsp";
	    },
	    'i am *val': function(val) {
		      alert("Welcome "+val);		     
		},
		'download *val':function(val){
			alert(val);
			$('.'+val)[0].click()
			//$().trigger('click');
		},
		'switch to *val':function(val){
			alert(val);
			$('.'+val)[0].click();
		}
	  };
	  
annyang.debug();
annyang.addCommands(commands);
annyang.start();
  var scrollTo = function(identifier, speed) {
    $('html, body').animate({
        scrollTop: $(identifier).offset().top
    }, speed || 1000);
  }
  </script>
<script type="text/javascript">
$('#datetimepicker1').datetimepicker({
    format: 'D/M/YYYY-dddd',    
    calendarWeeks:true
});
</script>	
</body>

</html>