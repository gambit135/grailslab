<%@ page import="lab.Materia" %>

<!--nombre materia -->
<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="Nombre de Materia" />
		
	</label>
	<g:textField name="nombre" value="${materiaInstance?.nombre}"/>
</div>

<!--nivel materia -->
<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'nivel', 'error')} ">
	<label for="nivel">
		<g:message code="Nivel" />
		
	</label>
	<g:textField name="nivel" value="${materiaInstance?.nivel}"/>
</div>




