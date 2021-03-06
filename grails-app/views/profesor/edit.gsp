<%@ page import="lab.Profesor" %>

<html>
	<head>
		
		<div id="header">
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Profesor" />

		<!-- PAGE TITLE -->
		<title><g:message code="profesor.edit.label" /></title>

	</head>
	<body>
		<!--NAVIGATION PANEL -->    
	    <div class="nav" role="navigation">
	      <g:render template="templates/navigation/navShow"/> 
	    </div>


		<!-- ACTUAL PAGE CONTENT -->

		<div id="edit-profesor" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profesorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profesorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form url="[resource:profesorInstance, action:'update']" method="PUT" >

				<g:hiddenField name="version" value="${profesorInstance?.version}" />

				<fieldset class="form">
					<!--This renders a template for the profesor fields -->					
					<g:render template="templates/form"/>
				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>

			</g:form>
		</div>

	</body>
	
</html>