<%@ page import="lab.Materia" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Materia" />

		<!-- PAGE TITLE -->
		<title><g:message code="materia.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-materia" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list materia">
				
				<!-- IF FIELD EXISTS -->
				<g:if test="${materiaInstance?.nombre}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="nombre-label" class="property-label"><g:message code="Nombre de Materia" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${materiaInstance}" 
							field="nombre"/>
						</span>
					</li>
				</g:if>

				<!-- IF FIELD EXISTS -->
				<g:if test="${materiaInstance?.nivel}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="nivel-label" class="property-label"><g:message code="Nivel" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="nivel-label"><g:fieldValue bean="${materiaInstance}" 
							field="nivel"/>
						</span>
					</li>
				</g:if>
			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:materiaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${materiaInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>