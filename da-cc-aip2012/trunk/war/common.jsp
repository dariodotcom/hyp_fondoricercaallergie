<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<%!private String[] landmarksNames = { "home", "progetti", "attività",
			"finanziatore" };
	private String[] landmarksURL = { "/", "/projects", "/activities", "" };

	String htmlHead(String title) {
		return "	<title>"
				+ title
				+ "</title>\n"
				+ "	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>\n"
				+ "	<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/global.css\"/>\n"
				+ "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />";
	}

	String banner() {
		return "	<div id=\"banner\">\n" + "	Fondo per la lotta alle allergie\n"
				+ "	</div>";
	}

	String landmarks(String selected) {
		StringBuilder landmarks = new StringBuilder(
				"<div id=\"landmarks\">\n<ul id=\"menu\">\n");

		for (int i = 0; i < landmarksNames.length; i++) {
			landmarks.append("<li class=\"menu_entry\"");

			if (selected.equals(landmarksNames[i])) {
				landmarks.append(" selected=\"true\"");
			}

			landmarks.append("><a href=\"" + landmarksURL[i] + "\">");
			landmarks.append(landmarksNames[i] + "</a>\n");
			landmarks.append("</li>\n");
		}

		landmarks.append("</ul>\n</div>");

		return landmarks.toString();
	}

	String header(String context) {

		return "header: " + context;
	}
	
	String linkList(String title){
		return "";
	}
	
	
	%>