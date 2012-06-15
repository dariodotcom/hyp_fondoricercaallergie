<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Admin page</title>
	</head>
	<body>
		<h2>Create project</h2>
		<form method="POST" action="/admin/createProject">
			<p>
				<label for="project_name">Project name:</label>
				<input type="text" id="project_name" name="project_name" maxlenght="50"/>
			</p>
			<p>
				<label for="project_description">Project description:</label>
				<textarea id="project_info" name="project_info">
				</textarea>
			</p>
			<p>
				<label for="project_documentation">Project description:</label>
				<textarea id="project_documentation" name="project_documentation">
				</textarea>
			</p>
			<input type="submit" value="Create">
		</form>
		
		<h2>Create activity</h2>
		<form method="POST" action="/admin/createActivity">
			<p>
				<label for="activity_name">Activity name:</label>
				<input type="text" id="activity_name" name="activity_name" maxlenght="50"/>
			</p>
			<p>
				<label for="activity_description">Activity description:</label>
				<textarea id="activity_info" name="activity_info">
				</textarea>
			</p>
			<p>
				<label for="activity_description">Activity documentation:</label>
				<textarea id="activity_description" name="activity_description">
				</textarea>
			</p>
			<p>
				<label for="linked_project">Linked Project</label>
				<select id="linkedProject" name="linked_project">
						<c:forEach items="${projects}" var="project">
							<option value="${project.key}">${project.name}</option>
						</c:forEach>
				</select>
			</p>
			<input type="submit" value="Create activity">
		</form>
	</body>
</html>
