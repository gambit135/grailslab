<%@ page import="lab.Estado" %>

<!--estado-nombre -->
<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="Nombre" />		
	</label>
	<g:textField name="nombre" value="${estadoInstance?.nombre}"/>
</div>

<!--estado-nombre -->
<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="Descripción" />		
	</label>
	<g:textField name="descripcion" value="${estadoInstance?.descripcion}"/>
</div>


