<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp" %>

<!doctype html>
<html>
<head>
<%= htmlHead("Activity") %>
</head>
<body>
	<div id="container">
		<%= banner() %>
		<%= landmarks("attività") %>
		<div id="main">
			<div id="left" class="column">
				<h4>Structural links:</h4>
				<ul>
					<li>Voce 1</li>
					<li>Voce 2</li>
					<li>Voce 3</li>
					<li>Voce 4</li>
				</ul>
				<h4>Progetto collegato:</h2>
				<ul>
					<li><a href="/projects/project?id=${f:h(linkedProject.key)}">${f:h(linkedProject.name)}</a></li>
				</ul>
			</div>
			
			<div id="content">
				<h1>${f:h(activity.name)}</h1>
				<h2>General information:</h2>
				<p>${f:h(activity.generalInfo)}</p>
				<h2>Description:</h2>
				<p>${f:h(activity.description)}</p>
				<br>
				<br>
			</div>
			
			<div id="right" class="column">
			</div>
		
		</div>
	</div>
</body>
</html>

</body>
</html>
