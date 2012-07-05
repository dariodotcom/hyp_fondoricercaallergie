<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Attività</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("attività")%>
		<div id="main">
			<div id="left" class="column">
				&nbsp;
			</div>

			<div id="content">
				<%
					String msg = (String) request.getAttribute("msg");
					if (msg != null) {
						out.println(showMsg(msg));
					}
				%>

				<h2>Attività</h2>
				<p>Testo di introduzione</p>

				<h4>Esplora le attività:</h4>
				<ul>
					<li><a href="/activities/all" alt="Tutte le attività">Tutte
							le attività</a></li>
				</ul>
				<br> <br>
			</div>

			<div id="right" class="column"></div>
		</div>
	</div>
</body>
</html>