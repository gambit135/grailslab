<%@ page import="lab.Estado" %>

<html>
	<head>
		
		<div id="header">
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Estado" />

		<!-- PAGE TITLE -->
		<title><g:message code="estado.edit.label" /></title>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="Lista de Estados de Material"/></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="edit-estado" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${estadoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${estadoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form url="[resource:estadoInstance, action:'update']" method="PUT" >

				<g:hiddenField name="version" value="${estadoInstance?.version}" />

				<fieldset class="form">
					<!--This renders a template for the estado fields -->					
					<g:render template="templates/form"/>
				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>

			</g:form>
		</div>

	</body>
	
</html>