<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Attività collegate a ${linkedProject.name}</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("attività")%>

		<!-- content -->
		<div id="main">
			<div id="left" class="column">&nbsp;</div>

			<div id="content">
				<span>Attività collegate a</span>
				<h1>${f:h(linkedProject.name)}</h1>
				<ul>
					<c:forEach items="${linkedActivities}" var="activity">
						<li>${f:h(activity.name)} (<a
							href="/activities/activity?id=${f:h(activity.key)}">View</a>)
						</li>
					</c:forEach>
				</ul>
				<br> <span>Torna a </span><a
					href="/projects/project?id=${f:h(linkedProject.key)}">${linkedProject.name }</a>

			</div>

			<div id="right" class="column"></div>

		</div>
	</div>
</body>
</html>

</body>
</html>
