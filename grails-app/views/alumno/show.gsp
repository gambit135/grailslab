<%@ page import="lab.Alumno" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Alumno" />

		<!-- PAGE TITLE -->
		<title><g:message code="alumno.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-alumno" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list alumno">
				
				<!-- IF FIELD EXISTS -->
				<g:if test="${alumnoInstance?.boleta}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="boleta-label" class="property-label"><g:message code="Boleta" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="boleta-label">
							<g:fieldValue bean="${alumnoInstance}" field="boleta"/>
						</span>
					</li>
				</g:if>

				<!-- IF FIELD EXISTS -->
				<g:if test="${alumnoInstance?.apPat}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="apPat-label" class="property-label"><g:message code="Apellido Paterno" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="apPat-label"><g:fieldValue bean="${alumnoInstance}" 
							field="apPat"/>
						</span>
					</li>
				</g:if>

				<!-- IF FIELD EXISTS -->
				<g:if test="${alumnoInstance?.apMat}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="apMat-label" class="property-label"><g:message code="Apellido Materno" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${alumnoInstance}" 
							field="apMat"/>
						</span>
					</li>
				</g:if>


				<!-- IF FIELD EXISTS -->
				<g:if test="${alumnoInstance?.nombre}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="nombre-label" class="property-label"><g:message code="Nombre" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${alumnoInstance}" 
							field="nombre"/>
						</span>
					</li>
				</g:if>
			</ol>

						
			<!-- specific action pane -->
			<g:form url="[resource:alumnoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${alumnoInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>