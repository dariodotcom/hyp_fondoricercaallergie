<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp" %>

<!doctype html>
<html>
<head>
<%= htmlHead("Home") %>
</head>
<body>
	<div id="container">
		<%= banner() %>
		<%= landmarks("home") %>
		<div id="main">
			<div id="left" class="column">
				<h4>Structural links:</h4>
				<ul>
					<li>Voce 1</li>
					<li>Voce 2</li>
					<li>Voce 3</li>
					<li>Voce 4</li>
				</ul>
				<h4>Transition links:</h4>
				<ul>
					<li>Voce 1</li>
					<li>Voce 2</li>
					<li>Voce 3</li>
					<li>Voce 4</li>
				</ul>
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
