<%@ page import="lab.InstanciaMateria" %>
<%@ page import="lab.Inscripcion" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Inscripcion" />

		<!-- PAGE TITLE -->
		<title><g:message code="inscripcion.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-inscripcion" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list inscripcion">
				
				<!-- IF Alumno EXISTS -->
				<g:if test="${inscripcionInstance?.alumno}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="alumno-label" class="property-label">
							<g:message code="Alumno" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="alumno-label">
							<g:link controller = "alumno"action="show" id="${inscripcionInstance?.alumno?.id}">
								<g:fieldValue bean="${inscripcionInstance?.alumno}" field="boleta"/>
							</g:link>
							<br>
							<g:fieldValue bean="${inscripcionInstance?.alumno}" 
							field="apPat"/>
							<g:fieldValue bean="${inscripcionInstance?.alumno}" 
							field="apMat"/>
							<g:fieldValue bean="${inscripcionInstance?.alumno}" 
							field="nombre"/>
						</span>
					</li>
				</g:if>

				<!-- IF InstanciaMateria EXISTS -->
				<g:if test="${inscripcionInstance?.instanciaMateria}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="grupo-label" class="property-label">
							<g:message code="Grupo" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="grupo-label">
							<g:link controller = "instanciaMateria" action="show" id="${lab.InstanciaMateria.findById(inscripcionInstance?.instanciaMateria?.id)?.id}">
								<g:fieldValue bean="${lab.InstanciaMateria.findById(inscripcionInstance?.instanciaMateria?.id)}" field="grupo"/>
							</g:link>
						</span>
					</li>

					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="materia-label" class="property-label">Instancia de Materia</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="materia-label">
							<g:link controller="instanciaMateria" action="show" id="${inscripcionInstance?.instanciaMateria.id}">
								<g:fieldValue bean="${lab.InstanciaMateria.findById(inscripcionInstance?.instanciaMateria?.id)}" field="materia"/>
							</g:link>
						</span>
					</li>					
				</g:if>
			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:inscripcionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${inscripcionInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>