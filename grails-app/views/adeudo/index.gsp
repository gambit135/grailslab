
<%@ page import="lab.Adeudo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adeudo.label', default: 'Adeudo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-adeudo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-adeudo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<!--Aval-Boleta-->
						<g:sortableColumn property="tuplaMaterial.prestamo.aval.alumno.boleta" title="Aval" />
						<!--Aval-ApPat -->
						<g:sortableColumn property="tuplaMaterial.prestamo.aval.alumno.apPat" title="Aval" />
						<!--Material Adeudado - Nombre -->
						<g:sortableColumn property="tuplaMaterial.material.nombre" title="Nombre" />

						<!--Material Adeudado - Código -->
						<g:sortableColumn property="tuplaMaterial.material.codigo" title="Codigo" />

						<!--Material Adeudado - Tipo -->
						<g:sortableColumn property="tuplaMaterial.material.tipoMaterial.tipo" title="Tipo" />

						<!--Fecha de sesión -->
						<g:sortableColumn property="tuplaMaterial.prestamo.sesion.fecha" title="Fecha" />						

						<!--Saldado -->				
					
					
						<g:sortableColumn property="saldado" title="${message(code: 'adeudo.saldado.label', default: 'Saldado')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${adeudoInstanceList}" status="i" var="adeudoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<!-- Aval Boleta-->
						<td><g:link action="show" controller = "inscripcion" id="${adeudoInstance.tuplaMaterial?.prestamo?.aval?.id}">${adeudoInstance?.tuplaMaterial?.prestamo?.aval?.alumno?.boleta}</g:link></td>
						
						<!-- Aval Nombre Completo-->
						<td><g:link action="show" controller = "inscripcion" id="${adeudoInstance.tuplaMaterial?.prestamo?.aval?.id}">${adeudoInstance?.tuplaMaterial?.prestamo?.aval?.alumno}</g:link></td>

						<!--Material Adeudado - Nombre -->
						<td><g:link action="show" controller = "material" id="${adeudoInstance?.tuplaMaterial?.material?.id}">${adeudoInstance?.tuplaMaterial?.material?.nombre}</g:link></td>

						<!--Material Adeudado - Código -->
						<td><g:link action="show" controller = "material" id="${adeudoInstance?.tuplaMaterial?.material?.id}">${adeudoInstance?.tuplaMaterial?.material?.codigo}</g:link></td>

						<!--Material Adeudado - Tipo -->
						<td><g:link action="show" controller = "material" id="${adeudoInstance?.tuplaMaterial?.material?.id}">${adeudoInstance?.tuplaMaterial?.material?.tipoMaterial?.tipo}</g:link></td>

						<!--Fecha de Sesión -->
						<td><g:link action = "show" controller = "sesion" id = "${adeudoInstance?.tuplaMaterial?.prestamo?.sesion?.id}">
							<g:formatDate date="${adeudoInstance?.tuplaMaterial?.prestamo?.sesion?.fecha}" formatName = "formato.fecha" />
						</g:link></td>

						<td><g:formatBoolean boolean="${adeudoInstance.saldado}" /></td>				
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adeudoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
