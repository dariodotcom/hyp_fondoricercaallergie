<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title>Amministrazione Attività</title>
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
					<li><a href="/admin/">Pagina principale</a>
					<li><a href="/admin/projects">Gestione progetti</a></li>
					<li selected="true"><a href="/admin/activities">Gestione attività</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					String msg = (String) request.getAttribute("admin_msg");
					if(msg != null){
						out.println(showMsg(msg));
					}
				%>
				
				<h1>Gestione attività</h1>
				<p>Da qui è possibile gestire le attività.</p>
				<br>
				<h3>Crea una nuova attività:</h3>
				<p class="hint">Il codice HTML è supportato.</p>
				<form method="POST" action="/admin/createActivity">
					<p>
						<label for="activity_name">Nome:</label> <input type="text"
							id="activity_name" name="activity_name" maxlenght="50"
							value="${activity_name}" />
					</p>
					<p>
						<label for="activity_description">Informazioni:</label>
						<textarea id="activity_info" name="activity_info">${activity_info}</textarea>
					</p>
					<p>
						<label for="activity_description">Documentazione:</label>
						<textarea id="activity_description" name="activity_description">${activity_description}</textarea>
					</p>
					<p>
						<label for="linked_project">Progetto collegato:</label> <select
							id="linked_project" name="linked_project">
							<c:forEach items="${projects}" var="project">
								<option value="${f:h(project.key)}">${f:h(project.name)}</option>
							</c:forEach>
						</select>
					</p>
					<input type="submit" value="Crea attività">
				</form>
			</div>

			<div id="right" class="column">&nbsp;</div>
		</div>
	</div>
</body>
</html>
