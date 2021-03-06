<!DOCTYPE html>
<html>
	<head>
		<div id="header">
			<g:render template="/header"/> 
		</div>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'Tipo de Material', default: 'Tipo Material')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		 <!--NAVIGATION PANEL -->    
    	<g:render template="templates/navigation/navCreate"/> 
		
		<div id="create-tipoMaterial" class="content scaffold-create" role="main">
			<h1>Crear Tipo de Material</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${tipoMaterialInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${tipoMaterialInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:tipoMaterialInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="templates/form"/>
				</fieldset>

				

				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
