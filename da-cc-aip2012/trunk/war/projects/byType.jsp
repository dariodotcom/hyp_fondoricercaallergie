<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Tutti i progetti</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("progetti")%>
		<div id="main">
			<div id="left" class="column">&nbsp;</div>

			<div id="content">
				<span id="orientation_info"> <a class="entry"
					href="/projects/">Progetti</a> &gt;
					<span class="entry">Progetti per tipo:</span>
				</span>
				<h1>${projectType}</h1>

				<c:choose>
					<c:when test="${projectType=='Alimentari'}">
						<p>Sono qui presenti tutti i progetti che coinvolgono il
							settore alimentare finanziati dal Ministero della Salute.</p>
					</c:when>
					<c:when test="${projectType=='Cosmetica'}">
						<p>Sono qui presenti tutti i progetti che coinvolgono il
							settore cosmetico finanziati dal Ministero della Salute.</p>
					</c:when>
					<c:when test="${projectType=='Farmaci'}">
						<p>Sono qui presenti tutti i progetti che coinvolgono il
							settore farmaceutico finanziati dal Ministero della Salute.</p>
					</c:when>
					<c:when test="${projectType=='Igiene'}">
						<p>Sono qui presenti tutti i progetti che coinvolgono il
							settore dell’igiene finanziati dal Ministero della Salute.</p>
					</c:when>
					<c:when test="${projectType=='Igiene'}">
						<p>Sono qui presenti tutti i progetti che coinvolgono il
							settore delle tecnologie finanziati dal Ministero della Salute.</p>
					</c:when>
				</c:choose>

				<ul>
					<c:choose>
						<c:when
							test="${projectList == null || fn:length(projectList) == 0 }">
							<span class="disabled_link">Nessun progetto disponibile in
								questa categoria.</span>
						</c:when>
						<c:otherwise>
							<c:forEach items="${projectList}" var="project">
								<li><a href="/projects/project?id=${f:h(project.key)}">${f:h(project.name)}</a></li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>

				<span>Torna a </span><a href="/projects/">progetti</a>
			</div>

			<div id="right" class="column">&nbsp;</div>
		</div>
	</div>
</body>
</html>