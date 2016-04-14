<%@ page import="lab.Sesion" %>

<!--Fecha sesion -->
	<label for="fecha">
		<g:message code="sesion.fecha.label" />		
	</label>
	<g:datePicker disabled="true" name="fecha" value="${sesionInstance?.fecha}" precision="minute"  />

<br>
<!--User -->
	<label for="user">
		<g:message code="sesion.user.label" />		
	</label>

	<g:if test="${sesion?.user}">
		<g:fieldValue disabled="true" bean= "sesion?.user" field="name"/>
	</g:if>
	<g:else>
		<g:if test="${session?.user}">
			<g:textField disabled = "true" name="user" value="${session?.user?.name}"/>
		</g:if>
	</g:else>

