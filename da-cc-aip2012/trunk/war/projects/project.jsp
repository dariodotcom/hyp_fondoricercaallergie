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
				<div class="col_family">
					<h4 class="col_header">Progetto</h4>
					<%
						String view = (String) request.getAttribute("view");
						boolean viewDoc = view != null && view.equals("doc");
					%>
					<ul class="col_list">
						<li selected="<%=!viewDoc%>"><a
							href="/projects/project?id=${f:h(project.key)}"> Informazioni
								generali </a></li>
						<li selected="<%=viewDoc%>"><a
							href="/projects/project?id=${f:h(project.key)}&view=doc">
								Documentazione </a></li>

					</ul>
				</div>

				<div class="col_family">
					<h4 class="col_header">Eventi correlati</h4>
					<ul class="col_list">
						<c:choose>
							<c:when
								test="${linkedEvents == null || fn:length(linkedEvents) == 0 }">
								<li><span class="disabled_link"> Nessun evento
										disponibile </span></li>
							</c:when>
							<c:otherwise>
								<!-- FUTURE IMPLEMENTATION -->
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col_family">
					<a class="col_header"
						href="/activities/linkedTo?projectId=${f:h(project.key)}">
						Attività correlate</a>
				</div>

				<div class="col_family">
					<h4 class="col_header">Risultati correlati</h4>
					<ul class="col_list">
						<c:choose>
							<c:when
								test="${linkedResults == null || fn:length(linkedResults) == 0 }">
								<li><span class="disabled_link"> Nessun risultato
										disponibile </span></li>
							</c:when>
							<c:otherwise>
								<!-- FUTURE IMPLEMENTATION -->
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col_family">
					<span class="col_header disabled_link">Partner correlati</span>
				</div>
			</div>

			<div id="content">
				<span id="orientation_info"> <a class="entry"
					href="/projects/">Progetti</a> &gt; <c:if
						test="${ projectGroupNavDesc != null }">
						<a class="entry" href="${projectGroupNavIndex}">${projectGroupNavDesc}</a> &gt;
				</c:if>
				</span>

				<h1 class="content_title">${f:h(project.name)}</h1>
				<c:choose>
					<c:when test="${view=='doc'}">
						<h2 class="content_section">Documentazione:</h2>
						<p>${f:h(project.documentation)}</p>
					</c:when>
					<c:otherwise>
						<h2 class="content_section">Informazioni generali:</h2>
						<p>${f:h(project.generalInfo)}</p>
					</c:otherwise>
				</c:choose>
			</div>

			<div id="right" class="column">
				<c:if test="${projectGroupNavType != null}">
					<div class="col_family">
						<span class="group_nav_upper">Stai navigando in</span> <br> <span
							class="group_nav_header">${projectGroupNavDesc}</span>

						<ul class="group_nav_list">
							<li><a class="group_nav_link"
								href="${f:h(projectGroupNavIndex)}">Indice</a></li>
							<li><c:choose>
									<c:when test="${projectGroupNavPrev != null }">
										<a class="group_nav_link"
											href="/projects/project?id=${f:h(projectGroupNavPrev.key)}">
											Progetto precedente</a>
									</c:when>
									<c:otherwise>
										<span class="group_nav_link disabled_link"> Progetto
											precedente</span>
									</c:otherwise>
								</c:choose></li>
							<li><c:choose>
									<c:when test="${projectGroupNavNext != null }">
										<a class="group_nav_link"
											href="/projects/project?id=${f:h(projectGroupNavNext.key)}">
											Progetto successivo</a>
									</c:when>
									<c:otherwise>
										<span class="group_nav_link disabled_link"> Progetto
											successivo</span>
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