<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Tutte le attività</title>
<!-- Common head lines -->
<%=headContent()%>
</head>
<body>
	<div id="container">
		<!-- Banner -->
		<%=banner()%>
		
		<!-- Landmarks -->
		<%=landmarks("attività")%>

		<div id="main">
			<div id="left" class="column">&nbsp;</div>
			
			<!-- Content -->
			<div id="content">
				<span id="orientation_info"> <a href="/activities"
					class="entry">Attività</a> &gt;
				</span>

				<h1 class="content_title">Tutte le attività</h1>
				<p>E’ qui presente un elenco di tutte le attività finanziate dal
					Ministero della Salute ordinati alfabeticamente.</p>

				<c:choose>
					<c:when
						test="${activityList == null || fn:length(activityList) == 0 }">
						<span class="disabled_link">Nessuna attività disponibile in
							questa categoria.</span>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach items="${activityList}" var="activity">
								<li><a href="/activities/activity?id=${f:h(activity.key)}">
										${f:h(activity.name)} </a></li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>

			<div id="right" class="column">&nbsp;</div>

		</div>
	</div>
</body>
</html>