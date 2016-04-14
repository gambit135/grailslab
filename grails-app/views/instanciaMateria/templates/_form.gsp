<%@ page import="lab.InstanciaMateria" %>


<!-- Materia -->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'materia', 'error')} required">
	<label for="materia">
		<g:message code="materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	</label>

	<select id="materia" name="materia.id" >
		<g:each in ="${lab.Materia.list()}">

			<option value="${it.id}"

			<g:if test="${instanciaMateriaInstance?.materia?.id == it?.id}">
				selected = "selected"
			</g:if>
			>${it.nombre}
			</option>
		</g:each>
	</select>

</div>

<!--Grupo-->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'grupo', 'error')} ">
	<label for="grupo">
		<g:message code="Grupo" />		
	</label>
	<g:textField name="grupo" value="${instanciaMateriaInstance?.grupo}"/>
</div>

<!--Dia de la semana-->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'diaDeLaSemana', 'error')} ">
	<label for="diaDeLaSemana">
		<g:message code="instanciaMateria.DiaDeLaSemana.label" />		
	</label>

	<g:select name="diaDeLaSemana" from="${['lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado']}" valueMessagePrefix="ENUM.DiasSemana" value = "${instanciaMateriaInstance?.diaDeLaSemana}" />
</div>

<!--Hora -->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'hora', 'error')} ">
	<label for="hora">
		<g:message code="instanciaMateria.hora.label" />
	</label>
	<g:select name="hora" from="${['1', '2', '3', '4', '5', '6', '7', '8', '9']}" valueMessagePrefix="ENUM.horasDeClase" 
	value = "${instanciaMateriaInstance?.hora}" />	
</div>

<!--Profesor Titular -->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'titular', 'error')}">
	<label for="titular">
		<g:message code="Profesor Titular" />		
	</label>
	<select id="titular" name="titular.id" >
		<g:each in ="${lab.Profesor.list()}">

			<option value="${it.id}"

			<g:if test="${instanciaMateriaInstance?.titular?.id == it?.id}">
				selected = "selected"
			</g:if>
			>${it.apPat} ${it.apMat} ${it.nombre}
			</option>
		</g:each>
	</select>
</div>

<!--Profesor Auxiliar -->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'auxiliar', 'error')}">
	<label for="auxiliar">
		<g:message code="Profesor Auxiliar" />		
	</label>
	<select id="auxiliar" name="auxiliar.id" >
		<g:each in ="${lab.Profesor.list()}">
			<option value="${it.id}"
			<g:if test="${instanciaMateriaInstance?.auxiliar?.id == it?.id}">
				selected = "selected"
			</g:if>

			>${it.apPat} ${it.apMat} ${it.nombre}</option>
		</g:each>
	</select>
</div>

<!--Periodo-->
<div class="fieldcontain ${hasErrors(bean: instanciaMateriaInstance, field: 'periodo', 'error')}">
	<label for="periodo">
		<g:message code="Periodo" />		
	</label>
	<select id="periodo" name="periodo.id" >
		<g:each in ="${lab.Periodo.list()}">
			<option value="${it.id}"

			<g:if test="${instanciaMateriaInstance?.periodo?.id == it?.id}">
				selected = "selected"
			</g:if>


			>${it.periodo}</option>
		</g:each>
	</select>
</div>



