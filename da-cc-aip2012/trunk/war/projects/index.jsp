<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>projects Index</title>
</head>
<body>
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
</body>
</html>
