<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@include file="/common.jsp"%>

<!doctype html>
<html>
<head>
<title>Finanziatore</title>
<%=headContent()%>
</head>
<body>
	<div id="container">
		<%=banner()%>
		<%=landmarks("finanziatore")%>

		<%
			String view = (String) request.getAttribute("view");
			boolean viewInfo = (view != null && view.equals("info"));
		%>
		<div id="main">
			<div id="left" class="column">
				<div class="col_family">
					<h4 class="col_header">Sezioni:</h4>
					<ul class="col_list">
						<li selected="<%=!viewInfo%>"><a href="/financier">
								Presentazione </a></li>
						<li selected="<%=viewInfo%>"><a href="/financier?view=info">
								Informazioni dettagliate</a></li>

					</ul>
				</div>
			</div>

			<div id="content">
				<h1 class="content_title">Finanziatore</h1>
				<c:choose>
					<c:when test="${view=='info'}">
						<h2 class="content_section">Informazioni dettagliate</h2>

						<b>Organizzazione</b>
						<p>Il dicastero è organizzato in uffici a diretta
							responsabilità del vertice politico e uffici propri del
							ministero, in via di riorganizzazione.</p>
						<p>Nel vertice politico troviamo:
						<ul>
							<li>il Ministro</li>
							<li>i Sottosegretari di Stato</li>
							<li>gli Uffici di diretta collaborazione</li>
							<li>il Segretariato Generale</li>
							<li>la Biblioteca</li>
						</ul>
						</p>
						<p>L'organizzazione propria del dicastero è strutturata in
							quattro Dipartimenti che a loro volta sono divisi in Direzioni
							Generali:
						<ul>
							<li>il Dipartimento della Qualità, suddiviso in 3 Direzioni
								Generali:
								<ul>
									<li>DG Programmazione Sanitaria, Livelli di Assistenza e
										Principi Etici di Sistema</li>
									<li>DG Risorse Umane e Professioni Sanitarie</li>
									<li>DG Sistema Informativo</li>
								</ul>
							</li>
							<li>il Dipartimento dell'Innovazione, suddiviso in 3
								Direzioni Generali:
								<ul>
									<li>DG Farmaci e Dispositivi Medici</li>
									<li>DG Ricerca Scientifica e Tecnologica</li>
									<li>DG Personale, Organizzazione e Bilancio</li>
								</ul>
							</li>
							<li>il Dipartimento Prevenzione e Comunicazione, suddiviso
								in 3 Direzioni Generali:
								<ul>
									<li>DG Prevenzione Sanitaria</li>
									<li>DG Comunicazione e Relazioni Istituzionali</li>
									<li>DG Rapporti con l'Unione Europea e Rapporti
										Internazionali</li>
								</ul>
							</li>
							<li>il Dipartimento per la sanità pubblica veterinaria, la
								nutrizione e la sicurezza degli alimenti, suddiviso in 2
								Direzioni Generali ed 1 Segretariato:
								<ul>
									<li>DG Sanità Animale e Farmaco Veterinario</li>
									<li>DG Sicurezza degli Alimenti e della Nutrizione</li>
									<li>Segretariato nazionale della Valutazione del Rischio
										della Catena Alimentare</li>
								</ul>
							</li>
						</ul>
						<b>Strutture periferiche</b>
						<p>Dal ministero dipendono i seguenti uffici territoriali:
						<ul>
							<li>gli Uffici di sanità marittima, aerea e di frontiera -
								USMAF, sono gli uffici del Ministero situati nei maggiori porti
								ed aeroporti al fine di monitorare il rischio di malattie
								importate dall'estero; sono in numero di 12;</li>
							<li>gli Uffici Veterinari per gli Adempimenti degli obblighi
								Comunitari - UVAC curano l'assistenza tra autorità
								amministrative nazionali e comunitarie in materia di
								legislazione veterinaria e zootecnica, presenti in tutto il
								territorio nazionale, sono in numero di 17;</li>
							<li>i Posti di Ispezione Frontaliera - PIF, sono gli uffici
								del dicastero che effettuano i controlli di frontiera in materia
								di sanità animale, sono in numero di 38;</li>
							<li>i Servizi Assistenza Sanitaria Naviganti - SASN, ossia
								uffici dipendenti dal Ministero che erogano l'assistenza
								sanitaria al personale in navigazione marittima o aerea. Essi
								sono in numero di 27.</li>
						</ul>
					</c:when>
					<c:otherwise>
						<h2 class="content_section">Presentazione</h2>
						<p>Il Ministero della Salute è un dicastero con portafoglio
							del Governo italiano, con compiti in materia sanitaria, di
							profilassi e raccordo con le istituzioni internazionali ed
							europee nel campo della salute.</p>
						<p>Il Ministero della Salute è l'organo centrale del Servizio
							Sanitario Nazionale, cui sono attribuite le funzioni spettanti
							allo Stato in materia di tutela della salute umana, di
							coordinamento del Sistema sanitario nazionale, di sanità
							veterinaria, di tutela della salute nei luoghi di lavoro, di
							igiene e sicurezza degli alimenti, fermo restando le competenze
							esclusive delle Regioni che le esercitano tramite le Aziende
							Sanitarie Locali. Predispone il Piano sanitario nazionale.
							Rappresenta l'elemento di raccordo con l'Organizzazione Mondiale
							della Sanità - OMS o anche WHO e con l'Agenzia europea per i
							medicinali - EMEA.
						<p>
					</c:otherwise>
				</c:choose>
			</div>

			<div id="right" class="column"></div>
		</div>
	</div>
</body>
</html>
