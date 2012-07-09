<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Tutti i progetti</title>
<!-- Common head lines -->
<%=headContent()%>
</head>
<body>
	<div id="container">
		<!-- Banner -->
		<%=banner()%>
		
		<!-- Landmarks -->
		<%=landmarks("progetti")%>
		
		<div id="main">
			<div id="left" class="column">&nbsp;</div>

			<!-- Content -->
			<div id="content">
				<span id="orientation_info"> <a class="entry"
					href="/projects/">Progetti</a> &gt;
				</span>

				<h1>Tutti i progetti</h1>
				<p>E’ qui presente un elenco di tutti i progetti finanziati dal
					Ministero della Salute ordinati alfabeticamente.</p>

				<c:choose>
					<c:when
						test="${projectList == null || fn:length(projectList) == 0 }">
						<span class="disabled_link">Nessun progetto disponibile in
							questa categoria.</span>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach items="${projectList}" var="project">
								<li><a href="/projects/project?id=${f:h(project.key)}">${f:h(project.name)}</a></li>
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