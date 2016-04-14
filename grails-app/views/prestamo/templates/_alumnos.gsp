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
					<g:link class="delete" onclick = "return confirm('¿Deseas quitar este alumno del préstamo?')" action="eliminarAlumnoDePrestamo" 
						params="[prestamoInstance: prestamoInstance?.id, inscripcion: inscripcion?.id, accion: 'registrarAlumnos']">
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

		 <g:each in ="${lab.Inscripcion.findAllByInstanciaMateria(prestamoInstance?.aval?.instanciaMateria,[sort: 'alumno.apPat'] )}" var = "alumno1">

			<!-- No mostrar al aval de este préstamo, pues ya se encuentra en el préstamo -->
			<g:if test="${prestamoInstance?.aval?.id != alumno1?.id}">
				<!-- No mostrar a los alumnos del préstamo actual como elegibles -->
				<g:if test="${!prestamoInstance?.inscripciones?.contains(alumno1)}">
					
					<!-- Tampoco mostrar a los alumnos que se encuentran en otros préstamos abiertos -->
					<g:set var="existeEnOtroPrestamo" value = "${false}"/>
					
					<!-- Para cada uno de los préstamos abiertos -->
					<g:each in="${lab.Prestamo.findAllByConcluido(false)}" var = "p1">
						
						<!--Para los prestamos del mismo grupo que el aval -->
						<g:if test = "${prestamoInstance?.aval?.instanciaMateria?.id == p1?.aval?.instanciaMateria?.id}">
							
							<!-- Si es el aval de alguno de los préstamos abiertos -->
							<g:if test = "${p1?.aval?.id == alumno1?.id }">
								<g:set var="existeEnOtroPrestamo" value = "${true}"/>
							</g:if>

							<!-- Para cada una de sus inscripciones -->
							<g:each in="${p1?.inscripciones}" var= "ins1">
								
								<!--Si alguna de sus inscripciones es igual al alumno1 -->
								<g:if test = "${ins1?.id == alumno1?.id }">
									<g:set var="existeEnOtroPrestamo" value = "${true}"/>
									<!-- break -->
								</g:if>
							</g:each>
						</g:if>
					</g:each>

					<!-- Tampoco mostrar a los alumnos que se tienen adeudos -->
					<g:set var="debeMaterial" value = "${false}"/>

					<!-- Para cada uno de los adeudos no saldados -->
					<g:each in="${lab.Adeudo.findAllBySaldado(false)}" var = "a1">
						<!-- Si el aval del préstamo de la tuplaMaterial del adeudo es igual al alumno1-->
						<g:if test = "${a1?.tuplaMaterial?.prestamo?.aval?.id == alumno1?.id}">
							<g:set var="debeMaterial" value = "${true}"/>
							<!-- break-->
						</g:if>
					</g:each>

					<g:if test = "${existeEnOtroPrestamo == false}">
						<!-- Esto sólo vale si son avales -->
						<!-- <g:if test = "${debeMaterial == false}"> -->
							<option value="${alumno1.id}">${alumno1}</option>
						</g:if>
					</g:if>
				</g:if>
			</g:if>
		</g:each>
	</select>
</div>