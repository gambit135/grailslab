<%@ page import="lab.User" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Usuario" />

		<!-- PAGE TITLE -->
		<title><g:message code="user.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-user" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list user">
				
				<!-- IF FIELD EXISTS -->
				<g:if test="${userInstance?.name}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="name-label" class="property-label"><g:message code="user.name.label" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" 
							field="name"/>
						</span>
					</li>
				</g:if>
			</ol>

			<!-- ADMIN MUST NOT BE EDITABLE NOR DELETABLE-->
			
				<!-- specific action pane -->
				<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						
						<!-- EDIT BUTTON -->
						<g:link class="edit" action="edit" resource="${userInstance}">
						<g:message code="default.button.edit.label" default="Edit" /></g:link>

						<!--DELETE BUTTON-->
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			
		</div>

	</body>
	
</html>