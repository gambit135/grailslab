<%@ page import="lab.InstanciaMateria" %>
<%@ page import="lab.Inscripcion" %>
<%@ page import="lab.Prestamo" %>
<%@ page import="lab.Material" %>
<%@ page import="lab.Estado" %>
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
		<g:set var="entityName" value="Inscripcion" />

		<!-- PAGE TITLE -->
		<title>Detalles de Préstamo</title>
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
			<h1>Detalles de Préstamo</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
					
			<g:form url="[resource:prestamoInstance, action:'save']" >
				<fieldset class="form">
					<g:render template = "templates/detallePrestamo"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit action="delete" class = "delete" value="Borrar Préstamo" onclick = "return confirm('¿Deseas borrar este préstamo?')" />
					<g:link class = "edit" action="verAlumnos" id = "${prestamoInstance.id}">Editar Alumnos</g:link>
					<g:link class = "edit" action="verMateriales" id = "${prestamoInstance.id}">Editar Material</g:link>
					<g:link class = "save" action="concluirPrestamo" id = "${prestamoInstance.id}">Concluir Préstamo</g:link>
				</fieldset>
			</g:form>

			
		</div>

	</body>
	
</html>