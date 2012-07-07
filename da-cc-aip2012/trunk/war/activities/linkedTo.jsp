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
				<span id="orientation_info"> <a class="entry"
					href="/projects/">Attività</a> &gt;
					<span class="entry">Attività collegate a:</span>
				</span>
				<h1 class="content_title">
					${f:h(linkedProject.name)}</h1>
				<ul>
					<c:choose>
						<c:when
							test="${linkedActivities == null || fn:length(linkedActivities) == 0 }">
							<span class="disabled_link">Nessuna attività disponibile
								in questa categoria.</span>
						</c:when>
						<c:otherwise>
							<c:forEach items="${linkedActivities}" var="activity">
								<li>${f:h(activity.name)} (<a
									href="/activities/activity?id=${f:h(activity.key)}">View</a>)
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>
				<br> <span>Torna a </span><a
					href="/projects/project?id=${f:h(linkedProject.key)}">${linkedProject.name
					}</a>

			</div>

			<div id="right" class="column"></div>

		</div>
	</div>
</body>
</html>

</body>
</html>
