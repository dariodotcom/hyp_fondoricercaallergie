<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Tutti i progetti</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("progetti")%>
		<div id="main">
			<div id="left" class="column">&nbsp;</div>

			<div id="content">
				<h1>Progetti per tipo: ${projectType}</h1>
				<p>Testo di introduzione</p>
				<br>
				<ul>
					<c:forEach items="${projectList}" var="project">
						<li><a href="/projects/project?id=${f:h(project.key)}">${f:h(project.name)}</a></li>
					</c:forEach>
				</ul>
			</div>

			<div id="right" class="column">&nbsp;</div>
		</div>
	</div>
</body>
</html>