
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
		Seleccionar materiales adeudados
	</label>
</div>
<div class="fieldcontain">
	<g:if test = "${prestamoInstance?.tuplasMaterial}">
		<g:if test ="${prestamoInstance?.tuplasMaterial.size() > 0 }">
				<g:each in="${prestamoInstance?.tuplasMaterial?}" status="i" var="tpm">
		            <label>
						<br>
					</label>
					<g:checkBox id = "check${i}" name = "tuplaId.${tpm.id}" value = "on" checked = "false" />
	            	${tpm?.material}<br>
	            	
				</g:each>
			
		</g:if>
	</g:if>
</div>
