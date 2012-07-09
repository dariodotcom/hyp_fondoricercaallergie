<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Progetti</title>
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
				<%
					//If request contains a message to display, display it!
					String msg = (String) request.getAttribute("msg");
					if (msg != null) {
						out.println(showMsg(msg));
					}
				%>

				<h1 class="title">Progetti</h1>
				<p>In questa sezione è possibile accedere a tutti i progetti
					finanziati dal ministero della salute a partire dal 2002 ad oggi. È
					possibile accedere ad un elenco di tutti i progetti ordinati
					alfabeticamente, oppure è possibile navigare in base al settore cui
					appartengono, o al loro anno di inizio.</p>
				<h4>Esplora i progetti:</h4>
				<ul class="list">
					<li class="list_entry"><a href="/projects/all"
						alt="Tutti i progetti">Tutti i progetti</a></li>
					<li class="list_entry">Progetti per tipo:
						<ul class="sub_list">
							<c:forEach items="${projectTypes}" var="type">
								<li class="sub_list_entry"><a
									href="/projects/byType?type=${f:h(type)}"> ${f:h(type)} </a></li>
							</c:forEach>
						</ul>
					</li>
					<li>Progetti per anno di inizio:
						<ul class="sub_list">
							<c:forEach items="${projectYears}" var="year">
								<li class="sub_list_entry"><span class="disabled_link">${f:h(year)}</span></li>
							</c:forEach>
						</ul>

					</li>

				</ul>
			</div>

			<div id="right" class="column">&nbsp;</div>

		</div>
	</div>
</body>
</html>
