<%@page import="root.model.Project"%>
<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>


<!doctype html>
<html>
<head>
<title>${project.name}</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("progetti")%>
		<div id="main">
			<div id="left" class="column">
				<h4>Progetto:</h4>
				<%
					String view = (String) request.getAttribute("view");
					boolean viewDoc = view != null && view.equals("doc");
				%>
				<ul>
					<li selected="<%=!viewDoc%>"><a
						href="/projects/project?id=${f:h(project.key)}"> Informazioni
							generali </a></li>
					<li selected="<%=viewDoc%>"><a
						href="/projects/project?id=${f:h(project.key)}&view=doc">
							Documentazione </a></li>

				</ul>
				<h4>Attività collegate:</h4>
				<a href="/activities/linkedTo?projectId=${f:h(project.key)}">
					Visualizza attività collegate
				</a>
			</div>

			<div id="content">
				<h1>${f:h(project.name)}</h1>
				<c:choose>
					<c:when test="${view=='doc'}">
						<h2>Documentation:</h2>
						<p>${f:h(project.documentation)}</p>
					</c:when>
					<c:otherwise>
						<h2>Informations:</h2>
						<p>${f:h(project.generalInfo)}</p>
					</c:otherwise>
				</c:choose>
			</div>

			<div id="right" class="column">
				<c:if test="${projectGroupNavType != null}">
					<span class="group_nav_upper">Stai navigando in</span><br>
					<span class="group_nav_header">${projectGroupNavDesc}</span>
					<br class="group_nav_spacer">
					<c:choose>
						<c:when test="${projectGroupNavPrev != null }">
							<span class="group_nav_link">
								<a href="/projects/project?id=${f:h(projectGroupNavPrev.key)}">&lt;&lt;
									Progetto precedente</a>
							</span>
						</c:when>
						<c:otherwise>
							<span class="group_nav_link disabled_link">&lt;&lt; Progetto precedente</span>
						</c:otherwise>
					</c:choose>
					<br>
					<c:choose>
						<c:when test="${projectGroupNavNext != null }">
							<span class="group_nav_link">
								<a href="/projects/project?id=${f:h(projectGroupNavNext.key)}">&gt;&gt;
									Progetto successivo</a>
							</span>
						</c:when>
						<c:otherwise>
							<span class="group_nav_link disabled_link">&gt;&gt; Progetto successivo</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

