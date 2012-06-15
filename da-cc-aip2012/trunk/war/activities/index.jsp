<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>activity Index</title>
</head>
<body>
	<h1>List of activities:</h1>
	<ul>
		<c:forEach items="${activities}" var="activity">
			<li>${f:h(activity.name)} (<a href="/activities/activity?id=${f:h(activity.key)}">view</a>)</li>
		</c:forEach>
	</ul>
	
</body>
</html>
