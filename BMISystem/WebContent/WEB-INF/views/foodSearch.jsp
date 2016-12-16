<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
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
        <script type="text/javascript">
            $(document).ready(function() {
                bind()
            })

            function bind() {
                $("#search_button").click(function(){
                    var keyword = $("#search_box").val()
                    show_list(keyword)
                })
            }
            function show_list(keyword) {
                $.ajax({
                    url: "/foodList/" + keyword,
                    type: 'POST'
                }).done(function(res){
                    render_list(res)
                    console.log("completed")
                })
                console.log("show_list sonu")
            }

            function render_list(data) {
                var template = "<li></li>";
                var container = $("#results");
                container.html("")
                for (var i = data.length - 1; i >= 0; i--) {
                    var food = data[i];
                    var template = "<li>" + food.name + "</li>";
                    container.append(template);
                };
            }
        </script>
    </head>
    <body>
  	<div class="container">
		<div id="AddFood">
			<div class="col-xs-3">
	        <form:form method="GET" commandName="foodList" action="foodList" modelAttribute="keyword">
	        	<br /><br />
	            <p class="desc">Food Name: </p>
				<input class="form-control" id="search_box" type="text" name="keyword"><br>
	            <input class="ui-button ui-widget ui-corner-all" id="search_button" type="submit" value="Search"></input>
	        </form:form>
	        <ul id="results">
	        </ul>
	        </div>
		</div>
	</div>
</body>
</html>
