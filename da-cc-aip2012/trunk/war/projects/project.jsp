<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${f:h(project.name)} | Projects</title>
</head>
<body>

	<h1>${f:h(project.name)}</h1>
	<h2>Informations:</h2>
	<p>${f:h(project.generalInfo)}</p>
	<h2>Documentation:</h2>
	<p>${f:h(project.documentation)}</p>
	
</body>
</html>
