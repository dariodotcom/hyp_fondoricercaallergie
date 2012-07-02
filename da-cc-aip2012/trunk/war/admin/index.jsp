<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Amministrazione</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("")%>

		<div id="main">
			<div id="left" class="column">
				<h4>Amministrazione:</h4>
				<ul>
					<li selected="true"><a href="/admin/">Pagina principale</a>
					<li><a href="/admin/projects">Gestione progetti</a></li>
					<li><a href="/admin/activities">Gestione attività</a></li>
				</ul>
			</div>

			<div id="content">
				<h1>Amministrazione</h1>
				<p>
				Benvenuto nella sezione amministrazione; è
				qui possibile modificare i contenuti della piattaforma.
				</p>	
			</div>

			<div id="right" class="column">&nbsp;</div>
		</div>
	</div>
</body>
</html>
