<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp" %>

<!doctype html>
<html>
<head>
<%= htmlHead("Project index") %>
</head>
<body>
	<div id="container">
		<%= banner() %>
		<%= landmarks("progetti") %>
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
				<h3>Project list:</h3>
				<ul>
					<c:forEach items="${projects}" var="project">
						<li><b>${f:h(project.name)}</b> (<a
							href="/projects/project?id=${f:h(project.key)}">View</a>)</li>
					</c:forEach>
				</ul>
				<br>
				<br>
				<a href="/">Home</a>
			</div>
			
			<div id="right" class="column">
			</div>
		
		</div>
	</div>
</body>
</html>
