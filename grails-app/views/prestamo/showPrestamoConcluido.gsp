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

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Prestamo" />
		
		<!--Si tiene adeudos, no se puede eliminar-->
		<g:set var="adeudado" value="${false}"/>

		<!-- para cada tupla del préstamo -->
		<g:each in="${prestamoInstance?.tuplasMaterial}" var="tup">
			<!-- Si la tupla tiene adeudo -->
			<g:if test="${tup.adeudo}">
				<!-- Si el adeudo no ha sido saldado -->
				<g:if test= "${tup?.adeudo?.saldado == false}">
					<g:set var="adeudado" value="${true}"/>
				</g:if>
			</g:if>
		</g:each>

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
			<h1>Detalles de Préstamo Concluido</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
					
			<g:form url="[resource:prestamoInstance, action:'save']" >
				<fieldset class="form">
					<g:render template = "templates/detallePrestamoConcluido"/>
				</fieldset>
				<fieldset class="buttons">
					<!-- Sólo puede borrarse si no tiene adeudos -->
					<!--<g:if test = "${adeudado == false}">-->
						<g:actionSubmit action="delete" class = "delete" value="Borrar Préstamo" onclick = "return confirm('¿Deseas borrar este préstamo?')" />
					<!--</g:if>-->
				</fieldset>
			</g:form>

			
		</div>

	</body>
	
</html>