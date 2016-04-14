<%@ page import="lab.Profesor" %>

<!--apPat profesor -->
<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'apPat', 'error')} ">
	<label for="apPat">
		<g:message code="Apellido Paterno" />
		
	</label>
	<g:textField name="apPat" value="${profesorInstance?.apPat}"/>
</div>

<!--apMat profesor -->
<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'apMat', 'error')} ">
	<label for="apMat">
		<g:message code="Apellido Materno" />
		
	</label>
	<g:textField name="apMat" value="${profesorInstance?.apMat}"/>
</div>

<!--nombre profesor -->
<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${profesorInstance?.nombre}"/>
</div>




