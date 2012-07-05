<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title>Amministrazione Progetti</title>
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
					<li selected="true"><a href="/admin/projects">Gestione
							progetti</a></li>
					<li><a href="/admin/activities">Gestione attività</a></li>
				</ul>
			</div>

			<div id="content">
				<%
					String msg = (String) request.getAttribute("admin_msg");
					if (msg != null) {
						out.println(showMsg(msg));
					}
				%>

				<h1>Gestione progetti</h1>
				<p>Da qui è possibile gestire i progetti.</p>
				<br>
				<h3>Crea un nuovo progetto:</h3>
				<p class="hint">Il codice HTML è supportato.</p>
				<form method="POST" action="/admin/createProject">
					<p>
						<label for="project_name">Nome:</label> <input type="text"
							id="project_name" name="project_name" maxlenght="50"
							value="${project_name}" />
					</p>
					<p>
						<label for="project_type">Tipo:</label><select id="project_type"
							name="project_type">
							<c:forEach items="${projectTypes}" var="type">
								<option value="${f:h(type)}">${f:h(type)}</option>
							</c:forEach>
						</select>
					</p>
					<p>
						<label for="project_description">Informazioni generali:</label>
						<textarea id="project_info" name="project_info">${project_info}</textarea>
					</p>
					<p>
						<label for="project_documentation">Documentazione:</label>
						<textarea id="project_documentation" name="project_documentation">${project_documentation}</textarea>
					</p>
					<input type="submit" value="Crea progetto">
				</form>
			</div>

			<div id="right" class="column">&nbsp;</div>
		</div>
	</div>
</body>
</html>
