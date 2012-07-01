<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp" %>

<!doctype html>
<html>
<head>
<%= htmlHead("Project") %>
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
				<h4>Attività collegate:</h2>
				<ul>
					<c:forEach items="${linkedActivities}" var="activity">
						<li>${f:h(activity.name)} (<a
							href="/activities/activity?id=${f:h(activity.key)}">View</a>)
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div id="content">
				<h1>${f:h(project.name)}</h1>
				<h2>Informations:</h2>
				<p>${f:h(project.generalInfo)}</p>
				<h2>Documentation:</h2>
				<p>${f:h(project.documentation)}</p>
			</div>
			
			<div id="right" class="column">
			</div>
		
		</div>
	</div>
</body>
</html>

