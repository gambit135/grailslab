<%@ page import="lab.Prestamo" %>

<html>
	<head>
		
		<div id="header">
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Prestamo" />

		<!-- PAGE TITLE -->
		<title><g:message code="Asignar alumnos a Préstamo" /></title>
		<meta name="layout" content="main">

	</head>
	<body>
	    <g:render template="templates/navigation/navCreate"/> 
		<!-- ACTUAL PAGE CONTENT -->

		<div id="edit-prestamo" class="content scaffold-edit" role="main">
			<h1>Asignar alumnos a Préstamo</h1>
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

			<g:form url="[resource:prestamoInstance, action:'agregarAlumnoAPrestamo']" method="PUT" >

				<g:hiddenField name="version" value="${prestamoInstance?.version}" />

				<fieldset class="form">
					<!--This renders a template for the prestamo fields -->					
					<g:render template="templates/alumnos"/>
				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit action="delete" class = "delete" value="Cancelar" onclick = "return confirm('¿Deseas borrar este préstamo?')" />
					<g:hiddenField name="accion" value="registrarAlumnos" />
					<g:actionSubmit class="save" action="agregarAlumnoAPrestamo" value="Agregar alumno a Prestamo" />
					<g:link action="registrarTuplasMaterial" id = "${prestamoInstance.id}" params = "[buscarPor:'codigo']">Continuar a Materiales </g:link>					
				</fieldset>
			</g:form>
		</div>

	</body>
	
</html>