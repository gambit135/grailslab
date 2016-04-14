
<%@ page import="lab.Material" %>
<%@ page import="lab.Estado" %>
<%@ page import="lab.TipoMaterial" %>

<!--Mostrar aval-->
<div class="fieldcontain">
	<label for="alumnoAval">
		Aval	
	</label>
	${prestamoInstance?.aval?.alumno.apPat + ' ' + prestamoInstance?.aval?.alumno.apMat +' ' + prestamoInstance?.aval?.alumno.nombre}
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
					<g:link class="delete" onclick = "return confirm('¿Deseas quitar este material del préstamo?')" action="eliminarTuplaDePrestamo" 
						params="[prestamoInstance: prestamoInstance?.id, tuplaMaterial: tpm?.id, accion: 'registrarTuplasMaterial']">
					<g:message code="Quitar" /></g:link>
	            	${tpm?.material}<br>					
				</g:each>
			
		</g:if>
	</g:if>
</div>