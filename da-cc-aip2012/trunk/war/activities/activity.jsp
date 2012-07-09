<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<%
	//Find out what to show
	String view = (String) request.getAttribute("view");
	boolean viewDesc = view != null && view.equals("desc");
%>

<!doctype html>
<html>
<head>
<title>${f:h(activity.name)}</title>
<!-- Common head -->
<%=headContent()%>
</head>
<body>
	<div id="container">
		<!-- Banner -->
		<%=banner()%>
		
		<!-- Landmarks -->
		<%=landmarks("attività")%>

		<div id="main">
			<div id="left" class="column">

				<!-- Structural links -->
				<div class="col_family">
					<h4 class="col_header">Attività</h4>
					<ul class="col_list">
						<li selected="<%=!viewDesc%>"><a
							href="/activities/activity?id=${f:h(activity.key)}">
								Informazioni generali </a></li>
						<li selected="<%=viewDesc%>"><a
							href="/activities/activity?id=${f:h(activity.key)}&view=desc">
								Descrizione </a></li>

					</ul>
				</div>

				<!-- Transition links -->
				<div class="col_family">
					<h4 class="col_header">Legata a:</h4>
					<ul class="col_list">
						<li><a href="/projects/project?id=${f:h(linkedProject.key)}">${f:h(linkedProject.name)}</a></li>
					</ul>
				</div>

				<div class="col_family">
					<h4 class="col_header">Porta a:</h4>
					<ul class="col_list">
						<li><span class="disabled_link">Risultato non
								disponibile</span></li>
					</ul>
				</div>

				<div class="col_family">
					<span class="col_header disabled_link">Partner correlati</span>
				</div>
			</div>

			<!-- Content -->
			<div id="content">
				<span id="orientation_info"> <a class="entry" href="/activities/">Attività</a>
					&gt; <c:if test="${ activityGroupNavDesc != null }">
						<a class="entry" href="${activityGroupNavIndex}">${activityGroupNavDesc}</a> &gt;
					</c:if>
				</span>

				<h1 class="content_title">${f:h(activity.name)}</h1>
				<c:choose>
					<c:when test="${view=='desc'}">
						<h2 class="content_section">Descrizione dettagliata</h2>
						<p>${activity.description}</p>
					</c:when>
					<c:otherwise>
						<h2 class="content_section">Informazioni generali</h2>
						<p>${activity.generalInfo}</p>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Group Links -->
			<div id="right" class="column">
				<c:if test="${activityGroupNavType != null}">
					<div class="col_family">
						<span class="group_nav_upper">Stai navigando in</span> <br> <span
							class="group_nav_header">${activityGroupNavDesc}</span>
						<ul class="group_nav_list">
							<li><a class="group_nav_link"
								href="${f:h(activityGroupNavIndex)}">Indice</a></li>
							<li><c:choose>
									<c:when test="${activityGroupNavPrev != null }">
										<a class="group_nav_link"
											href="/activities/activity?id=${f:h(activityGroupNavPrev.key)}">
											Attività precedente</a>
									</c:when>
									<c:otherwise>
										<span class="group_nav_link disabled_link"> Attività
											precedente</span>
									</c:otherwise>
								</c:choose></li>
							<li><c:choose>
									<c:when test="${activityGroupNavNext != null }">
										<a class="group_nav_link"
											href="/activities/activity?id=${f:h(activityGroupNavNext.key)}">
											Attività successiva</a>
									</c:when>
									<c:otherwise>
										<span class="group_nav_link disabled_link"> Attività
											successiva</span>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>
				</c:if>
			</div>
			
		</div>
	</div>
</body>
</html>