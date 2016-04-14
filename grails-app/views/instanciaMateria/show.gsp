<%@ page import="lab.InstanciaMateria" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="InstanciaMateria" />

		<!-- PAGE TITLE -->
		<title>Mostrar Instancia de Materia</title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-instanciaMateria" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1>Mostrar Instancia de Materia</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list instanciaMateria">
				
				<!-- IF Materia EXISTS -->
				<g:if test="${instanciaMateriaInstance?.materia}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="materia-label" class="property-label"><g:message code="Materia" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="materia-label">
							<g:link controller = "materia" action="show" 
								id="${lab.Materia.findById(instanciaMateriaInstance?.materia?.id)?.id}">
								
								<g:fieldValue bean="${instanciaMateriaInstance}" field="materia"/>
							</g:link>
						</span>
					</li>
				</g:if>

				<!-- IF Grupo EXISTS -->
				<g:if test="${instanciaMateriaInstance?.grupo}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="grupo-label" class="property-label"><g:message code="Grupo" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="grupo-label"><g:fieldValue bean="${instanciaMateriaInstance}" 
							field="grupo"/>
						</span>
					</li>
				</g:if>

				<!-- IF profesor titular EXISTS -->
				<g:if test="${instanciaMateriaInstance?.titular}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="titular-label" class="property-label">
							<g:message code="Profesor Titular" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="titular-label">

							<g:link controller = "profesor" action="show" 
								id="${instanciaMateriaInstance?.titular?.id}">

								<g:fieldValue bean="${instanciaMateriaInstance?.titular}" field="apPat"/>
								<g:fieldValue bean="${instanciaMateriaInstance?.titular}" field="apMat"/>
								<g:fieldValue bean="${instanciaMateriaInstance?.titular}" field="nombre"/>
							</g:link>

						</span>
					</li>
				</g:if>

				<!-- IF profesor auxiliar EXISTS -->
				<g:if test="${instanciaMateriaInstance?.auxiliar}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="auxiliar-label" class="property-label"><g:message code="Profesor Auxiliar" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="auxiliar-label">
							<g:link controller = "profesor" action="show" 
								id="${instanciaMateriaInstance?.auxiliar?.id}">
								<g:fieldValue bean="${instanciaMateriaInstance?.auxiliar}" field="apPat"/>
								<g:fieldValue bean="${instanciaMateriaInstance?.auxiliar}" field="apMat"/>
								<g:fieldValue bean="${instanciaMateriaInstance?.auxiliar}" field="nombre"/>
							</g:link>
						</span>
					</li>
				</g:if>

				<!-- IF diaDeLaSemana EXISTS -->
				<g:if test="${instanciaMateriaInstance?.diaDeLaSemana}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="diaDeLaSemana-label" class="property-label"><g:message code="instanciaMateria.diaDeLaSemana.label" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="diaDeLaSemana-label">
							<g:message code="ENUM.DiasSemana.${instanciaMateriaInstance?.diaDeLaSemana}" />							
						</span>
					</li>
				</g:if>

				<!-- IF hora EXISTS -->
				<g:if test="${instanciaMateriaInstance?.hora}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="hora-label" class="property-label"><g:message code="instanciaMateria.hora.label" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="hora-label">
							<g:message code="ENUM.horasDeClase.${instanciaMateriaInstance?.hora}" />
						</span>
					</li>
				</g:if>

				<!-- IF periodo EXISTS -->
				<g:if test="${instanciaMateriaInstance?.periodo}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="periodo-label" class="property-label"><g:message code="instanciaMateria.Periodo" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="periodo-label">
							<g:link controller = "periodo" action="show" 
								id="${instanciaMateriaInstance?.periodo?.id}">
								
								<g:fieldValue bean="${instanciaMateriaInstance?.periodo}" field="periodo"/>
							</g:link>
						</span>
					</li>
				</g:if>


			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:instanciaMateriaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${instanciaMateriaInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>