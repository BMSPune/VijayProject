<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Speech Recognisation</title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/j/annyang.js"></script>
<script>
var commands = {
	    'jarvis navigate to *val': function(val) {
	      alert("Ok "+val);
	      val = val.replace(" ","");
	      //window.location.href ="http://www."+val+".in";
	      window.location.href =val+".jsp";
	    },
	    'i am *val': function(val) {
		      alert("Welcome "+val);
		     // window.location.href ="http://www."+val+".com";
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
</body>
</html>
