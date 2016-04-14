<%@ page import="lab.Inscripcion" %>



<!--Alumno -->
<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'alumno', 'error')}">
	<label for="alumno">
		<g:message code="Alumno" />		
	</label>
	<select id="alumno" name="alumno.id" >
		<g:each in ="${lab.Alumno.list().sort()}">
			<option value="${it.id}"

			<g:if test="${inscripcionInstance?.alumno?.id == it?.id}">
				selected = "selected"
			</g:if>

			>${it.boleta} ${it.apPat} ${it.apMat} ${it.nombre}</option>
		</g:each>
	</select>
</div>

<!--Instancia Materia -->
<div class="fieldcontain ${hasErrors(bean: inscripcionInstance, field: 'instanciaMateria', 'error')}">
	<label for="instanciaMateria">
		<g:message code="Instancia de Materia" />		
	</label>
	<select id="instanciaMateria" name="instanciaMateria.id" >
		<g:each in ="${lab.InstanciaMateria.list()}">
			<option value="${it.id}"

			<g:if test="${inscripcionInstance?.instanciaMateria?.id == it?.id}">
				selected = "selected"
			</g:if>

			>${it.grupo} ${it.materia}</option>
		</g:each>
	</select>
</div>



