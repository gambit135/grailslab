<%@ page import="lab.Estado" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Estado" />

		<!-- PAGE TITLE -->
		<title><g:message code="estado.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-estado" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list estado">				
				<!-- IF FIELD EXISTS -->
				<g:if test="${estadoInstance?.nombre}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="nombre-label" class="property-label">
							<g:message code="Nombre" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="nombre-label">
							<g:fieldValue bean="${estadoInstance}" field="nombre"/>
						</span>
					</li>
				</g:if>		


				<!-- IF FIELD EXISTS -->
				<g:if test="${estadoInstance?.descripcion}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="descripcion-label" class="property-label">
							<g:message code="Descripción" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="descripcion-label">
							<g:fieldValue bean="${estadoInstance}" field="descripcion"/>
						</span>
					</li>
				</g:if>		
			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:estadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${estadoInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>