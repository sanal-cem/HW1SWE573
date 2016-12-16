<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Add Food</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
</head>
<body>
<h2 align="center">Add Food</h2>
<hr />
	<div class="container">
		<div id="AddFood">
			<div class="col-xs-4">
				<form:form commandName="addFood" method="POST" action="newFood">
				<p class="desc">User Name: </p>
				<form:label readonly="true" value="${ login.uName}" path="uName" ></form:label>
				<br />
				<p class="desc">Food Offset: </p>
				<form:input class="form-control numbersOnly" path="offset" />
				<br />
				<p class="desc">Food Group: </p>
				<form:input class="form-control" path="group" />
				<br />
				<p class="desc">Food Name: </p>
				<form:input class="form-control" path="name" />
				<br />
				<p class="desc">Food NDbNo: </p>
				<form:input class="form-control" path="nDbNo" />
				<br />
				<p class="desc">Food Ds: </p>
				<form:input class="form-control" path="ds" />
				<br />
				<p class="desc">Food Calory: </p>
				<form:input id="numbersOnly" class="form-control numbersOnly" path="fCalory" />
				<br />
				<p class="desc">Food Ingredients: </p>
				<form:textarea class="form-control" cols="30" rows="3" path="fIngred" />
				<br />
				<input class="ui-button ui-widget ui-corner-all" type="submit" value="Add Food" />
				<br /><br />
				</form:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
  $( ".numbersOnly" ).keyup(function () {
	    if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
	       this.value = this.value.replace(/[^0-9\.]/g, '');
	    }
	});
  runEffect();
	    // run the currently selected effect
	    function runEffect() {
	      // get effect type from
	      var selectedEffect = $( "#effectTypes" ).val();
	 
	      // Most effect types need no options passed by default
	      var options = {};
	      // some effects have required parameters
	      if ( selectedEffect === "scale" ) {
	        options = { percent: 50 };
	      } else if ( selectedEffect === "transfer" ) {
	        options = { to: "#button", className: "ui-effects-transfer" };
	      } else if ( selectedEffect === "size" ) {
	        options = { to: { width: 200, height: 60 } };
	      }
	 
	      // Run the effect
	      $( "#dialog" ).effect( "bounce", options, 500, callback );
	    };
	 
	    // Callback function to bring a hidden box back
	    function callback() {
	      setTimeout(function() {
	        $( "#dialog" ).removeAttr( "style" ).hide().fadeIn();
	      }, 1000 );
	    };
});

</script>
</html>