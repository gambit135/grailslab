<%@ page import="lab.TipoMaterial" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="TipoMaterial" />

		<!-- PAGE TITLE -->
		<title>Mostrar Tipo de Material</title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-tipoMaterial" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1>Mostrar Tipo de Material</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list tipoMaterial">				
				<!-- IF FIELD EXISTS -->
				<g:if test="${tipoMaterialInstance?.tipo}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="tipo-label" class="property-label">
							<g:message code="Tipo de Material" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="tipo-label">
							<g:fieldValue bean="${tipoMaterialInstance}" field="tipo"/>
						</span>
					</li>
				</g:if>		


				<!-- IF FIELD EXISTS -->
				<g:if test="${tipoMaterialInstance?.descripcion}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="descripcion-label" class="property-label">
							<g:message code="Descripción" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="descripcion-label">
							<g:fieldValue bean="${tipoMaterialInstance}" field="descripcion"/>
						</span>
					</li>
				</g:if>		
			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:tipoMaterialInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${tipoMaterialInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>