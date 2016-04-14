
<%@ page import="lab.Material" %>
<%@ page import="lab.Estado" %>
<%@ page import="lab.TipoMaterial" %>

<g:if test = "${params.buscarPor != 'manual'}">
</g:if>




<g:if test = "${params.buscarPor == 'manual'}" >

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
</g:if>