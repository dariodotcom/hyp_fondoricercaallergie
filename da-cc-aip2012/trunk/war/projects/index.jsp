<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Progetti</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("progetti")%>

		<div id="main">
			<div id="left" class="column">&nbsp;</div>

			<div id="content">
				<%
					String msg = (String) request.getAttribute("msg");
					if (msg != null) {
						out.println(showMsg(msg));
					}
				%>

				<h2>Progetti</h2>
				<p>Testo di introduzione</p>

				<h4>Esplora i progetti:</h4>
				<ul>
					<li><a href="/projects/all" alt="Tutti i progetti">Tutti i
							progetti</a></li>
					<li>Progetti per tipo:</li>
					<ul>
						<c:forEach items="${projectTypes}" var="type">
							<li><a href="/projects/byType?type=${f:h(type)}">
									${f:h(type)} </a></li>
						</c:forEach>
					</ul>
					<li>Progetti per anno di inizio:</li>
				</ul>
			</div>

			<div id="right" class="column"></div>

		</div>
	</div>
</body>
</html>
