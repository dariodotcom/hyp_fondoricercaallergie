<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${f:h(activity.name)} | Activities</title>
</head>
<body>
	<h1>${f:h(activity.name)}</h1>
	<h2>General information:</h2>
	<p>${f:h(activity.generalInfo)}</p>
	<h2>Description:</h2>
	<p>${f:h(activity.description)}</p>
	<h2>Linked project:</h2>
	<a href="/">${f:h(linkedProject.name)}</a>
</body>
</html>
