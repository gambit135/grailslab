<%@ page import="lab.Material" %>

<!-- Tipo Material -->
<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'tipoMaterial', 'error')} required">
	<label for="tipoMaterial">
		<g:message code="Tipo de Material"/>
		<span class="required-indicator">*</span>
	</label>

	<select id="tipoMaterial" name="tipoMaterial.id" >
		<g:each in ="${lab.TipoMaterial.list()}">
			<option value="${it.id}"
			<g:if test="${materialInstance?.tipoMaterial?.id == it?.id}">
				selected = "selected"
			</g:if>
			>${it.tipo}
			</option>
		</g:each>
	</select>

<!--nombre-->
<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="Nombre" />		
	</label>
	<g:textField name="nombre" value="${materialInstance?.nombre}"/>
</div>

<!--codigo-->
<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="Código" />		
	</label>
	<g:textField name="codigo" value="${materialInstance?.codigo}"/>
</div>

<!-- estado -->
<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="Estado" />
		<span class="required-indicator">*</span>
	</label>

	<select id="estado" name="estado.id" >
		<g:each in ="${lab.Estado.list()}">
			<option value="${it.id}"
			<g:if test="${materialInstance?.estado?.id == it?.id}">
				selected = "selected"
			</g:if>
			>${it.nombre}
			</option>
		</g:each>
	</select>

</div>



</div>
