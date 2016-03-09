<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teacher's Panel</title>
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
	<li class="active"><a data-toggle="pill" href="#marks">Marks</a></li>
    <li><a data-toggle="pill" href="#upload_study_material">Upload Study Material</a></li>
</ul> 
  
  <div class="tab-content border1" style="margin-top:2%;padding:1%;">
  	<div id="marks" class="tab-pane fade in active">
  	<input type="button"  value="Change Year" class="btn btn-default" id="change_yy"></input>
      <input type="button" value="Add Marks" class="btn btn-default" id="add_m"></input>
      <input type="button" value="Update Marks" class="btn btn-default" id="update_m"></input>
      <input type="button"  value="View Marks" class="btn btn-default" id="view_m"></input>
     <div class="about-change_yy hide">
     	<form action="SubControllerServlet" method="post">
     	<input class="hidden" type="text" name="role" value="${sessionScope.user.role }"/>
			<select name="year">
				<c:forEach var="year" items="${sessionScope.yearsList }">
					<option value="${year}">${year}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Get Subject"/>
		</form>
     </div>
      <div class="about-add_m hide">
      	<c:if test="${sessionScope.timetableYear == null }">
      		<h1>Please select year from (select year)tab</h1>
      	</c:if>
      	<c:if test="${sessionScope.timetableYear!=null }">
      		<h1>ADD MARKS <h3> for ${sessionScope.timetableYear }</h3></h1>
      	<div class="container" style="margin-top:5%;">
      	<c:if test="${sessionScope.studentList ==null}">      	
      	<form action="RegisterServlet" method="post"  class="form-horizontal">
				<div class="col-md-12">
				<input class="hidden"  type="text" value="${sessionScope.timetableYear }"  name="year"/>	
					<%-- <div class="col-md-6 form-group">
					<label class="col-md-3 control-label">Class</label>
					<div class="col-md-6">
			            <select name="year"  required>
							<c:forEach items="${sessionScope.yearsList }" var="year">
							<option value="${year }">${year }</option>
							</c:forEach>
						 </select>
					</div>
					</div> --%>
					<div class="col-md-6 form-group">
					<label class="col-md-3 control-label">Subject</label>
					<div class="col-md-6">				
		    			<select  name="subject" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
							<option value="${subject.subname}">${subject.subname}</option>
							</c:forEach>
						</select>
		        	</div>
					</div>
					<div class="col-md-6 form-group">
					<label class="col-md-3 control-label"> Exam</label>
					<div class="col-md-3">
					   <select name="exam"  required>
							<c:forEach items="${sessionScope.examsList }" var="exam">
							<option value="${exam }">${exam }</option>
							</c:forEach>
						 </select>
					</div>
					</div>
					<div class="col-md-6 form-group">
					<label class="col-md-3 control-label">Total Marks</label>
					<div class="col-md-3">
			            <select  name="mark"  required>
							<c:forEach items="${sessionScope.markList }" var="mark">
							<option value="${mark }">${mark }</option>
							</c:forEach>
						 </select>
					</div>
					<div class="col-md-12">
						<input type="submit" name="studentList"  value="studentList " id="getlist"/>
					</div>					
					</div>
				</div>
				</form>
				</c:if>
				<c:if test="${sessionScope.studentList !=null}">
				<form action="ResultServlet" action="post" >
				<div class="col-md-12 " id="list">
				<p>Marks For <input value="${studentListSubject}" name="subject" readonly="readonly"/> of Exam<input value="${studentListExam}"  name="exam" readonly="readonly"/></p>
					<input value="${studentListYear}" name="year" readonly="readonly"/>
					<table class="table table-responsive table-hover table-bordered" style="margin-top:2%;">
				    <thead>				    
				      <tr>
				        <th>Name of Student</th>
				        <th>Marks Obtained</th>
				        <th>Marks Out Of</th>
				      </tr>
				    </thead>
				    <tbody>				    
				    <c:forEach items="${sessionScope.studentList }" var="student" varStatus="count">
				    	<tr>				    	
				    	<td class="hidden"><input type="text" name="id${count.index }" value="${student.id }" /></td>
				    	<td><input type="text"  value="${student.name }" /></td>				      
				    	<td><input type="text" name="score${count.index }" /></td>
				    	<td><input name="outof"  value="${studentListMark }" readonly="readonly"/></td>				      
				      	</tr>	
				      	<c:set var="number" value="${count.count}"></c:set>
				    </c:forEach>				      			     
				        <tr><td colspan="3">Count::::<input value="${number}" name="totalCount" readonly="readonly"/></td></tr>
				        </tbody>
				        </table>
				        <input type="submit" name="add" value="Add Marks"/>
				</div>					
				</form>
				</c:if>	
      	</div>	
      	</c:if>
      	</div>
        <div  class="about-view_m hide">
        <c:if test="${sessionScope.timetableYear == null }">
      		<h1>Please select year from (select year)tab</h1>
      	</c:if>
      	<c:if test="${sessionScope.timetableYear!=null }">
      <h1>VIEW MARKS  <h3> for ${sessionScope.timetableYear }</h3></h1>
      <div class="container" style="margin-top:5%;">
      <c:if test="${sessionScope.resultList==null}">
      	<form action="ResultServlet" method="post"  class="form-horizontal">
				<input class="hidden" type="text" value="${sessionScope.timetableYear }"  name="year"/>
				<%-- <div class="col-md-6 form-group">
					<label class="col-md-3 control-label">Class</label>
					<div class="col-md-6">
			            <select name="year"  required>
							<c:forEach items="${sessionScope.yearsList }" var="year">
							<option value="${year }">${year }</option>
							</c:forEach>
						 </select>
					</div>
					</div> --%>
					<div class="col-md-6 form-group">
					<label class="col-md-3 control-label"> Exam</label>
					<div class="col-md-3">
					   <select name="exam"  required>
							<c:forEach items="${sessionScope.examsList }" var="exam">
							<option value="${exam }">${exam }</option>
							</c:forEach>
						 </select>
					</div>
					</div>
					<input type="submit"  name="view" value="Get List"/>
		</form>	
		</c:if>			
				<c:if test="${sessionScope.resultList!=null}">
						<div class="col-md-12">
							<table class="table table-responsive table-hover table-bordered" style="margin-top:2%;">
						    <thead>
						      <tr>
						        <th>Name of Student</th>
						        <th>Subject</th>
						        <th>Marks Obtained</th>
						        <th>Out Of</th>
						      </tr>
						    </thead>
						    <tbody>
						      <c:forEach items="${sessionScope.resultList }" var="result">
						      		<tr>
						      			<td class="hidden">${result.student_id }</td>
						      			<td>${result.student_name}</td>
						      			<td>${result.subject}</td>
						      			<td>${result.scoredMarks}</td>
						      			<td>${result.out_of}</td>
						      		</tr>
						      </c:forEach>							      			     
						      </tbody>
						      </table>
						</div>
				</c:if>
      	</div>
      	</c:if>
    </div>
    <div class="about-update_m hide">
    <c:if test="${sessionScope.timetableYear == null }">
      		<h1>Please select year from (select year)tab</h1>
      	</c:if>
      	<c:if test="${sessionScope.timetableYear!=null }">
      <h1>UPDATE MARKS  <h3> for ${sessionScope.timetableYear }</h3></h1>
      <div class="container" style="margin-top:5%;">
      <c:if test="${sessionScope.resultList==null}">
      	<form action="ResultServlet" method="post"  class="form-horizontal">
				<input class="hidden" type="text" value="${sessionScope.timetableYear }"  name="year"/>
				<%-- <div class="col-md-6 form-group">
					<label class="col-md-3 control-label">Class</label>
					<div class="col-md-6">
			            <select name="year"  required>
							<c:forEach items="${sessionScope.yearsList }" var="year">
							<option value="${year }">${year }</option>
							</c:forEach>
						 </select>
					</div>
					</div> --%>
					<div class="col-md-6 form-group">
					<label class="col-md-3 control-label"> Exam</label>
					<div class="col-md-3">
					   <select name="exam"  required>
							<c:forEach items="${sessionScope.examsList }" var="exam">
							<option value="${exam }">${exam }</option>
							</c:forEach>
						 </select>
					</div>
					</div>
					<input type="submit"  name="view" value="Get List"/>
		</form>	
		</c:if>			
				<c:if test="${sessionScope.resultList!=null}">
						<div class="col-md-12">
							<form action="ResultServlet" method="post">
								<table class="table table-responsive table-hover table-bordered" style="margin-top:2%;">
						    <thead>
						      <tr>
						        <th>Name of Student</th>
						        <th>Subject</th>
						        <th>Marks Obtained</th>
						        <th>Out Of</th>
						      </tr>
						    </thead>
						    <tbody>
						      <c:forEach items="${sessionScope.resultList }" var="result" varStatus="index">
						      		<tr>
						      			<td class="hidden"><input name="id${index.index}"  value="${result.id}"/></td>
						      			<td>${result.student_name}</td>
						      			<td>${result.subject}</td>
						      			<td><input name="marks${index.index}" value="${result.scoredMarks}" /></td>
						      			<td>${result.out_of}</td>
						      		</tr>
						      		<c:set var="number" value="${index.count}"></c:set>
									<c:set var="ye" value="${sessionScope.year}"></c:set>
						      </c:forEach>							      			     
						      		<tr class="hidden"><td><input name="totalCount" value="${number}" readonly="readonly"/></td></tr>
									<tr  class="hidden"><td><input  name="year" value="${ye}"/></td><td><input  name="exam" value="${sessionScope.exam }"/></td></tr>
						      </tbody>
						      </table>
						      <input type="submit" name="update" value="Update"/>
							</form>
						</div>
				</c:if>
      	</div>    
      	</c:if>
</div>
</div>
<div id="upload_study_material" class="tab-pane fade">
<input type="button"  value="Change Year" class="btn btn-default" id="change_ys"></input>
 <input type="button" value="Upload Study Material" class="btn btn-default" id="add_m"></input>
 <div class="about-change_ys">
 <form action="SubControllerServlet" method="post">
     	<input class="hidden" type="text" name="role" value="${sessionScope.user.role }"/>
			<select name="year">
				<c:forEach var="year" items="${sessionScope.yearsList }">
					<option value="${year}">${year}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Get Subject"/>
		</form>
 </div>
 <div class="about-add_m">
 <c:if test="${sessionScope.timetableYear == null }">
      		<h1>Please select year from (select year)tab</h1>
      	</c:if>
      	<c:if test="${sessionScope.timetableYear!=null }">
<h1>Study Material</h1>
<form action="FileUploadServlet" method="post" enctype="multipart/form-data" class="form-horizontal">
				<div class="col-md-12">	
					<div class="col-md-12 form-group">
					<label class="col-xs-3 control-label">Subject</label>
					<div class="col-md-6">				
		    			<select id="sub" name="subject" style="width:50%" required>
				          <c:forEach items="${sessionScope.subList }" var="subject">
				          <option value="${subject.subname }">${subject.subname }</option>	
				          </c:forEach>
						</select>
		        	</div>
					</div>
					<div class="col-md-12 form-group">
					<label class="col-xs-3 date control-label">Class:</label>
					<div class="col-md-6">
			            <%-- <select name="year"  style="width:50%" required>
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
				<input type="text" name="role" value="${user.role }" class="hidden"/>								
				<div class="submitCan">
					<input type="submit" name="add" value="Submit"/>
					<input type="reset" value="Cancel"/>
				</div>
			</form>
</c:if>
</div>
</div>
    
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#getlist').click(function(){		
	});
});
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