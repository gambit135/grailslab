<%@ page import="lab.Sesion" %>

<html>
	<head>
		
		<div id="header">
			<!--RENDER HEADER TEMPLATE -->
			<g:render template="/header"/> 
		</div>
		
		<!-- SET CONTENT TYPE -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<!-- SETTING LOCAL VARIABLES -->
		<g:set var="entityName" value="Sesión" />

		<!-- PAGE TITLE -->
		<title><g:message code="sesion.show.label" /></title>
	</head>

	</head>
	<body>
		<!-- NAVIGATION MENU -->
		<div class="nav" role="navigation">
			<g:render template="templates/navigation/navShow"/> 
		</div>

		<!-- ACTUAL PAGE CONTENT -->

		<div id="show-sesion" class="content scaffold-show" role="main">

			<!-- MESSAGE CENTER -->
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- LIST OF FIELDS -->
			<ol class="property-list sesion">
				
				<!-- IF FIELD EXISTS -->
				<g:if test="${sesionInstance?.fecha}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="fecha-label" class="property-label"><g:message code="sesion.fecha.label" /></span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="fecha-label">
							<g:datePicker disabled = "true" name="fecha" value="${sesionInstance?.fecha}" precision="minute" />
						</span>
					</li>
				</g:if>	

				<!-- IF FIELD EXISTS -->
				<g:if test="${sesionInstance?.user}">
					
					<!-- LIST ELEMENT -->
					<li class="fieldcontain">
						
						<!-- LABEL OF ELEMENT-->
						<span id="user-label" class="property-label">
							<g:message code="sesion.user.label" />
						</span>
						
						<!-- VALUE OF ELEMENT -->
						<span class="property-value" aria-labelledby="user-label">
							<g:fieldValue disabled="true" bean= "${sesionInstance?.user}" field="name"/>
						</span>
					</li>
				</g:if>	

			</ol>

						
			<!-- specific action pane -->
			<g:form url="[resource:sesionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
				

					<!--DELETE BUTTON-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
		</div>

	</body>
	
</html>