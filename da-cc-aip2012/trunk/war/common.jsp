<%@page import="com.google.appengine.api.urlfetch.HTTPRequest"%>
<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<%!private String[] landmarksNames = { "home", "progetti", "attività",
			"risultati", "eventi", "partners", "finanziatore", "programma",
			"regole" };
	private String[] landmarksURL = { "/", "/projects", "/activities", null,
			null, null, "/financier", null, null };

	String headContent() {
		return "	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>\n"
				+ "	<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/global.css\"/>\n"
				+ "	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />";
	}

	String banner() {
		return "	<div id=\"banner\">\n"
//				+ "<img src=\"/src/logo.png\" id=\"logo\"/>\n"
				+ "Fondo Ricerca per le Allergie\n" + "	</div>";
	}

	String landmarks(String selected) {
		StringBuilder landmarks = new StringBuilder(
				"<div id=\"landmarks\">\n<ul id=\"menu\">\n");

		for (int i = 0; i < landmarksNames.length; i++) {
			if (landmarksURL[i] != null) {
				landmarks.append("<li class=\"menu_entry\"");
			} else {
				landmarks.append("<li class=\"menu_entry disabled\"");
			}

			if (selected.equals(landmarksNames[i])) {
				landmarks.append(" selected=\"true\"");
			}

			landmarks.append("><a href=\""
					+ (landmarksURL[i] == null ? "javascript:void(0)"
							: landmarksURL[i]) + "\">");
			landmarks.append(landmarksNames[i] + "</a>\n");
			landmarks.append("</li>\n");
		}

		landmarks.append("</ul>\n</div>");

		return landmarks.toString();
	}

	String header(String context) {

		return "header: " + context;
	}

	String linkList(String title) {
		return "";
	}

	String makeLink(String url, String text, String tooltip, boolean enabled) {
		if (!enabled) {
			return "<span class=\"disabled_link\">" + text + "</span>";
		} else {
			String format = "<a href=\"%s\" alt=\"%s\">%s</a>";
			return String.format(format, url, tooltip, text);
		}
	}

	String showMsg(String msg) {
		String format = "<div class=\"admin_msg\"> %s <span class=\"close\" onclick=\"this.parentNode.style.display='none'\">X</span></div>";
		return String.format(format, msg);
	}%>