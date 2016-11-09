<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Registration</title>
</head>
<body>
<h2 align="center">User Registration</h2>
<hr />
<table align="center" cellpadding="5" cellspacing="5">
	<form:form commandName="registration" method="POST" action="search">
		<tr>
			<td>Username</td>
			<td><form:input path="uName" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="Search" /></td>
		</tr>
	</form:form>
</table>
<c:if test="${user != null}">
	<table align="center" cellpadding="5" cellspacing="5">
		<thead>
			<tr>
				<td>User Name</td>
				<td>Name</td>
				<td>Surname</td>
				<td>Food</td>
				<td>Activity</td>
				<td>Age</td>
				<td>Edit</td>
				<td>Delete</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${user.uName}</td>
				<td>${user.surName}</td>
				<td>${user.food_id}</td>
				<td>${user.act_id}</td>
				<td>${user.address}</td>
				<td>${user.age}</td>
				<td><a href="load-form?roll=${user.uName}">Edit</a></td>
				<td><a href="delete?roll=${user.uName}">Edit</a></td>
			</tr>
		</tbody>
	</table>
</c:if>
</body>
</html>