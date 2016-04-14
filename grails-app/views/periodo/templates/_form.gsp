<%@ page import="lab.Periodo" %>

<!--periodo -->
<div class="fieldcontain ${hasErrors(bean: periodoInstance, field: 'periodo', 'error')} ">
	<label for="periodo">
		<g:message code="Periodo" />		
	</label>
	<g:textField name="periodo" value="${periodoInstance?.periodo}"/>
</div>




