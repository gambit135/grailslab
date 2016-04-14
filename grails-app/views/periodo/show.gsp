<%@ page import="lab.Periodo" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Periodo" />

		<!-- PAGE TITLE -->
		<title><g:message code="periodo.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-periodo" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list periodo">				
				<!-- IF FIELD EXISTS -->
				<g:if test="${periodoInstance?.periodo}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="periodo-label" class="property-label">
							<g:message code="Periodo" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="periodo-label">
							<g:fieldValue bean="${periodoInstance}" field="periodo"/>
						</span>
					</li>
				</g:if>		
			</ol>

		
			<!-- specific action pane -->
			<g:form url="[resource:periodoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<!-- EDIT BUTTON -->
					<g:link class="edit" action="edit" resource="${periodoInstance}">
					<g:message code="default.button.edit.label" default="Edit" /></g:link>

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>