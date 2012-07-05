<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Finanziatore</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("finanziatore")%>

		<%
			String view = (String) request.getAttribute("view");
			boolean viewInfo = (view != null && view.equals("info"));
		%>
		<div id="main">
			<div id="left" class="column">
				<h4>Sezioni:</h4>
				<ul>
					<li selected="<%=!viewInfo%>"><a href="/financier">
							Presentazione </a></li>
					<li selected="<%=viewInfo%>"><a href="/financier?view=info">
							Informazioni dettagliate </a></li>

				</ul>
			</div>

			<div id="content">
				<h1>Finanziatore</h1>
				<c:choose>
					<c:when test="${view=='info'}">
						<h2>Informazioni dettagliate:</h2>
					</c:when>
					<c:otherwise>
						<h2>Presentazione</h2>
					</c:otherwise>
				</c:choose>
			</div>

			<div id="right" class="column">&nbsp;</div>
		</div>
	</div>
</body>
</html>
