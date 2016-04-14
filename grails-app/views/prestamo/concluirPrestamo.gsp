<%@ page import="lab.Prestamo" %>

<html>
	<head>
		
		<div id="header">
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		


		<!-- PAGE TITLE -->
		<title><g:message code="Asignar alumnos a Préstamo" /></title><meta name="layout" content="main">

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="edit-prestamo" class="content scaffold-edit" role="main">
			<h1>Concluir Préstamo</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${prestamoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${prestamoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form url="[resource:prestamoInstance, action:'crearAdeudos']" method="PUT" >

				<g:hiddenField name="version" value="${prestamoInstance?.version}" />

				<fieldset class="form">
					<!--This renders a template for the prestamo fields -->					
					<g:render template="templates/concluir"/>
				</fieldset>

				<fieldset class="buttons">
					
					<g:link action="show" id = "${prestamoInstance.id}">Volver</g:link>	
					<g:actionSubmit action="crearAdeudos" class = "save" value="Concluir Préstamo" onclick = "return confirm('¿Deseas concluir este préstamo?')" />				
				</fieldset>

			</g:form>
		</div>

	</body>
	
</html>