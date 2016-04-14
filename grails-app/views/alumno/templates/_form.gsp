<%@ page import="lab.Alumno" %>

<!--Boleta alumno -->
<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'boleta', 'error')} ">
	<label for="boleta">
		<g:message code="Boleta" />
		
	</label>
	<g:textField name="boleta" value="${alumnoInstance?.boleta}"/>
</div>

<!--apPat alumno -->
<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apPat', 'error')} ">
	<label for="apPat">
		<g:message code="Apellido Paterno" />
		
	</label>
	<g:textField name="apPat" value="${alumnoInstance?.apPat}"/>
</div>

<!--apMat alumno -->
<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apMat', 'error')} ">
	<label for="apMat">
		<g:message code="Apellido Materno" />
		
	</label>
	<g:textField name="apMat" value="${alumnoInstance?.apMat}"/>
</div>

<!--nombre alumno -->
<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${alumnoInstance?.nombre}"/>
</div>




