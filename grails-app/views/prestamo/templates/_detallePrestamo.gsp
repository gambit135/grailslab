<!--Mostrar aval-->
<div class="fieldcontain">
	<label for="alumnoAval">
		Aval	
	</label>
	${prestamoInstance?.aval?.alumno.apPat + ' ' + prestamoInstance?.aval?.alumno.apMat +' ' + prestamoInstance?.aval?.alumno.nombre}
</div>

<!-- Mostrar alumnos del préstamo-->
<div class="fieldcontain">
	<label>
		Alumnos
	</label>
</div>
<div class="fieldcontain">
	<g:if test = "${prestamoInstance?.inscripciones}">
		<g:if test ="${prestamoInstance?.inscripciones.size() > 0 }">
				<g:each in="${prestamoInstance?.inscripciones?}" status="i" var="inscripcion">
					<!-- No mostrar si ya se encuentran en un préstamo -->
					<!-- implement here "if" -->
		            <label>
						<br>
					</label>
					<g:link class="delete" action="eliminarAlumnoDePrestamo" 
						params="[prestamoInstance: prestamoInstance?.id, inscripcion: inscripcion?.id]">
					<g:message code="Borrar" /></g:link>
	            	${inscripcion?.alumno?.boleta} ${inscripcion?.alumno?.apPat} ${inscripcion?.alumno?.apMat} ${inscripcion?.alumno?.nombre} <br>					
				</g:each>			
		</g:if>
	</g:if>
</div>

<!--Mostrar materiales en el prestamo-->
<div class="fieldcontain">
	<label>
		Materiales en el préstamo
	</label>
</div>
<div class="fieldcontain">
	<g:if test = "${prestamoInstance?.tuplasMaterial}">
		<g:if test ="${prestamoInstance?.tuplasMaterial.size() > 0 }">
				<g:each in="${prestamoInstance?.tuplasMaterial?}" status="i" var="tpm">
		            <label>
						<br>
					</label>
					<g:link class="delete" action="eliminarTuplaDePrestamo" 
						params="[prestamoInstance: prestamoInstance?.id, tuplaMaterial: tpm?.id]">
					<g:message code="Borrar" /></g:link>
	            	${tpm?.material}<br>
					
				</g:each>
			
		</g:if>
	</g:if>
</div>