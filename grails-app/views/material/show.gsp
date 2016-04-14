<%@ page import="lab.Material" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Material" />

		<!-- PAGE TITLE -->
		<title><g:message code="material.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-material" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list material">
				
				<!-- IF tipoMaterial EXISTS -->
				<g:if test="${materialInstance?.tipoMaterial}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="tipoMaterial-label" class="property-label">
							<g:message code="Tipo de Material" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="tipoMaterial-label">		
							<g:fieldValue bean="${lab.TipoMaterial.findById(materialInstance.tipoMaterial.id)}" field="tipo"/>
						</span>
					</li>
				</g:if>

				<!-- IF nombre EXISTS -->
				<g:if test="${materialInstance?.nombre}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="nombre-label" class="property-label">
							<g:message code="Nombre" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="nombre-label">		
							<g:fieldValue bean="${materialInstance}" field="nombre"/>
						</span>
					</li>
				</g:if>

				<!-- IF codigo EXISTS -->
				<g:if test="${materialInstance?.codigo}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="codigo-label" class="property-label">
							<g:message code="Código" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="codigo-label">		
							<g:fieldValue bean="${materialInstance}" field="codigo"/>
						</span>
					</li>
				</g:if>

				<!-- IF Estado EXISTS -->
				<g:if test="${materialInstance?.estado}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="estado-label" class="property-label">
							<g:message code="Estado" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="estado-label">		
							<g:fieldValue bean="${lab.Estado.findById(materialInstance.estado.id)}" field="nombre"/>
						</span>
					</li>
				</g:if>

			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:materialInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${materialInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>