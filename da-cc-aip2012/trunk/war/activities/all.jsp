<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>${f:h(activity.name)}</title>
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
				<span id="orientation_info"> <span class="entry">Attività</span>
					> <span class="entry">Tutte le attività</span>
				</span>

				<h1>Elenco delle attività</h1>
				<p>Testo di introduzione</p>
				<br>
				<ul>
					<c:forEach items="${activityList}" var="activity">
						<li>${f:h(activity.name)} (<a
							href="/activities/activity?id=${f:h(activity.key)}">view</a>)
						</li>
					</c:forEach>
				</ul>
			</div>

			<div id="right" class="column">&nbsp;</div>

		</div>
	</div>
</body>
</html>