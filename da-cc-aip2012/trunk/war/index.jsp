<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp" %>

<!doctype html>
<html>
<head>
	<title>Fondo per la lotta alle allergie</title>
	<%= headContent() %>
</head>
<body>
	<div id="container">
		<%= banner() %>
		<%= landmarks("home") %>
		<div id="main">
			<div id="left" class="column">
				&nbsp;
			</div>
			
			<div id="content">
				<h2>Project list:</h2>
				<p>
					<a href="/projects/">list</a>
				</p>
				<h2>Activity list:</h2>
				<p>
					<a href="/activities/">list</a>
				</p>
			</div>
			
			<div id="right" class="column">
			</div>
		
		</div>
	</div>
</body>
</html>
