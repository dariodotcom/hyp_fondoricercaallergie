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
				<ul>
					<c:forEach items="${linkedActivities}" var="activity">
						<li>${f:h(activity.name)} (<a
							href="/activities/activity?id=${f:h(activity.key)}">View</a>)
						</li>
					</c:forEach>
				</ul>
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
				<c:if test="${groupNav != null}">
					<h4>${groupNavName}</h4>
					<c:choose>
						<c:when test="${groupNavPrev != null }">
							<p>
								<a href="/projects/project?id=${f:h(groupNavPrev.key)}">&lt;&lt;
									Progetto precedente</a>
							</p>
						</c:when>
						<c:otherwise>
							<p class="disabled_link">&lt;&lt; Progetto precedente</p>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${groupNavNext != null }">
							<p>
								<a href="/projects/project?id=${f:h(groupNavNext.key)}">&gt;&gt;
									Progetto successivo</a>
							</p>
						</c:when>
						<c:otherwise>
							<p class="disabled_link">&gt;&gt; Progetto successivo</p>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

