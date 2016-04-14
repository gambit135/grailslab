
<%@ page import="lab.Adeudo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adeudo.label', default: 'Adeudo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-adeudo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-adeudo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list adeudo">
				<!-- Información del préstamo -->
				<g:if test="${adeudoInstance?.tuplaMaterial}">
					<!-- Aval del préstamo -->
					<fieldset class="form">
						<div class = "fieldcontain">
							<label for="aval">
								Aval		
							</label>
							${adeudoInstance?.tuplaMaterial?.prestamo?.aval?.alumno}<br/><br/>
							<label>
							</label>
							${adeudoInstance?.tuplaMaterial?.prestamo?.aval?.instanciaMateria}<br/><br/>
						</div>

						<!-- Material en deuda -->
						<div class = "fieldcontain">
							<label for="aval">
								Material en deuda		
							</label>
							${adeudoInstance?.tuplaMaterial?.material}<br/><br/>		
						</div>
					</fieldset>
				</g:if>

				<g:if test="${adeudoInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="adeudo.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:fieldValue bean="${adeudoInstance}" field="concepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adeudoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="adeudo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${adeudoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				
				<li class="fieldcontain">
					<span id="saldado-label" class="property-label">Estado</span>
					
						<span class="property-value" aria-labelledby="saldado-label">
							<g:if test="${adeudoInstance?.saldado == true}">
								Saldado
							</g:if>
							<g:else>
								Pendiente
							</g:else>
						</span>
					
				</li>
			
				
			
			</ol>
			<g:form url="[resource:adeudoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${adeudoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
