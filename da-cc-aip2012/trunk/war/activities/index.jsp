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

				<h1 class="title">Attività</h1>
				<p>
				In questa sezione è possibile accedere alle varie attività svolte sui progetti finanziati,
				utili al fine di testare quanto proposto e a portare i progetti a risultati concreti. È
				possibile accedere a un elenco di tutte le attività ordinate alfabeticamente, oppure per
				settore di appartenenza. 
				</p>

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