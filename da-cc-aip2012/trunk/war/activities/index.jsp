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
				<h4>Structural links:</h4>
				<ul>
					<li>Voce 1</li>
					<li>Voce 2</li>
					<li>Voce 3</li>
					<li>Voce 4</li>
				</ul>
				<h4>Transition links:</h4>
				<ul>
					<li>Voce 1</li>
					<li>Voce 2</li>
					<li>Voce 3</li>
					<li>Voce 4</li>
				</ul>
			</div>

			<div id="content">
				<%
					String msg = (String) request.getAttribute("msg");
					if(msg != null){
						out.println(showMsg(msg));
					}
				%>
				
				<h1>List of activities:</h1>
				<ul>
					<c:forEach items="${activities}" var="activity">
						<li>${f:h(activity.name)} (<a
							href="/activities/activity?id=${f:h(activity.key)}">view</a>)
						</li>
					</c:forEach>
				</ul>
				<br> <br>
			</div>

			<div id="right" class="column"></div>
		</div>
	</div>
</body>
</html>