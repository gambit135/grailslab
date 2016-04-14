<%@ page import="lab.TipoMaterial" %>

<!--tipoMaterial-nombre -->
<div class="fieldcontain ${hasErrors(bean: tipoMaterialInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="Tipo de Material" />		
	</label>
	<g:textField name="tipo" value="${tipoMaterialInstance?.tipo}"/>
</div>

<!--tipoMaterial-descripcion -->
<div class="fieldcontain ${hasErrors(bean: tipoMaterialInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="Descripción" />		
	</label>
	<g:textField name="descripcion" value="${tipoMaterialInstance?.descripcion}"/>
</div>


