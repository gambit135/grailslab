
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
						params="[prestamoInstance: prestamoInstance?.id, tuplaMaterial: tpm?.id, accion: 'verMateriales']">
					<g:message code="Quitar" /></g:link>
	            	${tpm?.material}<br>
					
				</g:each>
			
		</g:if>
	</g:if>
</div>

<!--Combo1: mostrar tipos de Materiales-->
<div class="fieldcontain">
	<label for="estado.id">
		Estado del Material	
	</label>
	<g:select name="estado.id" id="estado.id" from="${lab.Estado.list()}" optionKey="id"
                noSelection="['':'Estado']"
                onchange="${remoteFunction (
                        controller: 'material',
                        action: 'cargarTiposMaterial',
                        params: '\'estado.id=\' + this.value',
                        update: 'comboTiposMaterial'
                )}" />
</div>

<!--Combo vacía de tipos de material-->
<div class="fieldcontain">
	<label for="comboTiposMaterial">
		Tipo de Material
	</label>
	<g:select from="${}"id= "comboTiposMaterial" name = "comboTiposMaterial" noSelection="['':'Tipo']" onchange="${remoteFunction (
                        controller: 'material',
                        action: 'cargarMateriales',
                        params:'\'estado.id=\' + document.getElementById(\'estado.id\').value + \'&tipoMaterial.id=\' + this.value',
                        update: 'comboMateriales'
                )}" />
	
</div>

<!--Combo vacía de materiales-->
<div class="fieldcontain">
	<label for="comboMateriales">
		Material
	</label>
	<select id= "comboMateriales" name = "comboMateriales">
		<option>Material</option>
	</select>
</div>