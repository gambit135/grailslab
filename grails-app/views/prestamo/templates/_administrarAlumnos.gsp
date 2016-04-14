<%@ page import="lab.Prestamo" %>

<!--Mostrar aval-->
<div class="fieldcontain">
	<label for="alumnoAval">
		Aval	
	</label>
	${prestamoInstance?.aval?.alumno.apPat + ' ' + prestamoInstance?.aval?.alumno.apMat +' ' + prestamoInstance?.aval?.alumno.nombre}	
</div>

<div class="fieldcontain">
	<label>
		Alumnos<br>
	</label>
</div>
<!-- Mostrar alumnos del préstamo-->
<div class="fieldcontain">
	<g:if test = "${prestamoInstance?.inscripciones}">
		<g:if test ="${prestamoInstance?.inscripciones.size() > 0 }">
				<g:each in="${prestamoInstance?.inscripciones?}" status="i" var="inscripcion">
					<!-- No mostrar si ya se encuentran en un préstamo -->
					<!-- implement here "if" -->
		            <label>
						<br>
					</label>
					<g:link onclick = "return confirm('¿Deseas quitar este alumno del préstamo?')" class="delete" action="eliminarAlumnoDePrestamo" 
						params="[prestamoInstance: prestamoInstance?.id, inscripcion: inscripcion?.id, accion: 'verAlumnos']">
					<g:message code="Quitar" /></g:link>
	            	${inscripcion?.alumno?.boleta} ${inscripcion?.alumno?.apPat} ${inscripcion?.alumno?.apMat} ${inscripcion?.alumno?.nombre} <br>
					
				</g:each>
			
		</g:if>
	</g:if>
</div>

<!-- Mostrar alumnos admisibles para el préstamo> -->
<!-- sólo alumnos de la misma materia que el aval -->
<div class="fieldcontain">
	<label for="alumno">
		Agregar Alumno	
	</label>

	<select id="alumno" name="alumno" >
		<g:each in ="${lab.Inscripcion.findAllByInstanciaMateria(prestamoInstance?.aval?.instanciaMateria,[sort: 'alumno.apPat'] )}">			
			<g:if test="${prestamoInstance?.aval?.id != it?.id}">
				<g:if test="${!prestamoInstance?.inscripciones?.contains(it)}">
					<option value="${it.id}">${it}</option>
				</g:if>
			</g:if>
		</g:each>
	</select>
</div>