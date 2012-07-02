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
			<div id="left" class="column">
				<h4>Attività</h4>
				<%
					String view = (String) request.getAttribute("view");
					boolean viewDesc = view != null && view.equals("desc");
				%>
				<ul>
					<li selected="<%=!viewDesc%>"><a
						href="/activities/activity?id=${f:h(activity.key)}">
							Informazioni generali </a></li>
					<li selected="<%=viewDesc%>"><a
						href="/activities/activity?id=${f:h(activity.key)}&view=desc">
							Descrizione </a></li>

				</ul>
				<h4>Progetto collegato:</h4>
				<ul>
					<li><a href="/projects/project?id=${f:h(linkedProject.key)}">${f:h(linkedProject.name)}</a></li>
				</ul>
			</div>

			<div id="content">
				<h1>${f:h(activity.name)}</h1>
				<c:choose>
					<c:when test="${view=='desc'}">
						<h2>Descrizione dettagliata</h2>
						<p>${activity.description}</p>
					</c:when>
					<c:otherwise>
						<h2>Informazioni generali</h2>
						<p>${activity.generalInfo}</p>
					</c:otherwise>
				</c:choose>


				<br> <br>
			</div>

			<div id="right" class="column"></div>

		</div>
	</div>
</body>
</html>

</body>
</html>
