<!DOCTYPE html>
<html>
	<head>
		<div id="header">
			<g:render template="/header"/> 
		</div>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label')	}" />
		<title>Seleccionar aval del préstamo</title>
	</head>
	<body>
		<a href="#create-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		 <!--NAVIGATION PANEL -->    
    	<g:render template="templates/navigation/navCreate"/> 
		
		<div id="create-prestamo" class="content scaffold-create" role="main">
			<h1>
				<g:message code="Seleccionar aval del préstamo" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!--Form with the set of radio inputs for search criteria -->
			<g:form name = "busquedaPor" action= "busquedaDeAvalPor" method="PUT" >
				<fieldset class="form">					
					<g:render template = "templates/busquedaAval" />				
				</fieldset>
			</g:form>

			<g:form url="[resource:prestamoInstance, action:'agregarAvalPorRadio']" >
				<g:hiddenField name="seleccionRadio" value="" />
				<fieldset class="buttons">
					<g:if test = "${params.buscando == 'true'}">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
